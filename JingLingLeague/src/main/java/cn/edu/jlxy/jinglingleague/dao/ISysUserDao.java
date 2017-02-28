package cn.edu.jlxy.jinglingleague.dao;

import cn.edu.jlxy.jinglingleague.entity.SysUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by neo on 2017/2/28.
 */
@Repository
public interface ISysUserDao {

    public void save(SysUser user);
    public SysUser selectById(int id );
    public void deleteById(int id);
    public List<SysUser> selectAll();

}
