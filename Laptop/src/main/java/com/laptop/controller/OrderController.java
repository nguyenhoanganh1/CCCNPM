package com.laptop.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.laptop.bean.CartItem;
import com.laptop.dao.OrderDAO;
import com.laptop.dao.OrderDetailDAO;
import com.laptop.dao.ProductDAO;
import com.laptop.entity.Customer;
import com.laptop.entity.Order;
import com.laptop.entity.OrderDetail;
import com.laptop.entity.Product;
import com.laptop.service.SessionService;
import com.laptop.service.ShoppingCartService;

@Controller
public class OrderController {
	@Autowired
	ShoppingCartService cart;
	@Autowired
	SessionService session;
	@Autowired
	OrderDAO odao;
	@Autowired
	OrderDetailDAO ddao;
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping("/order/checkout")
	public String checkout(Model model) {
		return "forward:/cart/view";
	}
	
	@RequestMapping("/order/purchase")
	public String purchase(Model model, Order order) {
		order.setAmount(cart.getAmount());
		Customer user = session.getAttribute("user");
		order.setCustomer(user);
		odao.save(order);
		
		Collection<CartItem> items = cart.getItems();
		for(CartItem item: items) {
			Product p = pdao.findById(item.getId()).get();
			OrderDetail detail = new OrderDetail();
			detail.setProduct(p);
			detail.setOrder(order);
			detail.setUnitPrice(item.getPrice());
			detail.setDiscount(item.getDisc());
			detail.setQuantity(item.getQty());
			ddao.save(detail);
		}
		cart.clear();
		return "redirect:/order/detail/"+order.getId();
	}

	@RequestMapping("/order/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Order order = odao.findById(id).get();
		model.addAttribute("order", order);
		return "order/detail";
	}
	
	@RequestMapping("/order/cancel/{id}")
	public String cancel(@PathVariable("id") Integer id) {
		Order order = odao.findById(id).get();
		order.setStatus(-1);
		odao.save(order);
		return "redirect:/order/list";
	}
	
	@RequestMapping("/order/list")
	public String list(Model model) {
		Customer user = session.getAttribute("user");
		List<Order> list = odao.findByCustomer(user);
		model.addAttribute("orders", list);
		return "order/list";
	}
	
	@RequestMapping("/order/items")
	public String purchasedItems(Model model) {
		Customer user = session.getAttribute("user");
		List<Product> list = pdao.findByCustomer(user);
		model.addAttribute("prods", list);
		return "order/items";
	}
	
	@ModelAttribute("status")
	public Map<Integer, String> getStatus(){
		Map<Integer, String> st = new HashMap<Integer, String>();
		st.put(0, "New");
		st.put(1, "Confirming");
		st.put(2, "Confirmed");
		st.put(3, "Shipping");
		st.put(4, "Completed");
		st.put(-1, "Canceled");
		return st;
	}
}
