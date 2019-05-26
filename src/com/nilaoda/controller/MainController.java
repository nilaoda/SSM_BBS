package com.nilaoda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nilaoda.utils.MD5;

@Controller
public class MainController
{
	@RequestMapping("/thread-post")
	public String toThreadPost() {
		return "threadPost";
	}
	
	@RequestMapping("/")
    public String welcome(){
        return "redirect:/main";
    }
	
	@RequestMapping("/login")
	public String toLogin() {
		/*
		System.out.println(MD5.getMD5("admin"));
		System.out.println(MD5.getMD5("123456"));
		System.out.println(MD5.getMD5("admin"));
		*/
		return "login";
	}
	
	@RequestMapping("/register")
	public String toRegister() {
		return "register";
	}
}
