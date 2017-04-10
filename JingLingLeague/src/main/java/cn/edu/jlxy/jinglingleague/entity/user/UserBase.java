package cn.edu.jlxy.jinglingleague.entity.user;

/**
 * Created by neo on 2017/4/8.
 */
/**
 * 用户基本信息
 */
public class UserBase {
    private int pid;

    private String pName;

    //大头贴地址
    private String pSelfi;

    //电话号码
    private String pTelephone;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpSelfi() {
        return pSelfi;
    }

    public void setpSelfi(String pSelfi) {
        this.pSelfi = pSelfi;
    }

    public String getpTelephone() {
        return pTelephone;
    }

    public void setpTelephone(String pTelephone) {
        this.pTelephone = pTelephone;
    }
}
