package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daoimpl.CategoryDAOImpl;
import com.daoimpl.ProductDAOImpl;
import com.daoimpl.UserDAOImpl;
import com.model.User;

@Controller
public class IndexController

{

	@Autowired
	 UserDAOImpl userDAOImpl;
	
	@Autowired
	ProductDAOImpl  productDAOImpl;
	
	@Autowired
	CategoryDAOImpl categoryDAOImpl;

	
	@RequestMapping("/")
	public String index()
	{
	
		return "index";
	}

	@RequestMapping("/index")
	public String home()
	{
	
		return "index";
	}
	@RequestMapping(value="/goToRegister",method=RequestMethod.GET)
	public ModelAndView goToRegister()
	{
		ModelAndView mv= new ModelAndView();
		mv.addObject("user",new User());

		mv.setViewName("register");
		return mv;
		
		
	}
	@RequestMapping(value="/saveUser",method=RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute("user")User user,BindingResult result)
	{
		ModelAndView mv=new ModelAndView();
		if(result.hasErrors())
		{
			mv.setViewName("register");
			return mv;
		}
		else{
			user.setRole("ROLE_USER");
			user.setEnable(true);
			userDAOImpl.insertUser(user);
			mv.setViewName("index");
			}
		return mv;
	}
	
	@RequestMapping(value="/productCustList")
	public ModelAndView getCustTable(@RequestParam("cid")int cid)
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("prodList",productDAOImpl.getProdByCatId(cid));
		mv.setViewName("productCustList");
		return mv;
	}
	@ModelAttribute
	public void getData(Model m)
	{
		m.addAttribute("catList",categoryDAOImpl.retrieve());
	}
	
	@RequestMapping("/goToLogin") 
	public String goToLogin(){
		return "login";
	}
	
	
	@RequestMapping("/userLogged")
	public String userLogged(){
		return "redirect:/index";
	}
	
	@RequestMapping("/reLogin")
	public String relogin()
	{
		return "redirect:/goToLogin";
	}
	
}