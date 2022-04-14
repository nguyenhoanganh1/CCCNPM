package com.laptop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptop.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer>{
}
