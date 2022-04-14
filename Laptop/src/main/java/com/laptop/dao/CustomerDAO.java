package com.laptop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptop.entity.Customer;

public interface CustomerDAO extends JpaRepository<Customer, String>{
}