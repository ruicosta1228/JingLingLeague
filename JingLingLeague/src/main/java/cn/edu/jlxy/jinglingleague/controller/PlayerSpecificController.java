package cn.edu.jlxy.jinglingleague.controller;

import cn.edu.jlxy.jinglingleague.dto.PlayerSpecificDto;
import cn.edu.jlxy.jinglingleague.entity.PlayerSpec;
import cn.edu.jlxy.jinglingleague.service.IPlayerSpecificService;
import cn.edu.jlxy.jinglingleague.util.Constants;
import cn.edu.jlxy.jinglingleague.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by neo on 2017/3/13.
 */
@Controller
@RequestMapping("/playerSpecific")
public class PlayerSpecificController {

    @Resource
    IPlayerSpecificService service;

    @RequestMapping("/setSpec")
    public void setPlayerSpecific(HttpServletResponse response, @RequestParam int pId, @RequestParam String pHeight , @RequestParam String pWeight, @RequestParam String pShoot, @RequestParam String pStrength, @RequestParam String pStamina, @RequestParam String pSkill, @RequestParam String pDefence, @RequestParam String pSpeed) throws IOException {
        PrintWriter out =response.getWriter();

        PlayerSpec playerSpec = new PlayerSpec(pId,pHeight,pWeight,pStrength,pStamina,pSpeed,pShoot,pSkill,pDefence);
        if(service.setSpec(playerSpec)){
            out.print("{\"status\":\"success\"}");
        }else {
            out.print("{\"status\":\"fail\"}");
        }
    }

    @RequestMapping("/getSpec")
    public void getPlayerSpecific(HttpServletResponse response, @RequestParam int pId) throws IOException {
        PrintWriter out =response.getWriter();
        String status = Constants.FAIL;

        PlayerSpec playerSpec = new PlayerSpec();
        PlayerSpecificDto dto = new PlayerSpecificDto();

        if((playerSpec = service.getSpec(pId)) != null){
            status = Constants.SUCCESS;
        }
        dto.setStatus(status);
        dto.setPlayerSpec(playerSpec);
        out.print(JsonUtils.objectToJson(dto));

        out.flush();
        out.close();
    }
}
