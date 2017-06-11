package cn.edu.jlxy.jinglingleague.service.impl;

import cn.edu.jlxy.jinglingleague.dao.ISocietyDao;
import cn.edu.jlxy.jinglingleague.dto.SocietyListDto;
import cn.edu.jlxy.jinglingleague.entity.Society;
import cn.edu.jlxy.jinglingleague.service.ISocietyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by neo on 2017/6/10.
 */
@Service
public class ISocietyServiceImpl implements ISocietyService{
    @Resource
    ISocietyDao dao;

    public boolean createNews(Society society) {
        if (dao.insertNews(society) != 1){
            return false;
        }
        return true;
    }

    public SocietyListDto getNews(int sId, boolean isNew, int count) {
        List<Society> list;
        SocietyListDto dto = new SocietyListDto();
        if (isNew){
            list = dao.selectNew(sId);

            if (count != -1 && count <=list.size()){
                list.subList(0,count);
            }
            dto.setSocietyList(list);
            return dto;
        } else {
            list = dao.selectOld(sId);

            if (count != -1 && count <=list.size()){
                list.subList(0,count);
            }
            dto.setSocietyList(list);
            return dto;
        }
    }
}
