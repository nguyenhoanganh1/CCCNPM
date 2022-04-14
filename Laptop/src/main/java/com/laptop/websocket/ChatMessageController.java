package com.laptop.websocket;
import static java.lang.String.format;
import static org.springframework.web.bind.annotation.CrossOrigin.DEFAULT_ORIGINS;

import com.laptop.model.MessageModel;
import com.laptop.model.RoomChatModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageExceptionHandler;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@Controller
@CrossOrigin(value = "*", allowCredentials = "false", allowedHeaders = "*")
public class ChatMessageController {

    private SimpMessagingTemplate messagingTemplate;


    public ChatMessageController(SimpMessagingTemplate template) {
        this.messagingTemplate = template;
    }

    @MessageMapping("/chat/{roomId}/sendMessage")
    public void sendMessage(@DestinationVariable String roomId, @Payload ChatContent chatMessage) {
        messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatMessage);
        log.info("Send message : {}, {}", chatMessage.getBody(), roomId);
    }

    @MessageMapping("/chat/{roomId}/addUser")
    public void addUser(@DestinationVariable String roomId, @Payload ChatContent chatMessage,
                        SimpMessageHeaderAccessor headerAccessor) {
        String currentRoomId = (String) headerAccessor.getSessionAttributes().put("room_id", roomId);
        log.info("Send message : {}, {}", chatMessage.getBody(), roomId);

        if (currentRoomId != null) {
            ChatContent leaveMessage = new ChatContent();
            leaveMessage.setType(ChatContent.MessageType.LEAVE);
            leaveMessage.setSender(chatMessage.getSender());
            messagingTemplate.convertAndSend(format("/channel/%s", currentRoomId), leaveMessage);
        }
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatMessage);
        log.info("Add user to roomChat : {}", roomId );
    }
}
