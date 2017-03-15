package cn.edu.jlxy.jinglingleague.dto;

import cn.edu.jlxy.jinglingleague.entity.Player;
import cn.edu.jlxy.jinglingleague.entity.PlayerSpec;

/**
 * Created by neo on 2017/3/1.
 */
public class PlayerSpecificDto {
    //状态
    private String status;

    private PlayerSpec playerSpec;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public PlayerSpec getPlayerSpec() {
        return playerSpec;
    }

    public void setPlayerSpec(PlayerSpec playerSpec) {
        this.playerSpec = playerSpec;
    }

}
