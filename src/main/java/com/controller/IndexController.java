package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.UserDAO;
import com.model.User;

@Controller
public class IndexController

{

	@Autowired
	 UserDAO userDAO;
	
	@RequestMapping("/")
	public String landingpage(@ModelAttribute("user") User user,Model model)
	{
		return "index";

    }

	@RequestMapping("goToRegister")
	public String goToRegisterPage(@ModelAttribute("user") User user,Model model)
	{
	
		model.addAttribute("user",new User());
	
		return "register";


	}

	@RequestMapping("/saveUser")
	public ModelAndView saveUserData(@ModelAttribute("user") User user,BindingResult result)
	
		{
		ModelAndView m = new ModelAndView();
			if (result.hasErrors()) {
			   m.setViewName("register");	 
			   return m;
			 
			}
			else{
				userDAO.insertUser(user);
				user.setEnabled(true);
				user.setRole("ROLE_USER");
				m.setViewName("index");
			}
		
	   return m;
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
	public String reLogin(){
		return "login";
	}
}