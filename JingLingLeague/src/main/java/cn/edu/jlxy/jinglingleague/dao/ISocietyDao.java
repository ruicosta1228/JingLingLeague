package cn.edu.jlxy.jinglingleague.dao;

import cn.edu.jlxy.jinglingleague.entity.Society;
import cn.edu.jlxy.jinglingleague.entity.Team;

import java.util.Date;
import java.util.List;

/**
 * Created by neo on 2017/3/20.
 */
public interface ISocietyDao {
    /**
     *
     * @param sId
     * @return
     */
    public List<Society> selectNew(int sId);

    /**
     *
     * @param sId
     * @return
     */
    public List<Society> selectOld(int sId);

    /**
     *
     * @param society
     * @return
     */
    public int insertNews(Society society);

}
