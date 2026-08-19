package io.github.taybct.module.lf.controller;

import io.github.taybct.module.lf.domain.Nodes;
import io.github.taybct.module.lf.service.INodesService;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author XiJieYin <br> 2023/7/25 16:36
 */
@Tag(name = "流程节点控制器")
@RequestMapping("{version}/nodes")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class NodesController {

    final INodesService nodesService;

    public INodesService getNodesService() {
        return nodesService;
    }

    @Operation(summary = "流程节点详情")
    @GetMapping("{id}")
    @Parameter(name = "id", description = "节点 id", required = true, in = ParameterIn.PATH)
    @WebLog
    public R<Nodes> detail(@PathVariable String id) {
        return R.data(getNodesService().getById(id));
    }
}
