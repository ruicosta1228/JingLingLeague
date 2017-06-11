package cn.edu.jlxy.jinglingleague.entity;

import java.util.Date;

/**
 * Created by neo on 2017/3/6.
 */
public class Society {
    private int sId;

    private String timeLabel;

    private String composeImage;

    private String userImage;

    private String nameLabel;

    private String titleLabel;

    private String statusLabel;

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public String getTimeLabel() {
        return timeLabel;
    }

    public void setTimeLabel(String timeLabel) {
        this.timeLabel = timeLabel;
    }

    public String getComposeImage() {
        return composeImage;
    }

    public void setComposeImage(String composeImage) {
        this.composeImage = composeImage;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getNameLabel() {
        return nameLabel;
    }

    public void setNameLabel(String nameLabel) {
        this.nameLabel = nameLabel;
    }

    public String getTitleLabel() {
        return titleLabel;
    }

    public void setTitleLabel(String titleLabel) {
        this.titleLabel = titleLabel;
    }

    public String getStatusLabel() {
        return statusLabel;
    }

    public void setStatusLabel(String statusLabel) {
        this.statusLabel = statusLabel;
    }
}
