package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.service.IAbilityService;
import cn.edu.jlxy.jinglingleague.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by neo on 2017/6/11.
 */
@Controller
@RequestMapping("/ability")
public class AbilityController {
    @Resource
    IAbilityService service;

    @RequestMapping("/getAbility")
    public void getAbilityById(@RequestParam int pid, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        out.print(JsonUtils.objectToJson(service.getAbilityById(pid)));
    }
}
