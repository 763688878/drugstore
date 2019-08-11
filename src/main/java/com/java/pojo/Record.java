package com.java.pojo;



import java.math.BigDecimal;
import java.util.Date;

public class Record {
    private Integer id;

    private String doctorId;

    private String customerId;

    private String busno;

    private Date starTime;

    private Date endTime;

    private BigDecimal invalids;

    private String isopendrug;

    private String isgetmedicine;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getBusno() {
        return busno;
    }

    public void setBusno(String busno) {
        this.busno = busno;
    }

    public Date getStarTime() {
        return starTime;
    }

    public void setStarTime(Date starTime) {
        this.starTime = starTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public BigDecimal getInvalids() {
        return invalids;
    }

    public void setInvalids(BigDecimal invalids) {
        this.invalids = invalids;
    }

    public String getIsopendrug() {
        return isopendrug;
    }

    public void setIsopendrug(String isopendrug) {
        this.isopendrug = isopendrug;
    }

    public String getIsgetmedicine() {
        return isgetmedicine;
    }

    public void setIsgetmedicine(String isgetmedicine) {
        this.isgetmedicine = isgetmedicine;
    }
}