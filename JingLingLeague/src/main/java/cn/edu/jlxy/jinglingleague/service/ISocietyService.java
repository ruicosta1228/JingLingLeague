package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.dto.SocietyListDto;
import cn.edu.jlxy.jinglingleague.entity.Society;

/**
 * Created by neo on 2017/6/10.
 */
public interface ISocietyService {

    public boolean createNews(Society society);

    public SocietyListDto getNews(int sId, boolean isNew, int count);
}
