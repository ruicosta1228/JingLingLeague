package cn.edu.jlxy.jinglingleague.entity;

/**
 * Created by neo on 2017/3/6.
 */
public class Society {
    private int sId;

    private String sName;

    private String sType;

    private String sContent;

    private int pId;

    private int num_of_comment = 0;

    private int num_of_awesome = 0;

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getsType() {
        return sType;
    }

    public void setsType(String sType) {
        this.sType = sType;
    }

    public String getsContent() {
        return sContent;
    }

    public void setsContent(String sContent) {
        this.sContent = sContent;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getNum_of_comment() {
        return num_of_comment;
    }

    public void setNum_of_comment(int num_of_comment) {
        this.num_of_comment = num_of_comment;
    }

    public int getNum_of_awesome() {
        return num_of_awesome;
    }

    public void setNum_of_awesome(int num_of_awesome) {
        this.num_of_awesome = num_of_awesome;
    }
}
