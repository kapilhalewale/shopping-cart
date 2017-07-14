package com.kapil.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kapil.domain.Product;

@Controller
public class ProductController
{
	List<Product> products = new ArrayList<Product>();
	List<Product> cartProducts = new ArrayList<Product>();
	List<Product> sessionCarts = new ArrayList<Product>();

	ProductController()
	{
		products.add(new Product(1, new BigDecimal(12), 20, new Date(), true, "Santoor"));
		products.add(new Product(2, new BigDecimal(14), 10, new Date(), true, "Dove"));
		products.add(new Product(3, new BigDecimal(6), 5, new Date(), true, "Wheel"));
		products.add(new Product(4, new BigDecimal(5), 15, new Date(), true, "Surf"));
	}
	

	@RequestMapping(value="dashboard")
	public String dashboard(ModelMap map, HttpSession session)
	{
		map.addAttribute("products", products);
		map.addAttribute("cartProducts", cartProducts);
		
		System.out.println("Session "+session.getAttribute("SessionObject"));
		map.addAttribute("sessionCarts", sessionCarts);

		return "dash";
	}
	
	@RequestMapping(value="add-to-cart/{id}")
	public String addToCart(@PathVariable("id") int id, ModelMap map, HttpSession session)
	{
		map.addAttribute("products", products);
		for(Product pro: products)
		{
		    if(pro.getId() == id)
		    {
		    	System.out.println(pro.toString());
				//products.remove(pro);
		    	session.setAttribute("SessionObject", cartProducts);
		    	cartProducts.add(pro);
		    }
		}
		return "redirect:/dashboard";
	}
	
	
	@RequestMapping(value="payment/{id}")
	public String payment(@PathVariable("id") int id, ModelMap map)
	{
		System.out.println(products.size());
		if(id < products.size())
		{
			return "redirect:/success";
		}
		return "redirect:/failure";
	}

	
	
//	@RequestMapping(value="/")
//	public String index()
//	{
//		return "dash";
//	}
	
	@RequestMapping(value="success")
	public String success()
	{
		cartProducts = null;
		return "success";
	}

	@RequestMapping(value="failure")
	public String failure()
	{
		cartProducts = null;
		return "failure";
	}
	
	@RequestMapping(value="save-cart")
	public String saveCart(ModelMap map, HttpSession session, @RequestParam("id") int id, @RequestParam("quantity") int quantity, @RequestParam("name") String name, @RequestParam("price") String price)
	{
		sessionCarts.add(new Product(id, new BigDecimal(price), quantity, new Date(), false, name));
		System.out.println("product id "+id);
		System.out.println("sessionCarts "+sessionCarts.size());

		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="order-cart")
	public String orderCart(ModelMap map)
	{
		map.addAttribute("sessionCarts", sessionCarts);

		return "cartProduct";
	}
	
}