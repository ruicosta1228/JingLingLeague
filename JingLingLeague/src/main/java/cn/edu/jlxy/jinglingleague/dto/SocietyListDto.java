package cn.edu.jlxy.jinglingleague.dto;

import cn.edu.jlxy.jinglingleague.entity.Society;

import java.util.List;

/**
 * Created by neo on 2017/6/10.
 */
public class SocietyListDto {

    private List<Society> societyList;

    public List<Society> getSocietyList() {
        return societyList;
    }

    public void setSocietyList(List<Society> societyList) {
        this.societyList = societyList;
    }
}
