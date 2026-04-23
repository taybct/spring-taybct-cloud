package io.github.taybct.module.lf.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.taybct.module.lf.domain.Nodes;
import io.github.taybct.module.lf.mapper.NodesMapper;
import io.github.taybct.module.lf.service.INodesService;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Service;

/**
 * @author admin
 * <br>description 针对表【lf_nodes(流程节点)】的数据库操作Service实现
 * @since 2023-07-03 11:32:23
 */
@AutoConfiguration
@Service
public class NodesServiceImpl extends ServiceImpl<NodesMapper, Nodes>
        implements INodesService {

}




