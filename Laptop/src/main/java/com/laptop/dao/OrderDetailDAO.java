package com.laptop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptop.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

}
