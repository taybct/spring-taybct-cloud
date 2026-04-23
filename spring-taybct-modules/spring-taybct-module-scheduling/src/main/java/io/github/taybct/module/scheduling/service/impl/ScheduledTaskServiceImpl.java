package io.github.taybct.module.scheduling.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.taybct.module.scheduling.domain.ScheduledTask;
import io.github.taybct.module.scheduling.mapper.ScheduledTaskMapper;
import io.github.taybct.module.scheduling.service.IScheduledTaskService;
import io.github.taybct.module.scheduling.vo.ScheduledTaskVO;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.scheduling.service.ISchedulingService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 针对表【scheduled_task(调度任务)】的数据库操作Service实现
 *
 * @author 24154
 */
@Service
@AutoConfiguration
@RequiredArgsConstructor
public class ScheduledTaskServiceImpl extends ServiceImpl<ScheduledTaskMapper, ScheduledTask>
        implements IScheduledTaskService {

    final ISchedulingService schedulingService;

    @Override
    public IPage<ScheduledTaskVO> taskPage(Map<String, Object> sqlPageParams) {
        SqlPageParams pageParams = SqlPageParams.of(sqlPageParams);
        pageParams.allowedSort(ScheduledTask.class);
        Wrapper<ScheduledTask> queryWrapper = pageParams.genQueryWrapper(JSONObject.parseObject(JSONObject.toJSONString(sqlPageParams)).toJavaObject(getEntityClass()));
        IPage<ScheduledTask> scheduledTaskPage = page(pageParams.genPage(), queryWrapper);
        Page<ScheduledTaskVO> scheduledTaskVoPage = new Page<>();

        scheduledTaskVoPage.setTotal(scheduledTaskPage.getTotal());
        scheduledTaskVoPage.setCurrent(scheduledTaskPage.getCurrent());
        scheduledTaskVoPage.setSize(scheduledTaskPage.getSize());

        List<ScheduledTask> records = scheduledTaskPage.getRecords();
        List<ScheduledTaskVO> scheduledTaskVoS = BeanUtil.copyToList(records, ScheduledTaskVO.class);
        scheduledTaskVoS.forEach(task -> {
            String taskKey = task.getTaskKey();
            //是否启动标记处理
            task.setStartFlag(schedulingService.isStart(taskKey) ? 1 : 0);
        });
        scheduledTaskVoPage.setRecords(scheduledTaskVoS);
        return scheduledTaskVoPage;
    }

    @Override
    public List<ScheduledTask> getAllNeedStartTask() {
        return getBaseMapper().getAllNeedStartTask();
    }
}




