package cn.edu.jlxy.jinglingleague.dao;

import cn.edu.jlxy.jinglingleague.entity.Player;
import org.springframework.stereotype.Repository;

/**
 * Created by neo on 2017/2/28.
 */
@Repository
public interface IPlayerDao {
    public int register(Player player);

    public Player login(Player player);

    public int updatePwd(Player player);
}
