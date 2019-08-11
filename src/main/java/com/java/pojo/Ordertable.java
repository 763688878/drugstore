package com.java.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Ordertable {
    private Integer id;

    private String orderserial;

    private String customerId;

    private String name;

    private String telphone;

    private String address;

    private BigDecimal price;

    private String detail;

    private String store;

    private Integer state;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    private Integer customerdelete;

    public Ordertable(Integer id, String orderserial, String customerId, String name, String telphone, String address, BigDecimal price, String detail, String store, Integer state, Date time, Integer customerdelete) {
        this.id = id;
        this.orderserial = orderserial;
        this.customerId = customerId;
        this.name = name;
        this.telphone = telphone;
        this.address = address;
        this.price = price;
        this.detail = detail;
        this.store = store;
        this.state = state;
        this.time = time;
        this.customerdelete = customerdelete;
    }

    public Ordertable() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderserial() {
        return orderserial;
    }

    public void setOrderserial(String orderserial) {
        this.orderserial = orderserial == null ? null : orderserial.trim();
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store == null ? null : store.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(this.time);
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getCustomerdelete() {
        return customerdelete;
    }

    public void setCustomerdelete(Integer customerdelete) {
        this.customerdelete = customerdelete;
    }
}