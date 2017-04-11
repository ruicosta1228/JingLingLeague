package cn.edu.jlxy.jinglingleague.dao.user;

import cn.edu.jlxy.jinglingleague.entity.user.UserSecure;
import org.springframework.stereotype.Repository;

/**
 * Created by neo on 2017/4/8.
 */
public interface IUserSecureDao {
    /**
     * 用户普通登录
     * @param userSecure
     * @return 操作成功数
     */
    public int register(UserSecure userSecure);

    /**
     * 第三方登录创建一条信息
     * @param userSecure
     * @return 操作成功数
     */
    public int createEmpty(UserSecure userSecure);

    /**
     *
     * @param userSecure
     * @return 操作成功数
     */
    public UserSecure login(UserSecure userSecure);

    /**
     * 删除信息
     * @param pid
     * @return
     */
    public int delete(Integer pid);
}
