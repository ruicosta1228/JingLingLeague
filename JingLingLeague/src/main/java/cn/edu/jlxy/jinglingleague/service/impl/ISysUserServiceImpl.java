package cn.edu.jlxy.jinglingleague.service.impl;

import cn.edu.jlxy.jinglingleague.dao.ISysUserDao;
import cn.edu.jlxy.jinglingleague.entity.SysUser;
import cn.edu.jlxy.jinglingleague.service.ISysUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by neo on 2017/2/28.
 */
@Service
public class ISysUserServiceImpl implements ISysUserService{

    @Resource
    ISysUserDao dao;

    @Transactional
    public void saveWithMybatis(String uName, int uAge) {
        SysUser user = new SysUser();
        user.setuName(uName);
        user.setuAge(uAge);
        dao.save(user);
    }

    @Transactional
    public SysUser selectByIdWithMybatis(int uId) {
        return dao.selectById(uId);
    }

    @Transactional
    public List<SysUser> selectAllWithMybatis() {
        return dao.selectAll();
    }

    @Transactional
    public void deleteByIdWithMybatis(int uId) {
        dao.deleteById(uId);
    }
}
