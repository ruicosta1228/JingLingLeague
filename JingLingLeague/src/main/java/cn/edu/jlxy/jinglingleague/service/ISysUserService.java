package cn.edu.jlxy.jinglingleague.service;

import cn.edu.jlxy.jinglingleague.entity.SysUser;

import java.util.List;

/**
 * Created by neo on 2017/2/28.
 */
public interface ISysUserService {

    public void saveWithMybatis(String uName, int uAge );

    public SysUser selectByIdWithMybatis(int uId );

    public List<SysUser> selectAllWithMybatis();

    public void deleteByIdWithMybatis(int uId );
}
