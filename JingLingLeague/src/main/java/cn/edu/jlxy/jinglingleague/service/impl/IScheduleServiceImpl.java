package cn.edu.jlxy.jinglingleague.service.impl;

import cn.edu.jlxy.jinglingleague.dao.IMatchDao;
import cn.edu.jlxy.jinglingleague.dto.MatchListDto;
import cn.edu.jlxy.jinglingleague.entity.Match;
import cn.edu.jlxy.jinglingleague.service.IScheduleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by neo on 2017/6/11.
 */
@Service
public class IScheduleServiceImpl implements IScheduleService{
    @Resource
    IMatchDao dao;

    public MatchListDto getAllMatch() {
        List<Match> list;
        MatchListDto dto = new MatchListDto();

        list = dao.getAllMatch();
        dto.setMatchList(list);
        return dto;
    }
}
