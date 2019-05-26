package com.nilaoda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nilaoda.dao.UserDao;
import com.nilaoda.po.User;
import com.nilaoda.service.UserService;
/**
 * UserServiceʵ����
 * @author nilao
 *
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService
{
	//ע��UserDao
	@Autowired
	private UserDao userDao;

	//ͨ���˺������ѯ�û�
	@Override
	public User findUser(String username, String password)
	{
		User user = this.userDao.findUser(username, password);
		return user;
	}


	@Override
	public User findUserByUsername(String username)
	{
		return this.userDao.findUserByUsername(username);
	}

	@Override
	public int insertUser(User user)
	{
		return this.userDao.insertUser(user);
	}

	//���������û�
	@Override
	public List<User> findAllUsers()
	{
		return this.userDao.findAllUsers();
	}

	//ɾ��һ���û�
	@Override
	public int deleteUser(User user)
	{
		return this.userDao.deleteUser(user);
	}

	//�޸��û�
	@Override
	public int updateUser(User user)
	{
		return this.userDao.updateUser(user);
	}

}
