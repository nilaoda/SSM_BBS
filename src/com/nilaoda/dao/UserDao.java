package com.nilaoda.dao;
/**
 * �û�Dao��ӿ�
 * @author nilao
 *
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nilaoda.po.User;

public interface UserDao
{
	//ͨ���˺������ѯ�û�  (ʹ��@Param�������������ļ�������#{username}����)
	public User findUser(@Param("username") String username, @Param("password") String password); 
	
	//ͨ���û��������û��Ƿ����
	public User findUserByUsername(String username);
	
	//����û�
	public int insertUser(User user);
	
	//���������û�
	public List<User> findAllUsers();
	
	//ɾ���û�����������ɾ�����û�������������ӣ�
	public int deleteUser(User user);
	
	//�޸�
	public int updateUser(User user);
}
