package cn.edu.jlxy.jinglingleague.service.impl;

import cn.edu.jlxy.jinglingleague.dao.IPlayerSpecificDao;
import cn.edu.jlxy.jinglingleague.entity.PlayerSpec;
import cn.edu.jlxy.jinglingleague.service.IPlayerSpecificService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by neo on 2017/2/28.
 */
@Service
public class IPlayerSpecificServiceImpl implements IPlayerSpecificService {
    @Resource
    IPlayerSpecificDao dao;

    public PlayerSpec getSpec(int pId) {
        PlayerSpec playerSpec = dao.getAll(pId);
        return playerSpec != null ? playerSpec : null;
    }

    public boolean setSpec(PlayerSpec playerSpec) {
        return dao.updateSpec(playerSpec) == 1 ? true : false;
    }

    public boolean createEmptyInfo(int pId) {
        return dao.insertEmptyInfo(pId) == 1 ? true : false;
    }
}
