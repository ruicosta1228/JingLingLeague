package cn.edu.jlxy.jinglingleague.entity;

/**
 * Created by neo on 2017/2/28.
 */
public class Player {
    //player id
    private int pId;

    //team id
    private int tId;

    private String pName;

    private String pPassword;

    private String pAcademy;

    private String pSelfi;

    private String pTelephone;

    //运动员号码
    private String pNum;

    public Player() {
    }

    public Player(String pName, String pPassword) {
        this.pName = pName;
        this.pPassword = pPassword;
    }

    public String getpNum() {
        return pNum;
    }

    public void setpNum(String pNum) {
        this.pNum = pNum;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpPassword() {
        return pPassword;
    }

    public void setpPassword(String pPassword) {
        this.pPassword = pPassword;
    }

    public String getpAcademy() {
        return pAcademy;
    }

    public void setpAcademy(String pAcademy) {
        this.pAcademy = pAcademy;
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
