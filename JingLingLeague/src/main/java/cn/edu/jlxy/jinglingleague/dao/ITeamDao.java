package cn.edu.jlxy.jinglingleague.dao;

import cn.edu.jlxy.jinglingleague.entity.Team;

import java.util.List;

/**
 * Created by neo on 2017/3/20.
 */
public interface ITeamDao {
    /**
     * 创建一个队伍
     * @param team
     * @return 操作成功数
     */
    public int insertTeam(Team team);

    /**
     * 更新队伍信息
     * @param team
     * @return 操作成功数
     */
    public int updateTeamInfo(Team team);

    /**
     * 获取所有队伍信息
     * @return  返回Team的表
     */
    public List<Team> selectAll();
}
