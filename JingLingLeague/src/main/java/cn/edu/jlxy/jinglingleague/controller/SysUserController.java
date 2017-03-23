package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.dto.TeamAllDto;
import cn.edu.jlxy.jinglingleague.entity.SysUser;
import cn.edu.jlxy.jinglingleague.entity.Team;
import cn.edu.jlxy.jinglingleague.service.ISysUserService;
import cn.edu.jlxy.jinglingleague.service.ITeamService;
import cn.edu.jlxy.jinglingleague.util.Constants;
import cn.edu.jlxy.jinglingleague.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    ISysUserService sysUserService;

    @Resource
    ITeamService teamService;

    @RequestMapping("/save")
    public void sysuser_save(@RequestParam String uName,@RequestParam Integer uAge,HttpServletResponse response) throws IOException {
        sysUserService.saveWithMybatis(uName,uAge);
        System.out.println("save success");
        PrintWriter out = response.getWriter();
        out.print("{\"status\":\"success\"}");
        out.flush();
        out.close();
    }

    @RequestMapping("/all")
    public void sysuser_selectall(HttpServletResponse response) throws IOException {
        List<SysUser> userList = sysUserService.selectAllWithMybatis();
        PrintWriter out = response.getWriter();
        for (SysUser sysUser : userList) {
            System.out.println(sysUser.toString());
            out.println(sysUser.toString());
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/createTeam")
    public void createTeam(@RequestParam String tName, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        Team team = new Team();
        team.settName(tName);
        if (teamService.createTeam(team)){
            out.print("{\"status\":\"success\"}");
        }else {
            out.print("{\"status\":\"fail\"}");
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/setTeamInfo")
    public void setTeamInfo(@RequestParam Integer tId,@RequestParam String tName, @RequestParam String tPicture, @RequestParam String tDescription, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        Team team = new Team();
        team.settName(tName);
        team.settId(tId);
        team.settPicture(tPicture);
        team.settDescription(tDescription);
        if (teamService.setTeamInfo(team)){
            out.print("{\"status\":\"success\"}");
        }else {
            out.print("{\"status\":\"fail\"}");
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/getAllTeam")
    public void getAllTeam(HttpServletResponse response) throws IOException {
        List<Team> teamList = teamService.selectAllTeam();
        PrintWriter out = response.getWriter();
        TeamAllDto dto = new TeamAllDto();
        if(teamList.size() != 0) {
            dto.setStatus(Constants.SUCCESS);
            dto.setTeamList(teamList);
        }else {
            dto.setStatus(Constants.FAIL);
        }
        out.print(JsonUtils.objectToJson(dto));
        out.flush();
        out.close();
    }
}
