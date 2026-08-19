package io.github.taybct.module.system.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.convert.Convert;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.github.taybct.api.system.domain.SysDept;
import io.github.taybct.api.system.dto.SysDeptQueryDTO;
import io.github.taybct.api.system.mapper.SysDeptMapper;
import io.github.taybct.api.system.vo.DeptUserTreeVO;
import io.github.taybct.api.system.vo.SysDeptTreeVO;
import io.github.taybct.module.system.service.ISysDeptService;
import io.github.taybct.tool.core.bean.ILoginUser;
import io.github.taybct.tool.core.bean.service.BaseServiceImpl;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.core.util.StringUtil;
import io.github.taybct.tool.core.util.tree.TreeUtil;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * 针对表【sys_dept(部门)】的数据库操作Service实现
 *
 * @author admin 2023-06-08 14:00:20
 */
@AutoConfiguration
@Service
public class SysDeptServiceImpl extends BaseServiceImpl<SysDeptMapper, SysDept>
        implements ISysDeptService {

    @Override
    public List<DeptUserTreeVO> deptUserTreeByCondition(JSONObject dto, boolean makeTree, boolean includeUser) {
        if (!dto.containsKey("keyWord")) {
            return new ArrayList<>();
        }
        String keyWord = dto.getString("keyWord");
        List<Long> deptId = getBaseMapper().selectList(Wrappers.<SysDept>lambdaQuery()
                        .select(SysDept::getId)
                        .like(SysDept::getName, keyWord))
                .stream().map(SysDept::getId).toList();
        List<Long> userDeptId = includeUser ? getBaseMapper().getDeptIdsByUserNickname(keyWord) : new ArrayList<>();
        return deptUserTree(new HashSet<>(CollectionUtil.union(deptId, userDeptId)), makeTree, includeUser);
    }

    @Override
    public List<DeptUserTreeVO> deptUserTree(Set<Long> deptIdSet, boolean includeUser) {
        return deptUserTree(deptIdSet, true, includeUser);
    }

    @Override
    public List<DeptUserTreeVO> deptUserTree(Set<Long> deptIdSet, boolean makeTree, boolean includeUser) {
        if (CollectionUtil.isEmpty(deptIdSet)) {
            return new ArrayList<>();
        }
        List<SysDept> sysDeptList = getBaseMapper().selectList(Wrappers.<SysDept>lambdaQuery()
                .select(SysDept::getId, SysDept::getPidAll)
                .in(SysDept::getId, deptIdSet));
        // 直接顶级部门的部门 id 集合（不包含最顶级的）
        Set<Long> deptIdSetUntilTop = sysDeptList.stream()
                .map(SysDept::getPidAll)
                .filter(StringUtil::isNotBlank)
                .flatMap(s -> Arrays.stream(s.split(",")))
                .map(Convert::toLong)
                .filter(i -> i != null && !i.equals(0L))
                .collect(Collectors.toSet());
        deptIdSet.addAll(deptIdSetUntilTop);
        return makeTree ? TreeUtil.tree(getBaseMapper().deptUserTree(deptIdSet, includeUser), "d_0") : getBaseMapper().deptUserTree(deptIdSet, includeUser);
    }

    @Override
    public List<SysDeptTreeVO> tree(SysDeptQueryDTO dto, Long deptFilter) {
        ILoginUser loginUser = securityUtil.getLoginUser();
        return getBaseMapper().tree(dto
                , loginUser.getUserId()
                , loginUser.checkAuthorities()
                , loginUser.checkRoot()
                , Convert.toStr(deptFilter));
    }

    @Override
    public IPage<? extends SysDept> page(SysDeptQueryDTO dto, IPage<?> page, SqlPageParams pageParams) {
        pageParams.allowedSort(SysDept.class);
        ILoginUser loginUser = securityUtil.getLoginUser();
        // 排序字段
        String pageOrder = pageParams.getPageOrder();
        return getBaseMapper().deptFilterPage(page
                , pageOrder
                , dto
                , loginUser.getUserId()
                , loginUser.checkAuthorities()
                , loginUser.checkRoot());
    }

    @Async
    @Transactional(rollbackFor = Throwable.class)
    @Override
    public void tidyUpPidAll() {
        List<SysDept> allDeptList = list();
        if (CollectionUtil.isEmpty(allDeptList)) {
            return;
        }
        Map<Long, SysDept> tempMap = new ConcurrentHashMap<>();
        allDeptList.forEach(sysDept -> tempMap.put(sysDept.getId(), sysDept));
        updateBatchById(allDeptList.stream()
                .peek(sysDept ->
                        sysDept.setPidAll(CollectionUtil.join(CollectionUtil.reverse(new ArrayList<>(findAllPid(new LinkedHashSet<>(), sysDept.getPid(), tempMap))), ","))).toList());
    }

    /**
     * 找到所有的父级
     *
     * @param pidAllSet 默认给个空的集合
     * @param pid       第一个父级
     * @param tempMap   所有的数据
     * @return 最终获取到的所有的父级
     */
    private static LinkedHashSet<Long> findAllPid(LinkedHashSet<Long> pidAllSet, Long pid, Map<Long, SysDept> tempMap) {
        return Optional.ofNullable(pid).map(id -> {
                    pidAllSet.add(id);
                    return findAllPid(pidAllSet, tempMap.containsKey(id) ? tempMap.get(id).getPid() : null, tempMap);
                })
                .orElse(pidAllSet);
    }

}
