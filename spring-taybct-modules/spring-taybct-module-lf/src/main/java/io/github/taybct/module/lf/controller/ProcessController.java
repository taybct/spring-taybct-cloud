package io.github.taybct.module.lf.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.module.lf.domain.Process;
import io.github.taybct.module.lf.dto.NodesSubmitDTO;
import io.github.taybct.module.lf.dto.ProcessNewDTO;
import io.github.taybct.module.lf.dto.TodoListQueryDTO;
import io.github.taybct.module.lf.dto.UserRequestListQueryDTO;
import io.github.taybct.module.lf.service.*;
import io.github.taybct.module.lf.vo.ProcessListVO;
import io.github.taybct.module.lf.vo.TodoListCountVO;
import io.github.taybct.module.lf.vo.UnOperator;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * @author XiJieYin <br> 2023/7/25 16:36
 */
@RestController
@Tag(name = "流程控制器")
@RequestMapping("{version}/process")
@ApiVersion
@RequiredArgsConstructor
public class ProcessController {

    final IProcessService processService;
    final INodesService nodesService;
    final IEdgesService edgesService;
    final IPresentProcessService presentProcessService;
    final ILfHistoryService lfHistoryService;
    final ITodoService todoService;

    public IProcessService getProcessService() {
        return processService;
    }

    public INodesService getNodesService() {
        return nodesService;
    }

    public IEdgesService getEdgesService() {
        return edgesService;
    }

    public IPresentProcessService getPresentProcessService() {
        return presentProcessService;
    }

    public ILfHistoryService getLfHistoryService() {
        return lfHistoryService;
    }

    public ITodoService getTodoService() {
        return todoService;
    }

    @Operation(summary = "新建一个流程")
    @PostMapping("new")
    public R<?> newProcess(@RequestBody @Valid @NotNull ProcessNewDTO process) {
        return getProcessService().newProcess(process
                , this::getNodesService
                , this::getEdgesService
                , this::getLfHistoryService
                , this::getPresentProcessService
                , this::getTodoService) ? R.ok() : R.fail("创建申请失败！");
    }

    @Operation(summary = "待办/已办统计")
    @GetMapping("todoListCount/{status}")
    @Parameter(name = "status", description = "状态", required = true, in = ParameterIn.PATH)
    public R<TodoListCountVO> todoListCount(@PathVariable Byte status) {
        return R.data(getTodoService().todoListCount(status));
    }

    @Operation(summary = "我的待办/已办")
    @PostMapping("todoList")
    public R<IPage<ProcessListVO>> todoList(@RequestBody TodoListQueryDTO dto, SqlPageParams sqlPageParams) {
        return R.data(getTodoService().todoList(dto, sqlPageParams));
    }

    @Operation(summary = "查询未操作者(流程的未操作者)")
    @PostMapping("unOperators")
    public R<List<UnOperator>> queryUnOperators(@RequestBody Set<Long> processIdSet) {
        return R.data(getTodoService().queryUnOperators(processIdSet));
    }

    @Operation(summary = "我的请求")
    @PostMapping("userRequestList")
    public R<IPage<ProcessListVO>> userRequestList(@RequestBody UserRequestListQueryDTO dto, SqlPageParams sqlPageParams) {
        return R.data(getProcessService().userRequestList(dto, sqlPageParams));
    }

    @Operation(summary = "用户提交待办")
    @PostMapping("userSubmit")
    public R<?> userSubmit(@RequestBody NodesSubmitDTO nodes) {
        return getProcessService().userSubmit(nodes
                , this::getNodesService
                , this::getEdgesService
                , this::getLfHistoryService
                , this::getPresentProcessService
                , this::getTodoService) ? R.ok() : R.fail("提交失败！");
    }

    @Operation(summary = "流程详情")
    @GetMapping("{id}")
    @Parameter(name = "id", description = "流程 id", required = true, in = ParameterIn.PATH)
    public R<Process> detail(@PathVariable Long id) {
        return R.data(getProcessService().getById(id));
    }
}
