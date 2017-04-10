package cn.edu.jlxy.jinglingleague.dao.user;

import cn.edu.jlxy.jinglingleague.entity.user.UserBase;
import org.springframework.stereotype.Repository;

/**
 * Created by neo on 2017/4/8.
 */
public interface IUserBaseDao {

    /**
     * 用户初次注册后
     * 或者第三方登录后用创建的pid插入一条信息
     * @Param pid
     * @return 操作成功数
     */
    public int init(Integer pid);

    /**
     * 设置昵称
     * @param userBase
     * @return
     */
    public int updateName(UserBase userBase);

    /**
     * 设置头像
     * @param userBase
     * @return
     */
    public int updateSelfi(UserBase userBase);

    /**
     * 根据用户名/电话获取pid
     * @param userBase
     * @return
     */
    public Integer selectPidByNameOrTele(UserBase userBase);

    /**
     * 根据pid删除信息
     * @param pid
     * @return 操作成功数
     */
    public int delete(Integer pid);
}
