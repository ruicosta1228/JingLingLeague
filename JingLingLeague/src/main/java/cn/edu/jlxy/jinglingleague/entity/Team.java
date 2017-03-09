package cn.edu.jlxy.jinglingleague.entity;

/**
 * Created by neo on 2017/3/6.
 */
public class Team {
    private int tId;

    private String tName;

    private String tPicture;

    private String tDescription;

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettPicture() {
        return tPicture;
    }

    public void settPicture(String tPicture) {
        this.tPicture = tPicture;
    }

    public String gettDescription() {
        return tDescription;
    }

    public void settDescription(String tDescription) {
        this.tDescription = tDescription;
    }
}
