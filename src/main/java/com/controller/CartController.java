package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.dao.CartDAO;
import com.dao.ProductDAO;
import com.model.Cart;
import com.model.Product;

@Controller
public class CartController {

	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	 @RequestMapping(value="/addToCart/{id}")
	    public String addProductToCart(@PathVariable("id") int id, HttpSession session,Model model)
	    {
	    	String email = (String) session.getAttribute("email");
	    	int q=1;
	    	if (cartDAO.getitem(id, email) != null) {
				Cart item = cartDAO.getitem(id, email);
				
				item.setProductQuantity(item.getProductQuantity() + q);
				
				Product p = productDAO.findByPID(id);
				
				System.out.println(item);
				item.setPrice(p.getPrice());
				item.setSubTotal(item.getProductQuantity() *p.getPrice());
				cartDAO.insertCart(item);
				return "cart";
			} else {
				Cart item = new Cart();
				Product p = productDAO.findByPID(id);
				item.setPid(p.getPid());
				item.setProductName(p.getPname());
				item.setEmail(email);
				item.setProductQuantity(q);
				
				item.setSubTotal(q * p.getPrice());
				item.setPrice(p.getPrice());
				cartDAO.insertCart(item);
				return "cart";
			}
	    	
	    }
	 @RequestMapping(value="/prodDetails/{pid}")
	 public ModelAndView prodDet(@PathVariable("pid")int pid)
	 {
	 	ModelAndView mv= new ModelAndView();
	 	Product p=productDAO.findByPID(pid);
	 	mv.addObject("product",p);
	 	mv.setViewName("prodDetails");
	 	return mv;
	 	
	 }
	 /* @RequestMapping("cart")
		public String viewCart(Model model, HttpSession session) {
	    	
			int userId = (Integer) session.getAttribute("userid");
			model.addAttribute("CartList", cartDAO.listCartbyUserId(userId));
			 if(cartDAO.cartsize((Integer) session.getAttribute("userid"))!=0){
				
				model.addAttribute("CartPrice", cartDAO.CartPrice((Integer) session.getAttribute("userid")));
			} else {
				model.addAttribute("EmptyCart", "true");
			}
			model.addAttribute("IfcartClicked", "true");
		//	model.addAttribute("HideOthers", "true");
			return "Cart";
		}*/

}
