package cn.edu.jlxy.jinglingleague.service.impl;

import cn.edu.jlxy.jinglingleague.dao.ITeamDao;
import cn.edu.jlxy.jinglingleague.entity.Team;
import cn.edu.jlxy.jinglingleague.service.ITeamService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by neo on 2017/3/20.
 */
@Service
public class ITeamServiceImpl implements ITeamService{

    @Resource
    ITeamDao dao;

    public boolean createTeam(Team team) {
        return dao.insertTeam(team) == 1 ? true : false;
    }

    public boolean setTeamInfo(Team team) {
        return dao.updateTeamInfo(team) == 1 ? true : false;
    }

    public List<Team> selectAllTeam() {
        return dao.selectAll();
    }
}
