package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.User;
import com.example.demo.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
    private UserService service;
    
	@RequestMapping({"/", "/index.html"})
    public String form(){
        return "Login";
    }
    
    @RequestMapping("/login")
    public String login(@ModelAttribute User user, Model model){
        model.addAttribute("AddPackage", service.isExists(user));
        if(service.isExists(user) == true) {
        	 return "welcome";
        }else {
        	return "Login";
        }
    }
}
