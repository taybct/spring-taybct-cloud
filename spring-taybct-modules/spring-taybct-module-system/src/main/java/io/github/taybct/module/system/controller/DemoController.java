package io.github.taybct.module.system.controller;

import com.alibaba.fastjson2.JSONObject;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.ILoginUser;
import io.github.taybct.tool.core.bean.ISecurityUtil;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author XiJieYin <br> 2024/5/13 16:25
 */
@RestController
@RequestMapping("demo")
@Slf4j
@RequiredArgsConstructor
public class DemoController {

    final ISecurityUtil securityUtil;

    @GetMapping("test1/{name}")
    @ApiLog(title = "test1", description = "test1", type = OperateType.QUERY)
    public R<?> test1(@PathVariable String name) {
        return R.data(name);
    }

    @PostMapping("testSchedule1")
    @Operation(summary = "任务调度测试任务1")
    @WebLog
    public R<?> testSchedule1(@RequestParam Map<String, String> params, @RequestBody Map<String, Object> body){
        ILoginUser loginUser = securityUtil.getLoginUser();
        log.info("任务调度测试任务1, 当前用户: {}", loginUser.getUsername());
        params.forEach((k, v) -> System.out.println(k + ":" + v));
        body.forEach((k, v) -> System.out.println(k + ":" + v));
        return R.data(JSONObject.of("params", params, "body", body));
    }

    @PostMapping("testSchedule2")
    @Operation(summary = "任务调度测试任务2")
    @WebLog
    public R<?> testSchedule2(@RequestParam Map<String, String> params, @RequestBody Map<String, Object> body){
        ILoginUser loginUser = securityUtil.getLoginUser();
        log.info("任务调度测试任务2, 当前用户: {}", loginUser.getUsername());
        params.forEach((k, v) -> System.out.println(k + ":" + v));
        body.forEach((k, v) -> System.out.println(k + ":" + v));
        return R.data(JSONObject.of("params", params, "body", body));
    }

}
