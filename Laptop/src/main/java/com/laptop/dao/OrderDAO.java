package com.laptop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptop.entity.Customer;
import com.laptop.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer>{

	@Query("SELECT o FROM Order o WHERE o.customer=?1")
	List<Order> findByCustomer(Customer user);
}
