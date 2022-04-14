package com.laptop.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class RoomChatMessage {
    private String sender;
    private String body;
    private String time;
    private boolean me;
}
