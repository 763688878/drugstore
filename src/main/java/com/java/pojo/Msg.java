package com.java.pojo;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private String code;
    private String msg;
    private Map<String, Object> map = new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setMsg("成功");
        msg.setCode("100");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setMsg("失败");
        msg.setCode("200");
        return msg;
    }

    public Msg maps(String key, Object value){
        this.map.put(key, value);
        return this;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
