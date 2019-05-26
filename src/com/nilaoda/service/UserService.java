package com.nilaoda.service;
/**
 * 用户Dao层接口
 * @author nilao
 *
 */

import java.util.List;

import com.nilaoda.po.User;

public interface UserService
{
	//通过账号密码查询用户
	public User findUser(String username, String password);
	
	//通过用户名查找用户是否存在
	public User findUserByUsername(String username);
	
	//添加用户
	public int insertUser(User user);
	
	//查找所有用户
	public List<User> findAllUsers();

	//删除用户
	public int deleteUser(User user);
	
	//修改用户
	public int updateUser(User user);
}
