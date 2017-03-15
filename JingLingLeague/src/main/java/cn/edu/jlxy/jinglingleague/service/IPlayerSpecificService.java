package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.entity.Player;
import cn.edu.jlxy.jinglingleague.entity.PlayerSpec;

/**
 * Created by neo on 2017/2/28.
 */
public interface IPlayerSpecificService {
    /**
     * 根据id获得运动员属性
     * @param pId
     * @return 运动员属性信息
     */
    public PlayerSpec getSpec(int pId);

    /**
     * 设置该运动员的属性信息
     * @param playerSpec
     * @return  是否成功
     */
    public boolean setSpec(PlayerSpec playerSpec);

    /**
     * 创建一条空的信息
     * @param pId
     * @return 是否成功
     */
    public boolean createEmptyInfo(int pId);
}
