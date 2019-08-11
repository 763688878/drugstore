package com.java.pojo;




public class Interrogation {
    private Integer itrgtId;//问诊主键

    private String itrgtTeacherId;//问诊医师编号

    private String itrgtUserId;//问诊用户编号

    private String itrgtStartTime;//问诊起始时间

    private String itrgtEndTime;//问诊结束时间

    private Integer itrgtTotalPrice;//问诊总价

    public Integer getItrgtId() {
        return itrgtId;
    }

    public void setItrgtId(Integer itrgtId) {
        this.itrgtId = itrgtId;
    }

    public String getItrgtTeacherId() {
        return itrgtTeacherId;
    }

    public void setItrgtTeacherId(String itrgtTeacherId) {
        this.itrgtTeacherId = itrgtTeacherId;
    }

    public String getItrgtUserId() {
        return itrgtUserId;
    }

    public void setItrgtUserId(String itrgtUserId) {
        this.itrgtUserId = itrgtUserId;
    }

    public String getItrgtStartTime() {
        return itrgtStartTime;
    }

    public void setItrgtStartTime(String itrgtStartTime) {
        this.itrgtStartTime = itrgtStartTime;
    }

    public String getItrgtEndTime() {
        return itrgtEndTime;
    }

    public void setItrgtEndTime(String itrgtEndTime) {
        this.itrgtEndTime = itrgtEndTime;
    }

    public Integer getItrgtTotalPrice() {
        return itrgtTotalPrice;
    }

    public void setItrgtTotalPrice(Integer itrgtTotalPrice) {
        this.itrgtTotalPrice = itrgtTotalPrice;
    }
}
