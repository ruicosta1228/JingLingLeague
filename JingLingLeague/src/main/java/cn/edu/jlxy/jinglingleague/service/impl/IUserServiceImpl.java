package cn.edu.jlxy.jinglingleague.service.impl;

import cn.edu.jlxy.jinglingleague.dao.user.IUserBaseDao;
import cn.edu.jlxy.jinglingleague.dao.user.IUserSecureDao;
import cn.edu.jlxy.jinglingleague.entity.user.UserBase;
import cn.edu.jlxy.jinglingleague.entity.user.UserSecure;
import cn.edu.jlxy.jinglingleague.service.IUserService;
import cn.edu.jlxy.jinglingleague.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by neo on 2017/4/9.
 */
@Service
public class IUserServiceImpl implements IUserService{

    @Resource
    IUserSecureDao userSecureDao;
    @Resource
    IUserBaseDao userBaseDao;

    //普通登录
    public String login(UserSecure userSecure, UserBase userBase) {
        int pid = userBaseDao.selectPidByNameOrTele(userBase);

            userSecure.setPid(pid);
            if ((userSecure = userSecureDao.login(userSecure)) == null){
                return null;
            }
            return userSecure.getAccess_key();

    }

    //微博第三方登录
    public String loginByWeibo(UserBase userBase) {

        UserSecure secure = new UserSecure();

        secure.setAccess_key(StringUtils.getRandomString(50));

        if(userSecureDao.createEmpty(secure) != 1){
            return null;
        }

        if(userBaseDao.init(secure.getPid()) != 1){
            return null;
        }

        userBase.setPid(secure.getPid());

        if(userBaseDao.updateName(userBase) != 1){
            return null;
        }

        if(userBaseDao.updateSelfi(userBase) != 1){
            return null;
        }
        return secure.getAccess_key();
    }
}
