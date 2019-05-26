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
	// ����ע��
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestBody User inputUser, HttpSession session)
	{
		// ͨ���˺������ѯ�û�
		User user = userService.findUser(inputUser.getUsername(), MD5.getMD5(inputUser.getPassword()));
		if (user != null)
		{
			// ���û���ӵ�Session
			session.setAttribute("USER_SESSION", user);
			System.err.println("Login OK.");
			return "{\"status\":\"OK\"}";
		}
		// ���ش�����Ϣ
		return "{\"status\":\"NOT OK\"}";
	}

	@RequestMapping(value = "/register.action", method = RequestMethod.POST)
	@ResponseBody
	public String register(@RequestBody User inputUser)
	{
		// ��ѯ�Ƿ��Ѵ����û���
		User user = this.userService.findUserByUsername(inputUser.getUsername());
		if (user != null)
		{
			return "{\"status\":\"DUPE\"}";
		}
		inputUser.setPassword(MD5.getMD5(inputUser.getPassword()));
		inputUser.setAdmin(0); // Ĭ��Ϊ�ǹ���Ա
		int rows = userService.insertUser(inputUser);
		if (rows > 0)
		{
			System.err.println("Register OK.");
			return "{\"status\":\"OK\"}";
		}
		// ���ش�����Ϣ
		return "{\"status\":\"NOT OK\"}";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		// ���session
		session.invalidate();
		return "redirect:/login";
	}

	// ���������
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

	// ɾ���û�
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
		// ���ش�����Ϣ
		return "{\"status\":\"NOT OK\"}";
	}

	// �����û�����
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
		// ���ش�����Ϣ
		return "{\"status\":\"NOT OK\"}";
	}

	// �����û��û���
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
		// ���ش�����Ϣ
		return "{\"status\":\"NOT OK\"}";
	}

	// ��Ϊ����Ա
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
		// ���ش�����Ϣ
		return "{\"status\":\"NOT OK\"}";
	}

	// ȡ������Ա
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
		// ���ش�����Ϣ
		return "{\"status\":\"NOT OK\"}";
	}
}
