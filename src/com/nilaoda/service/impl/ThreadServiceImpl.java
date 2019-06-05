package com.nilaoda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nilaoda.dao.ThreadDao;
import com.nilaoda.po.ThreadPost;
import com.nilaoda.service.ThreadService;

@Service("threadService")
@Transactional
public class ThreadServiceImpl implements ThreadService
{
	// 注入UserDao
	@Autowired
	private ThreadDao threadDao;

	// 查询所有帖子
	@Override
	public List<ThreadPost> findThreads()
	{
		return this.threadDao.findThreads();
	}

	// 查询帖子正文
	@Override
	public ThreadPost findThreadByTID(int TID)
	{
		return this.threadDao.findThreadByTID(TID);
	}

	// 添加帖子
	@Override
	public int insertThread(ThreadPost threadPost)
	{
		return this.threadDao.insertThread(threadPost);
	}

	// 查找某用户发布的帖子
	@Override
	public List<ThreadPost> findThreadsByUID(int UID)
	{
		return this.threadDao.findThreadsByUID(UID);
	}

	// 修改帖子
	@Override
	public int updateThread(ThreadPost threadPost)
	{
		return this.threadDao.updateThread(threadPost);
	}

	// 删除帖子
	@Override
	public int deleteThread(ThreadPost threadPost)
	{
		return this.threadDao.deleteThread(threadPost);
	}

	// 添加帖子
	@Override
	public ThreadPost addThreadClickByTID(int TID)
	{
		return this.threadDao.addThreadClickByTID(TID);
	}

	// 搜索帖子
	@Override
	public List<ThreadPost> searchThread(ThreadPost threadPost)
	{
		return this.threadDao.searchThread(threadPost);
	}
}
