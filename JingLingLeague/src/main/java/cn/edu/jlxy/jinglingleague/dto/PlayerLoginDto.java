package cn.edu.jlxy.jinglingleague.dto;

import cn.edu.jlxy.jinglingleague.entity.Player;

/**
 * Created by neo on 2017/3/1.
 */
public class PlayerLoginDto {
    //登录状态
    private String status;

    private Player player;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }
}
