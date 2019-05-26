package com.nilaoda.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import sun.security.util.PropertyExpander.ExpandException;

public class LoginInterceptor implements HandlerInterceptor
{
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception
	{
		// ִ����ϣ�����ǰ����
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception
	{
		// �ڴ�������У�ִ������
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception
	{
		// �����ص�ִ��ǰ���أ��������true��ִ�����ص��Ĳ��������سɹ���
		// ����false��ִ������
		HttpSession session = request.getSession();
		if (session.getAttribute("USER_SESSION") != null)
		{
			return true;
		}
		else
		{
			// ���غ�����¼ҳ��
			String redirectUrl = request.getRequestURL().toString();
			try
			{
				redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8");
			}
			catch (Exception e)
			{
				System.err.println(e);
			}
			response.sendRedirect(request.getContextPath() + "/login" + "?redirect=" + redirectUrl);
			return false;
		}
	}
}
