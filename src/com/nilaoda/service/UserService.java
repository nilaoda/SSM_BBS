package com.nilaoda.service;
/**
 * �û�Dao��ӿ�
 * @author nilao
 *
 */

import java.util.List;

import com.nilaoda.po.User;

public interface UserService
{
	//ͨ���˺������ѯ�û�
	public User findUser(String username, String password);
	
	//ͨ���û��������û��Ƿ����
	public User findUserByUsername(String username);
	
	//����û�
	public int insertUser(User user);
	
	//���������û�
	public List<User> findAllUsers();

	//ɾ���û�
	public int deleteUser(User user);
	
	//�޸��û�
	public int updateUser(User user);
}
