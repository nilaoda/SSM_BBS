package com.nilaoda.po;


public class ThreadPost
{
	int t_id;
	int t_uid;
	int t_replyCount;
	int t_clickCount;
	int lastReplyID;
	String userName;
	String t_title;
	String t_content;
	String t_time;
	String t_lastTime;
	String t_image;
	public String getT_image()
	{
		return t_image;
	}
	public void setT_image(String t_image)
	{
		this.t_image = t_image;
	}
	@Override
	public String toString()
	{
		return "ThreadPost [t_id=" + t_id + ", t_uid=" + t_uid + ", t_replyCount=" + t_replyCount + ", t_clickCount="
				+ t_clickCount + ", lastReplyID=" + lastReplyID + ", userName=" + userName + ", t_title=" + t_title
				+ ", t_content=" + t_content + ", t_time=" + t_time + ", t_lastTime=" + t_lastTime + ", t_image="
				+ t_image + "]";
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public int getT_id()
	{
		return t_id;
	}
	public void setT_id(int t_id)
	{
		this.t_id = t_id;
	}
	public int getT_uid()
	{
		return t_uid;
	}
	public void setT_uid(int t_uid)
	{
		this.t_uid = t_uid;
	}
	public int getT_replyCount()
	{
		return t_replyCount;
	}
	public void setT_replyCount(int t_replyCount)
	{
		this.t_replyCount = t_replyCount;
	}
	public int getT_clickCount()
	{
		return t_clickCount;
	}
	public void setT_clickCount(int t_clickCount)
	{
		this.t_clickCount = t_clickCount;
	}
	public int getLastReplyID()
	{
		return lastReplyID;
	}
	public void setLastReplyID(int lastReplyID)
	{
		this.lastReplyID = lastReplyID;
	}
	public String getT_title()
	{
		return t_title;
	}
	public void setT_title(String t_title)
	{
		this.t_title = t_title;
	}
	public String getT_content()
	{
		return t_content;
	}
	public void setT_content(String t_content)
	{
		this.t_content = t_content;
	}
	public String getT_time()
	{
		return t_time;
	}
	public void setT_time(String t_time)
	{
		this.t_time = t_time;
	}
	public String getT_lastTime()
	{
		return t_lastTime;
	}
	public void setT_lastTime(String t_lastTime)
	{
		this.t_lastTime = t_lastTime;
	}
}
