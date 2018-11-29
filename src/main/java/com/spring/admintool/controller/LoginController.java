package com.spring.admintool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/public")
public class LoginController {

	@GetMapping("/login")
	public String login() {
		return "general/login";
	}
}
