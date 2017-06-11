package cn.edu.jlxy.jinglingleague.entity;

/**
 * Created by neo on 2017/6/11.
 */
public class Match {
    private int mId;

    private String team1_name;

    private String team1_icon;

    private String team2_name;

    private String team2_icon;

    private String result;

    private String time;

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public String getTeam1_name() {
        return team1_name;
    }

    public void setTeam1_name(String team1_name) {
        this.team1_name = team1_name;
    }

    public String getTeam1_icon() {
        return team1_icon;
    }

    public void setTeam1_icon(String team1_icon) {
        this.team1_icon = team1_icon;
    }

    public String getTeam2_name() {
        return team2_name;
    }

    public void setTeam2_name(String team2_name) {
        this.team2_name = team2_name;
    }

    public String getTeam2_icon() {
        return team2_icon;
    }

    public void setTeam2_icon(String team2_icon) {
        this.team2_icon = team2_icon;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
