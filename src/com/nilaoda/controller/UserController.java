package com.nilaoda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nilaoda.po.ThreadPost;
import com.nilaoda.po.User;
import com.nilaoda.service.UserService;
import com.nilaoda.utils.MD5;

@Controller
public class UserController
{
	// 依赖注入
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestBody User inputUser, HttpSession session)
	{
		// 通过账号密码查询用户
		User user = userService.findUser(inputUser.getUsername(), MD5.getMD5(inputUser.getPassword()));
		if (user != null)
		{
			// 将用户添加到Session
			session.setAttribute("USER_SESSION", user);
			System.err.println("Login OK.");
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	@RequestMapping(value = "/register.action", method = RequestMethod.POST)
	@ResponseBody
	public String register(@RequestBody User inputUser)
	{
		// 查询是否已存在用户名
		User user = this.userService.findUserByUsername(inputUser.getUsername());
		if (user != null)
		{
			return "{\"status\":\"DUPE\"}";
		}
		inputUser.setPassword(MD5.getMD5(inputUser.getPassword()));
		inputUser.setAdmin(0); // 默认为非管理员
		int rows = userService.insertUser(inputUser);
		if (rows > 0)
		{
			System.err.println("Register OK.");
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		// 清除session
		session.invalidate();
		return "redirect:/login";
	}

	// 管理组面板
	@RequestMapping("/staffpanel")
	public String toStaff(HttpSession session)
	{
		List<User> users = this.userService.findAllUsers();
		if (users != null)
		{
			session.setAttribute("ALL_USERS", users);
		}
		return "staffPanel";
	}

	// 删除用户
	@RequestMapping(value = "/del.action", method = RequestMethod.POST)
	@ResponseBody
	public String delUser(@RequestBody User inputUser, HttpSession session)
	{
		User nowUser = (User)session.getAttribute("USER_SESSION");
		int admin = nowUser.getAdmin();
		if(admin!=1)
			return "{\"status\":\"NOT OK\"}";
		
		int rows = this.userService.deleteUser(inputUser);
		if (rows > 0)
		{
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	// 重置用户密码
	@RequestMapping(value = "/resetpassword.action", method = RequestMethod.POST)
	@ResponseBody
	public String resetUser(@RequestBody User inputUser, HttpSession session)
	{
		User nowUser = (User)session.getAttribute("USER_SESSION");
		int admin = nowUser.getAdmin();
		if(admin!=1)
			return "{\"status\":\"NOT OK\"}";
		
		inputUser.setPassword(MD5.getMD5(inputUser.getPassword()));
		int rows = this.userService.updateUser(inputUser);
		if (rows > 0)
		{
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	// 重置用户用户名
	@RequestMapping(value = "/renameuser.action", method = RequestMethod.POST)
	@ResponseBody
	public String renameUser(@RequestBody User inputUser, HttpSession session)
	{
		User nowUser = (User)session.getAttribute("USER_SESSION");
		int admin = nowUser.getAdmin();
		if(admin!=1)
			return "{\"status\":\"NOT OK\"}";
		
		int rows = this.userService.updateUser(inputUser);
		if (rows > 0)
		{
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	// 设为管理员
	@RequestMapping(value = "/setadmin.action", method = RequestMethod.POST)
	@ResponseBody
	public String setAdminUser(@RequestBody User inputUser, HttpSession session)
	{
		User nowUser = (User)session.getAttribute("USER_SESSION");
		int admin = nowUser.getAdmin();
		if(admin!=1)
			return "{\"status\":\"NOT OK\"}";
		
		inputUser.setAdmin(1);
		int rows = this.userService.updateUser(inputUser);
		if (rows > 0)
		{
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	// 取消管理员
	@RequestMapping(value = "/takeadmin.action", method = RequestMethod.POST)
	@ResponseBody
	public String takeAdminUser(@RequestBody User inputUser, HttpSession session)
	{
		User nowUser = (User)session.getAttribute("USER_SESSION");
		int admin = nowUser.getAdmin();
		if(admin!=1)
			return "{\"status\":\"NOT OK\"}";
		
		inputUser.setAdmin(0);
		int rows = this.userService.updateUser(inputUser);
		if (rows > 0)
		{
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}
}
