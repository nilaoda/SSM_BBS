package com.nilaoda.dao;
/**
 * 用户Dao层接口
 * @author nilao
 *
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nilaoda.po.User;

public interface UserDao
{
	//通过账号密码查询用户  (使用@Param命名后在配置文件中能用#{username}访问)
	public User findUser(@Param("username") String username, @Param("password") String password); 
	
	//通过用户名查找用户是否存在
	public User findUserByUsername(String username);
	
	//添加用户
	public int insertUser(User user);
	
	//查找所有用户
	public List<User> findAllUsers();
	
	//删除用户（触发器会删除该用户发表的所有帖子）
	public int deleteUser(User user);
	
	//修改
	public int updateUser(User user);
}
