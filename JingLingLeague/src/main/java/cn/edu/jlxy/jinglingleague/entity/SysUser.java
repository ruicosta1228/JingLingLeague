package cn.edu.jlxy.jinglingleague.entity;

/**
 * Created by neo on 2017/2/28.
 */
public class SysUser {

    private int uId ;
    private String uName ;
    private int uAge ;

    public int getuId() {
        return uId;
    }
    public void setuId(int uId) {
        this.uId = uId;
    }
    public String getuName() {
        return uName;
    }
    public void setuName(String uName) {
        this.uName = uName;
    }
    public int getuAge() {
        return uAge;
    }
    public void setuAge(int uAge) {
        this.uAge = uAge;
    }

    @Override
    public String toString() {
        return "uId=" + uId + ", uName=" + uName + ", uAge=" + uAge;
    }

}
