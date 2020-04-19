package com.example.demo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class WelcomeController {

	// inject via application.properties
	@Value("${welcome.message:test}")
	private String message = "Hello World";

	@RequestMapping("/home")
	public String welcome(Map<String, Object> model) {
		model.put("message", this.message);
		return "welcome";
	}
	
	@PostMapping({"/chkLogin"})
	public String chkLogin(@RequestParam(value = "username", defaultValue = "") String username,
	       @RequestParam(value = "password", defaultValue = "") String password) {
	 	   
	 		if((username.equals("admin")) && (password.equals("admin"))) {
	 			return "welcome";
	 		}else {
	 			System.out.println("else : ");
	 			return "NoAuth";
	 		}
	}
}
