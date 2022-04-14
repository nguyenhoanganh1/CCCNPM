package com.laptop.websocket;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ChatContent {
    public enum MessageType {
        CHAT, JOIN, LEAVE
    }

    private MessageType messageType;
    private String body;
    private Date time = new Date();
    private String sender;
    private boolean me;

    public MessageType getType() {
        return messageType;
    }

    public void setType(MessageType messageType) {
        this.messageType = messageType;
    }


}
