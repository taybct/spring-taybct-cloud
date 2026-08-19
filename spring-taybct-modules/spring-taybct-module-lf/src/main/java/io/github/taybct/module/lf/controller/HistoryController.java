package io.github.taybct.module.lf.controller;

import io.github.taybct.module.lf.dto.HistoryListQueryDTO;
import io.github.taybct.module.lf.service.ILfHistoryService;
import io.github.taybct.module.lf.vo.HistoryListVO;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author XiJieYin <br> 2023/7/25 16:36
 */
@RestController
@Tag(name = "历史记录控制器")
@RequestMapping("{version}/history")
@ApiVersion
@RequiredArgsConstructor
public class HistoryController {

    final ILfHistoryService lfHistoryService;

    public ILfHistoryService getLfHistoryService() {
        return lfHistoryService;
    }

    @Operation(summary = "流程历史记录列表")
    @PostMapping("list")
    public R<List<HistoryListVO>> historyList(@RequestBody HistoryListQueryDTO dto) {
        return R.data(getLfHistoryService().historyList(dto));
    }
}
