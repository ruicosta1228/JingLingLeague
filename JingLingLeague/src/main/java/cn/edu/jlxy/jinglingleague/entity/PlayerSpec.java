package cn.edu.jlxy.jinglingleague.entity;

/**
 * Created by neo on 2017/3/4.
 */
public class PlayerSpec {
    private int pId;

    private String pHeight;

    private String pWeight;

    private String pStrength;

    private String pStamina;

    private String pSpeed;

    private String pShoot;

    private String pSkill;

    private String pDefence;

    public PlayerSpec() {
    }

    public PlayerSpec(int pId, String pHeight, String pWeight, String pStrength, String pStamina, String pSpeed, String pShoot, String pSkill, String pDefence) {
        this.pId = pId;
        this.pHeight = pHeight;
        this.pWeight = pWeight;
        this.pStrength = pStrength;
        this.pStamina = pStamina;
        this.pSpeed = pSpeed;
        this.pShoot = pShoot;
        this.pSkill = pSkill;
        this.pDefence = pDefence;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpHeight() {
        return pHeight;
    }

    public void setpHeight(String pHeight) {
        this.pHeight = pHeight;
    }

    public String getpWeight() {
        return pWeight;
    }

    public void setpWeight(String pWeight) {
        this.pWeight = pWeight;
    }

    public String getpStrength() {
        return pStrength;
    }

    public void setpStrength(String pStrength) {
        this.pStrength = pStrength;
    }

    public String getpStamina() {
        return pStamina;
    }

    public void setpStamina(String pStamina) {
        this.pStamina = pStamina;
    }

    public String getpSpeed() {
        return pSpeed;
    }

    public void setpSpeed(String pSpeed) {
        this.pSpeed = pSpeed;
    }

    public String getpShoot() {
        return pShoot;
    }

    public void setpShoot(String pShoot) {
        this.pShoot = pShoot;
    }

    public String getpSkill() {
        return pSkill;
    }

    public void setpSkill(String pSkill) {
        this.pSkill = pSkill;
    }

    public String getpDefence() {
        return pDefence;
    }

    public void setpDefence(String pDefence) {
        this.pDefence = pDefence;
    }
}
