package com.laptop.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MessageModel {
    private int id;
    private String sender;
    private String body;
    private String time;
    private boolean me;
}
