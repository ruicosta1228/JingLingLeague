package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.entity.Player;

/**
 * Created by neo on 2017/2/28.
 */
public interface IPlayerBasedService {
    /**
     * 登录服务
     * @param player
     * @return player
     */
    public Player login(Player player);

    /**
     * 注册服务
     * @param player
     * @return success or not
     */
    public boolean register(Player player);

    /**
     * 改密码
     * @param player
     * @return success or not
     */
    public boolean updatePwd(Player player);

    /**
     *
     * @param pId
     * @return success or not
     */
    public boolean deletePlayer(int pId);
}
