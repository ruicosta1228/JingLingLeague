package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.entity.user.UserBase;
import cn.edu.jlxy.jinglingleague.entity.user.UserSecure;
import cn.edu.jlxy.jinglingleague.service.IUserService;
import cn.edu.jlxy.jinglingleague.util.MD5Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by neo on 2017/4/9.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    IUserService service;

    //http://localhost:8080/JingLingLeague/user/login_normal.json?input=孙一飞&password=123456
    @RequestMapping("/login_normal")
    public void login_normal(@RequestParam String input, @RequestParam String password, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        UserSecure userSecure = new UserSecure();
        userSecure.setPassword(MD5Util.getMD5Code(password));
        UserBase userBase = new UserBase();
        //允许输入用户名或电话号码登录
        userBase.setpName(input);
        userBase.setpTelephone(input);

        if((service.login(userSecure,userBase)) != null){
            String access_key = service.login(userSecure,userBase);
            int pid = userSecure.getPid();
            out.print("{\"access_key\":" + "\"" +access_key + "\"" + ",\"pid\":"+ "\"" + pid + "\"" +"}");
        } else {
            response.sendError(403);
        }
    }

    //http://localhost:8080/JingLingLeague/user/login_weibo.json?name=松饼人儿&selfi=localhost
    @RequestMapping("/login_weibo")
    public void login_weibo(@RequestParam String name, @RequestParam String selfi, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        UserBase userBase = new UserBase();
        userBase.setpName(name);
        userBase.setpSelfi(selfi);

        if (service.loginByWeibo(userBase) != null) {
            String access_key = service.loginByWeibo(userBase);
            int pid = userBase.getPid();
            out.print("{\"access_key\":" + "\"" +access_key + "\"" + ",\"pid\":"+ "\"" + pid + "\"" +"}");
        }else {
            response.sendError(403);
        }
    }

    @RequestMapping("/register")
    public void register(@RequestParam String name, @RequestParam String password, HttpServletResponse response) throws  IOException{
        PrintWriter out = response.getWriter();

        UserBase userBase = new UserBase();
        userBase.setpName(name);

        UserSecure userSecure = new UserSecure();
        userSecure.setPassword(MD5Util.getMD5Code(password));

        if(service.register(userSecure,userBase)){
            out.print("{\"register_status\":" + "\"success\"}");
        }else {
            out.print("{\"register_status\":" + "\"failure\"}");
        }
    }
}
