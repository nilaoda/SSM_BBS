package com.nilaoda.dao;

import java.util.List;

import com.nilaoda.po.ThreadPost;

public interface ThreadDao
{
	//������������
	public List<ThreadPost> findThreads();

	//����ĳ�û����������
	public List<ThreadPost> findThreadsByUID(int UID);
	
	//��ѯ�������û���
	public String findUsernameByUID(int UID);

	//��ѯ��������
	public ThreadPost findThreadByTID(int TID);
	
	//�������ӵ����
	public ThreadPost addThreadClickByTID(int TID);
	
	//��������
	public int insertThread(ThreadPost threadPost);
	
	//�޸�����
	public int updateThread(ThreadPost threadPost);
	
	//ɾ������
	public int deleteThread(ThreadPost threadPost);
	
	//��������
	public List<ThreadPost> searchThread(ThreadPost threadPost);
}
