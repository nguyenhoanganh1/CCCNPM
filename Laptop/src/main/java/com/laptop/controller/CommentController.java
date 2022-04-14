package com.laptop.controller;

import java.util.Date;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laptop.dao.CommentDAO;
import com.laptop.dao.ProductDAO;
import com.laptop.entity.Comment;
import com.laptop.entity.Product;
import com.laptop.model.RoomChatModel;

@CrossOrigin("*")
@Controller
@RequestMapping("api/v1/comment")
public class CommentController {
	
	
	private final CommentDAO cdao;
	private final ProductDAO pdao;
	

	public CommentController(CommentDAO cdao, ProductDAO pdao) {
		super();
		this.cdao = cdao;
		this.pdao = pdao;
	}
	
	@ResponseBody
	@PostMapping("/send-message")
	public ResponseEntity<?> sendMessage(@RequestBody RoomChatModel model){
		
		Product pro = pdao.findByProductId(model.getRoomId());
		
		Comment comment = new Comment();
		comment.setBody(model.getBody());
		comment.setDateTime(new Date());
		comment.setProductComment(pro);
		
		cdao.save(comment);
		return ResponseEntity.ok().build();
	}
	
	
}
