package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.dao.IMatchDao;
import cn.edu.jlxy.jinglingleague.dto.MatchListDto;
import cn.edu.jlxy.jinglingleague.entity.Match;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by neo on 2017/6/11.
 */
public interface IScheduleService {

    public MatchListDto getAllMatch();
}
