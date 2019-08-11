package com.java.pojo;



import java.math.BigDecimal;

public class Shopping {

    private Integer id;

    private String name;

    private Integer count;

    private BigDecimal price;

    private String photo;

    private String customerSerial;

    private int status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getCustomerSerial() {
        return customerSerial;
    }

    public void setCustomerSerial(String customerSerial) {
        this.customerSerial = customerSerial;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
