package cn.edu.jlxy.jinglingleague.service.impl;

import cn.edu.jlxy.jinglingleague.dao.IAbilityDao;
import cn.edu.jlxy.jinglingleague.entity.Ability;
import cn.edu.jlxy.jinglingleague.service.IAbilityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by neo on 2017/6/11.
 */
@Service
public class IAbilityServiceImpl implements IAbilityService{
    @Resource
    IAbilityDao dao;

    public Ability getAbilityById(int pid) {

        return dao.getAbilityById(pid);
    }
}
