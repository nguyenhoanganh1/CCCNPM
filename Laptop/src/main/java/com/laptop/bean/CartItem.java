package com.laptop.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
public class CartItem {
	Integer id;
	String name;
	String image;
	double price;
	double disc;
	int qty = 1;
	
	public double getAmount() {
		return qty * price * (1 - disc);
	}

	
}