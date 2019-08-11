package com.java.config;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 主要是负责消息的分发，用户统计等。
 */
@Slf4j
@Service
public class MyHandler implements WebSocketHandler {

    /**
     * 为了保存在线用户信息，在方法中新建一个list存储一下【实际项目依据复杂度，可以存储到数据库或者缓存】
     */
    private final static List<WebSocketSession> SESSIONS = Collections.synchronizedList(new ArrayList<>());

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("连接成功!");
        SESSIONS.add(session);
        String userName = (String) session.getAttributes().get("WEBSOCKET_USERNAME");
        if (userName != null) {
            JSONObject obj = new JSONObject();
            // 统计一下当前登录系统的用户有多少个
            obj.put("count", SESSIONS.size());
            users(obj);
            session.sendMessage(new TextMessage(obj.toJSONString()));
        }
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        log.info("处理要发送的消息");
        JSONObject msg = JSON.parseObject(message.getPayload().toString());
        JSONObject obj = new JSONObject();
        if (msg.getInteger("type") == 1) {
            //给所有人
            String to = msg.getString("sendUser");
            obj.put("msg", msg.getString("msg"));
            obj.put("sendUser", msg.getString("sendUser"));//指明发送者姓名
            obj.put("type", 1);
            obj.put("count", msg.getString("count"));//总人数
            String peos = msg.getString("peos");
            if(peos != null){
                peos = peos.substring(1, peos.length());
                String[] peo = peos.split("_");
                obj.put("peos", peo);//在线人名
            }
            sendMessageToUsers(to, new TextMessage(obj.toJSONString()));
        } else {
            //给个人
            String to = msg.getString("to");
            obj.put("msg", msg.getString("msg"));
            obj.put("sendUser", msg.getString("sendUser"));//指明发送者姓名
            sendMessageToUser(to, new TextMessage(obj.toJSONString()));
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if (session.isOpen()) {
            session.close();
        }
        log.info("链接出错，关闭链接......");
        SESSIONS.remove(session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        log.info("链接关闭......" + closeStatus.toString());
        SESSIONS.remove(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /**
     * 给所有在线用户发送消息
     *
     * @param message
     */
    public void sendMessageToUsers(String userName, TextMessage message) {
        for (WebSocketSession user : SESSIONS) {
            //发给除了自己以外的用户
            if (!user.getAttributes().get("WEBSOCKET_USERNAME").equals(userName)) {
                try {
                    if (user.isOpen()) {
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 给某个用户发送消息
     *
     * @param userName
     * @param message
     */
    public void sendMessageToUser(String userName, TextMessage message) {
        for (WebSocketSession user : SESSIONS) {
            if (user.getAttributes().get("WEBSOCKET_USERNAME").equals(userName)) {
                try {
                    if (user.isOpen()) {
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }

    /**
     * 将系统中的用户传送到前端
     */
    private void users(JSONObject obj) {
        List<String> userNames = new ArrayList<>();
        for (WebSocketSession webSocketSession : SESSIONS) {
            userNames.add((String) webSocketSession.getAttributes().get("WEBSOCKET_USERNAME"));
        }
        obj.put("users", userNames);
    }
}
