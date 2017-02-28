package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.entity.SysUser;
import cn.edu.jlxy.jinglingleague.service.ISysUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by neo on 2017/2/28.
 */
@Controller
@RequestMapping("/sysuser")
public class SysUserController {

    @Resource
    ISysUserService service;

    @RequestMapping("/save")
    public void sysuser_save(@RequestParam String uName,@RequestParam Integer uAge,HttpServletResponse response) throws IOException {
        service.saveWithMybatis(uName,uAge);
        System.out.println("save success");
        PrintWriter out = response.getWriter();
        out.print("save success");
        out.flush();
        out.close();
    }

    @RequestMapping("/all")
    public void sysuser_selectall(HttpServletResponse response) throws IOException {
        List<SysUser> userList = service.selectAllWithMybatis();
        PrintWriter out = response.getWriter();
        for (SysUser sysUser : userList) {
            System.out.println(sysUser.toString());
            out.println(sysUser.toString());
        }
        out.flush();
        out.close();
    }

    private void send_json_message(HttpServletResponse response, String json){

    }
}
