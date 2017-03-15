package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.dto.PlayerLoginDto;
import cn.edu.jlxy.jinglingleague.entity.Player;
import cn.edu.jlxy.jinglingleague.service.IPlayerBasedService;
import cn.edu.jlxy.jinglingleague.service.IPlayerSpecificService;
import cn.edu.jlxy.jinglingleague.util.*;
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
    IPlayerBasedService basedService;
    @Resource
    IPlayerSpecificService specService;

    @RequestMapping("/register")
    public void register(@RequestParam String pName,@RequestParam String pPassword, HttpServletResponse response) throws IOException {
        PrintWriter out =response.getWriter();

        Player player=new Player();
        player.setpName(pName);
        player.setpPassword(MD5Util.getMD5Code(pPassword));
        if(basedService.register(player) && specService.createEmptyInfo(player.getpId())){
            out.print("{\"status\":\"success\"}");
        }else {
            out.print("{\"status\":\"fail\"}");
        }

        out.flush();
        out.close();
    }

    @RequestMapping("/login")
    public void login(@RequestParam String pName,@RequestParam String pPassword, HttpServletResponse response) throws IOException{
        PrintWriter out =response.getWriter();
        String status = Constants.FAIL;

        Player player=new Player();
        PlayerLoginDto dto =new PlayerLoginDto();
        if (!StringUtils.isEmpty(pName) && !StringUtils.isEmpty(pPassword)){
            player= basedService.login(new Player(pName,MD5Util.getMD5Code(pPassword)));
            if (player != null){
                status = Constants.SUCCESS;
            }
        }
        dto.setStatus(status);
        dto.setPlayer(player);
        out.print(JsonUtils.objectToJson(dto));

        out.flush();
        out.close();
    }

    @RequestMapping("/updatePwd")
    public void updatePwd(@RequestParam Integer pId, @RequestParam String pName,@RequestParam String pPassword, HttpServletResponse response) throws IOException{
        PrintWriter out =response.getWriter();

        Player player=new Player();
        player.setpId(pId);
        player.setpName(pName);
        player.setpPassword(MD5Util.getMD5Code(pPassword));

        if(basedService.updatePwd(player)){
            out.print("{\"status\":\"success\"}");
        }else {
            out.print("{\"status\":\"fail\"}");
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/deletePlayer")
    public void deletePlayer(@RequestParam Integer pId, HttpServletResponse response) throws IOException {
        PrintWriter out =response.getWriter();

        if (basedService.deletePlayer(pId)){
            out.print("{\"status\":\"success\"}");
        }else {
            out.print("{\"status\":\"fail\"}");
        }
        out.flush();
        out.close();
    }
}
