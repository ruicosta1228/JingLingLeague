package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.dao.IMatchDao;
import cn.edu.jlxy.jinglingleague.service.IScheduleService;
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
@RequestMapping("/schedule")
public class ScheduleController {

    @Resource
    IScheduleService service;

    @RequestMapping("/getAllMatch")
    public void getAllMatch(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        out.print(JsonUtils.objectToJson(service.getAllMatch()));
    }
}
