package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.entity.user.UserBase;
import cn.edu.jlxy.jinglingleague.entity.user.UserSecure;
import com.sun.org.apache.xpath.internal.operations.Bool;

/**
 * Created by neo on 2017/2/28.
 */
public interface IUserService {
    /**
     * 普通登录服务
     * 接收 用户名/手机号 和 密码
     * @param userSecure
     * @param userBase
     * @return access_key用以更多功能
     */
    public String login(UserSecure userSecure, UserBase userBase);

    /**
     * 第三方登录
     * 接收 用户名 和 头像地址
     * 保存昵称和头像
     * @param userBase
     * @return access_key用以更多功能
     */
    public String loginByWeibo(UserBase userBase);

    /**
     * 注册服务
     * @param userSecure
     * @param userBase
     * @return
     */
    public boolean register(UserSecure userSecure, UserBase userBase);
}
