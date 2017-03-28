package cn.edu.jlxy.jinglingleague.dao;

import cn.edu.jlxy.jinglingleague.entity.Society;
import cn.edu.jlxy.jinglingleague.entity.Team;

import java.util.List;

/**
 * Created by neo on 2017/3/20.
 */
public interface ISocietyDao {
    /**
     *
     * @param society
     * @return 操作成功数
     */
    public int insertNews(Society society);

}
