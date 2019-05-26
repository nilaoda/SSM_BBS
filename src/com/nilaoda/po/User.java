package com.nilaoda.po;

public class User
{
	String username;
	String password;
	int admin;
	int uid;
	public int getUid()
	{
		return uid;
	}
	public void setUid(int uid)
	{
		this.uid = uid;
	}
	public Integer getAdmin()
	{
		return admin;
	}
	public void setAdmin(int admin)
	{
		this.admin = admin;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	@Override
	public String toString()
	{
		return "User [username=" + username + ", password=" + password + ", admin=" + admin + "]";
	}
}
