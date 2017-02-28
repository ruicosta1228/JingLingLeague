package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.entity.Player;

/**
 * Created by neo on 2017/2/28.
 */
public interface IPlayerBasedService {
    public Player login(Player player);

    public boolean register(Player player);

    public boolean updatePwd(Player player);
}
