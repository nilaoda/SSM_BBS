package com.nilaoda.service;

import java.util.List;

import com.nilaoda.po.ThreadPost;


/**
 * 帖子接口
 * @author nilao
 *
 */

public interface ThreadService
{
	//查询用所有帖子
	public List<ThreadPost> findThreads();
	
	//查找某用户发表的帖子
	public List<ThreadPost> findThreadsByUID(int UID);
	
	//查询帖子内容
	public ThreadPost findThreadByTID(int TID);
	
	//增加帖子点击量
	public ThreadPost addThreadClickByTID(int TID);
	
	//发布帖子
	public int insertThread(ThreadPost threadPost);
	
	//修改帖子
	public int updateThread(ThreadPost threadPost);	
	
	//删除帖子
	public int deleteThread(ThreadPost threadPost);
	
	//搜索帖子
	public List<ThreadPost> searchThread(ThreadPost threadPost);
}
