package cn.edu.jlxy.jinglingleague.entity.user;

/**
 * Created by neo on 2017/4/8.
 */

/** 存储用户密码信息
 * 只有在user_secure表中的pid有效
 */
public class UserSecure {
    //用户唯一身份标识
    private int pid;

    private String password;

    //网络通信唯一秘钥
    private String access_key;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccess_key() {
        return access_key;
    }

    public void setAccess_key(String access_key) {
        this.access_key = access_key;
    }
}
