package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.entity.Player;
import cn.edu.jlxy.jinglingleague.entity.Team;

import java.util.List;

/**
 * Created by neo on 2017/2/28.
 */
public interface ITeamService {
    /**
     * 创建球队
     * @param team
     * @return 是否成功
     */
    public boolean createTeam(Team team);

    /**
     * 设置球队信息
     * @param team
     * @return 是否成功
     */
    public boolean setTeamInfo(Team team);

    /**
     * 获取所有球队信息
     * @return List
     */
    public List<Team> selectAllTeam();

}
