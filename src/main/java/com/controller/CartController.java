package com.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.AddressDAO;
import com.dao.CartDAO;
import com.dao.ProductDAO;
import com.dao.UserDAO;
import com.model.Cart;
import com.model.Product;
import com.model.User;

@Controller
public class CartController {


	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	AddressDAO addressDAO;
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	UserDAO userDAO;
	
	
	@Autowired
	User user;
	


	int userId;
	
	
	@RequestMapping(value="/prodDetails/{pid}")
	public ModelAndView prodDet(@PathVariable("pid")int pid)
	{
		ModelAndView mv= new ModelAndView();
		Product p=productDAO.findByPID(pid);
		mv.addObject("product",p);
		mv.setViewName("prodDetails");
		
		return mv;
		
	}
	
    @RequestMapping(value="/addToCart/{id}")
    public String addProductToCart(@PathVariable("id") int id, HttpSession session,Model model,RedirectAttributes attributes)
    {
    	
    	Principal principal=SecurityContextHolder.getContext().getAuthentication();
    	
    	String email=principal.getName();
       	user= userDAO.getUserId(email);
    	 userId=user.getId();
    	 
    	 session.setAttribute("userid", userId);
      	int q=1;
    	if (cartDAO.getitem(id, userId) != null) {
			Cart item = cartDAO.getitem(id, userId);
			
			item.setProductQuantity(item.getProductQuantity() + q);
			
			Product p = productDAO.findByPID(id);
			
			System.out.println(item);
			item.setProductPrice(p.getPrice());
			item.setSubTotal(item.getProductQuantity() *p.getPrice());
			cartDAO.insertCart(item);
			attributes.addFlashAttribute("ExistingMessage",  p.getPname() +"is already exist");
	
			return "redirect:/";
		} else {
			Cart item = new Cart();
			Product p = productDAO.findByPID(id);
			item.setProductid(p.getPid());
			item.setProductName(p.getPname());
			item.setUserId(userId);
			item.setEmail(principal.getName());
			item.setProductQuantity(q);
			item.setStatus("C");
			item.setSubTotal(q * p.getPrice());
			item.setProductPrice(p.getPrice());
			cartDAO.insertCart(item);
			attributes.addFlashAttribute("SuccessMessage", "Item"+p.getPname()+" has been deleted Successfully");
			return "redirect:/";
		}
    	
    }
    @RequestMapping("viewcart")
	public String viewCart(Model model, HttpSession session) {
    	
		model.addAttribute("CartList", cartDAO.listCart());
		 if(cartDAO.cartsize((Integer) session.getAttribute("userid"))!=0){
			
			model.addAttribute("CartPrice", cartDAO.CartPrice((Integer) session.getAttribute("userid")));
		} else {
			model.addAttribute("EmptyCart", "true");
		}
		model.addAttribute("IfViewCartClicked", "true");
		return "cart";
	}

    @RequestMapping("editCart/{cartid}")
	public String editorder(@PathVariable("cartid") int cartid, @RequestParam("quantity") int q, HttpSession session) {
	
		int userId = (Integer) session.getAttribute("userid");
		Cart cart = cartDAO.editCartById(cartid);
		Product p = productDAO.findByPID(cart.getProductid());
		cart.setProductQuantity(q);
		//cart.setProductPrice(q * p.getPrice());
		cart.setSubTotal(q * p.getPrice());
		cartDAO.insertCart(cart);
		session.setAttribute("cartsize", cartDAO.cartsize((Integer) session.getAttribute("userid")));
		return "redirect:/viewcart";
	}
 
@RequestMapping(value="removeCart/{id}")
public String deleteorder(@PathVariable("id") int id, HttpSession session) {
	cartDAO.removeCartById(id);
	session.setAttribute("cartsize", cartDAO.cartsize((Integer) session.getAttribute("userid")));
	return "redirect:/viewcart";
}


@RequestMapping("continue_shopping")
public String continueshopping()
{
return "redirect:/";	

}
}
