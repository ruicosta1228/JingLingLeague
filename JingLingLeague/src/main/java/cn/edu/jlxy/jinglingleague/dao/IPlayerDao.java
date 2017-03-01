package cn.edu.jlxy.jinglingleague.dao;

import cn.edu.jlxy.jinglingleague.entity.Player;
import org.springframework.stereotype.Repository;

/**
 * Created by neo on 2017/2/28.
 */
@Repository
public interface IPlayerDao {
    /**
     * 注册
     * @param player
     * @return  operate_count
     */
    public int register(Player player);

    /**
     * 用户登录
     * @param player
     * @return player
     */
    public Player login(Player player);

    /**
     * 改密码
     * @param player
     * @return operate_count
     */
    public int updatePwd(Player player);

    /**
     * 删除用户
     * @param pId
     * @return operate_count
     */
    public int deleteById(int pId);
}
