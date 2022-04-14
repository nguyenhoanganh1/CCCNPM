package com.laptop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptop.entity.Comment;

public interface CommentDAO extends JpaRepository<Comment, Integer> {
	
	@Query("SELECT c from Comment c WHERE c.productComment.id = ?1")
	List<Comment> findByProductId(Integer productId);
}
