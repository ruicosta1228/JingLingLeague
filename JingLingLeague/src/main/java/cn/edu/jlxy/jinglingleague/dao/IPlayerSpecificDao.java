package cn.edu.jlxy.jinglingleague.dao;

import cn.edu.jlxy.jinglingleague.entity.Player;
import cn.edu.jlxy.jinglingleague.entity.PlayerSpec;
import org.springframework.stereotype.Repository;

/**
 * Created by neo on 2017/2/28.
 */
@Repository
public interface IPlayerSpecificDao {
    /**
     * 在注册后创建一条空的信息
     * @param pId
     * @return 操作成功数
     */
    public int insertEmptyInfo(int pId);

    /**
     * 获取运动员所有属性
     * @param pId
     * @return  PlayerSpec对象
     */
    public PlayerSpec getAll(int pId);

    /**
     * 设置运动员属性
     * @param playerSpec
     * @return 操作成功数
     */
    public int updateSpec(PlayerSpec playerSpec);
}
