package cn.edu.jlxy.jinglingleague.dto;

import cn.edu.jlxy.jinglingleague.entity.Match;

import java.util.List;

/**
 * Created by neo on 2017/6/11.
 */
public class MatchListDto {
    private List<Match> matchList;

    public List<Match> getMatchList() {
        return matchList;
    }

    public void setMatchList(List<Match> matchList) {
        this.matchList = matchList;
    }
}
