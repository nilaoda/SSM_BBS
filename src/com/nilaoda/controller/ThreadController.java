package com.nilaoda.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nilaoda.po.ThreadPost;
import com.nilaoda.po.User;
import com.nilaoda.service.ThreadService;

@Controller
public class ThreadController
{
	// 依赖注入
	@Autowired
	private ThreadService threadService;

	// 主界面
	@RequestMapping("/main")
	public String toMain(HttpSession session)
	{
		List<ThreadPost> threads = this.threadService.findThreads();
		if (threads != null)
		{
			// 使新帖子在上面
			Collections.reverse(threads);
			// 将List添加到Session
			session.setAttribute("THREADS_LIST", threads);
		}
		return "main";
	}

	// 搜索结果页
	@RequestMapping("/search")
	public String toSearch(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String t_title="";
		String t_content="";
		if (request.getParameter("title") != null)
			t_title = URLDecoder.decode(request.getParameter("title"), "UTF-8");
		if (request.getParameter("content") != null)
			t_content = URLDecoder.decode(request.getParameter("content"), "UTF-8");
		ThreadPost threadPost = new ThreadPost();
		if (!t_content.isEmpty())
			threadPost.setT_content(t_content);
		if (!t_title.isEmpty())
			threadPost.setT_title(t_title);
		List<ThreadPost> threads = this.threadService.searchThread(threadPost);
		if (threads != null)
		{
			// 使新帖子在上面
			Collections.reverse(threads);
			// 将List添加到Session
			session.setAttribute("SEARCH_RESULT", threads);
		}
		return "search";
	}

	// 帖子详情
	@RequestMapping("/thread/{t_id}")
	public String getDetail(@PathVariable("t_id") Integer t_id, HttpSession session)
	{
		if (session.getAttribute("THREAD_DETAIL") != null)
		{
			session.removeAttribute("THREAD_DETAIL");
		}
		// 增加浏览量
		this.threadService.addThreadClickByTID(t_id);
		// 取出帖子内容
		ThreadPost threadPost = this.threadService.findThreadByTID(t_id);
		session.setAttribute("THREAD_DETAIL", threadPost);
		return "detail";
	}

	// 编辑帖子
	@RequestMapping("/edit/{t_id}")
	public String editDetail(@PathVariable("t_id") Integer t_id, HttpSession session)
	{
		if (session.getAttribute("THREAD_DETAIL") != null)
		{
			session.removeAttribute("THREAD_DETAIL");
		}
		ThreadPost threadPost = this.threadService.findThreadByTID(t_id);
		threadPost.setT_content(
				threadPost.getT_content().replaceAll("</p><p>", "\n").replaceAll("<p>", "").replaceAll("</p>", ""));
		session.setAttribute("THREAD_DETAIL", threadPost);
		return "edit";
	}

	// 编辑帖子
	@RequestMapping(value = "/threadEdit.action", method = RequestMethod.POST)
	@ResponseBody
	public String updateThread(@RequestBody ThreadPost threadPost, HttpSession session)
	{
		User nowUser = (User)session.getAttribute("USER_SESSION");
		int admin = nowUser.getAdmin();
		if(admin!=1 && threadPost.getT_uid()!=nowUser.getUid())
			return "{\"status\":\"NOT OK\"}";
		
		int rows = this.threadService.updateThread(threadPost);
		if (rows > 0)
		{
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	// 删除帖子
	@RequestMapping(value = "/threadDel.action", method = RequestMethod.POST)
	@ResponseBody
	public String delThread(@RequestBody ThreadPost threadPost, HttpSession session)
	{
		User nowUser = (User)session.getAttribute("USER_SESSION");
		int admin = nowUser.getAdmin();
		if(admin!=1 && threadPost.getT_uid()!=nowUser.getUid())
			return "{\"status\":\"NOT OK\"}";
		
		int rows = this.threadService.deleteThread(threadPost);
		if (rows > 0)
		{
			return "{\"status\":\"OK\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}

	// 用户详情页
	@RequestMapping("/user/{uid}")
	public String toUser(@PathVariable("uid") Integer uid, HttpSession session)
	{
		if (session.getAttribute("USER_THREADS") != null)
		{
			session.removeAttribute("USER_THREADS");
		}
		List<ThreadPost> threadPosts = this.threadService.findThreadsByUID(uid);
		if (threadPosts != null)
		{
			// 使新帖子在上面
			Collections.reverse(threadPosts);
			// 将List添加到Session
			session.setAttribute("USER_THREADS", threadPosts);
		}
		return "user";
	}

	@RequestMapping(value = "/threadPost.action", method = RequestMethod.POST)
	@ResponseBody
	public String newThread(@RequestBody ThreadPost inputThread)
	{
		String t_time = (new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
		inputThread.setT_time(t_time);
		int rows = this.threadService.insertThread(inputThread);
		if (rows > 0)
		{
			return "{\"status\":\"OK\",\"thread_id\":\"" + inputThread.getT_id() + "\"}";
		}
		// 返回错误信息
		return "{\"status\":\"NOT OK\"}";
	}
}
