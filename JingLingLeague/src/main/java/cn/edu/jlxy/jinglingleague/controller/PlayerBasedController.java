package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.entity.Player;
import cn.edu.jlxy.jinglingleague.service.IPlayerBasedService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by neo on 2017/2/28.
 */
@Controller
@RequestMapping("/playerBased")
public class PlayerBasedController {
    @Resource
    IPlayerBasedService service;

    @RequestMapping("/register")
    public void register(@RequestParam String pName,@RequestParam String pPassword, HttpServletResponse response) throws IOException {
        PrintWriter out =response.getWriter();

        Player player=new Player();
        player.setpName(pName);
        player.setpPassword(pPassword);
        if(service.register(player)){
            out.print("register success");
        }else {
            out.print("register failed");
        }

        out.flush();
        out.close();
    }

    @RequestMapping("/login")
    public void login(@RequestParam String pName,@RequestParam String pPassword, HttpServletResponse response) throws IOException{
        PrintWriter out =response.getWriter();

        Player player=new Player();
        player.setpName(pName);
        player.setpPassword(pPassword);
        if(service.login(player) != null){
            out.print("login success");
        }else {
            out.print("login failed");
        }

        out.flush();
        out.close();
    }
}
