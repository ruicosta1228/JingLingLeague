package cn.edu.jlxy.jinglingleague.dto;

import cn.edu.jlxy.jinglingleague.entity.Team;

import java.util.List;

/**
 * Created by neo on 2017/3/23.
 */
public class TeamAllDto {
    private String status;

    private List<Team> teamList;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Team> getTeamList() {
        return teamList;
    }

    public void setTeamList(List<Team> teamList) {
        this.teamList = teamList;
    }
}
