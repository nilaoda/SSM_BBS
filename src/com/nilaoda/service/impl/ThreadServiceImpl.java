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
	// ע��UserDao
	@Autowired
	private ThreadDao threadDao;

	// ��ѯ��������
	@Override
	public List<ThreadPost> findThreads()
	{
		return this.threadDao.findThreads();
	}

	// ��ѯ��������
	@Override
	public ThreadPost findThreadByTID(int TID)
	{
		return this.threadDao.findThreadByTID(TID);
	}

	// �������
	@Override
	public int insertThread(ThreadPost threadPost)
	{
		return this.threadDao.insertThread(threadPost);
	}

	// ����ĳ�û�����������
	@Override
	public List<ThreadPost> findThreadsByUID(int UID)
	{
		return this.threadDao.findThreadsByUID(UID);
	}

	// �޸�����
	@Override
	public int updateThread(ThreadPost threadPost)
	{
		return this.threadDao.updateThread(threadPost);
	}

	// ɾ������
	@Override
	public int deleteThread(ThreadPost threadPost)
	{
		return this.threadDao.deleteThread(threadPost);
	}

	// �������
	@Override
	public ThreadPost addThreadClickByTID(int TID)
	{
		return this.threadDao.addThreadClickByTID(TID);
	}

	// ��������
	@Override
	public List<ThreadPost> searchThread(ThreadPost threadPost)
	{
		return this.threadDao.searchThread(threadPost);
	}
}
