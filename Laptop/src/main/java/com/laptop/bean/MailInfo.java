package com.laptop.bean;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MailInfo {
	Integer id;
	String sender;
	String receiver;
	String subject;
	String content;
}
