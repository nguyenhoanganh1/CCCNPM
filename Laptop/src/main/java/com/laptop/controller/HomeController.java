package com.laptop.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laptop.dao.CategoryDAO;
import com.laptop.dao.ProductDAO;
import com.laptop.entity.Category;
import com.laptop.entity.Product;

@Controller
public class HomeController {
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProductDAO pdao;

	
	@RequestMapping({"/", "/home/index"})
	public String index(Model model) {
		try {
			/*
			 * List<Category> list = cdao.findAll();
			 * 
			 * Collections.shuffle(list); list = list.subList(0, 3);
			 * 
			 * for(Category cate: list) { Collections.shuffle(cate.getProducts());
			 * cate.setProducts(cate.getProducts().subList(0, 3)); }
			 */
		List<Product> prods = pdao.findBySpecial();
		
//		model.addAttribute("list", list);
		model.addAttribute("prods", prods);

		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		

		
		return "home/index";
	}
	
	@RequestMapping("/home/about")
	public String about() {
		return "home/about";
	}
	
	@RequestMapping("/home/contact")
	public String contact() {
		return "home/contact";
	}
	
	@RequestMapping("/home/feedback")
	public String feedback() {
		return "home/feedback";
	}
	
	@RequestMapping("/home/faq")
	public String faq() {
		return "home/faq";
	}
	
	@ResponseBody
	@RequestMapping("/home/lang")
	public void lang() {}
}
