<%@page import="com.nilaoda.po.ThreadPost"%>
<%@page import="com.nilaoda.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
  	//权限验证
  	User user = (User) session.getAttribute("USER_SESSION");
    ThreadPost threadPost = (ThreadPost) session.getAttribute("THREAD_DETAIL");
  	if (user.getAdmin() != 1 && user.getUid() != threadPost.getT_uid())
  	{
  		response.sendRedirect(request.getContextPath() + "/main");
  		return;
  	}
  %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>编辑帖子 - 校园论坛</title>
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/jquery-3.4.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/layer/layer.js"></script>
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/mui.min.css" rel="stylesheet" type="text/css" >
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/media.css" rel="stylesheet" type="text/css" >
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/mui.min.js"></script>
<script>
function btn_post_click(){
	var title = $("#title").val();
	var content = "<p>"+$("#content").val().replace(/\n/g,"</p><p>")+"</p>";
	var t_id = ${THREAD_DETAIL.t_id };
	$.ajax({
	        url:"${ pageContext.request.contextPath}/threadEdit.action",
	        type: "POST",
	        data:JSON.stringify({t_id:t_id, t_content:content, t_title:title}),
	        contentType:"application/json;charset=UTF-8",
	        dataType: "json",
	        success : function(data) {
				if(data.status=="OK"){
					layer.msg('更新成功');
					setTimeout(function(){
						window.location="../thread/"+t_id;
					}, 500);
				}
				else{
					layer.msg('更新失败');
				}
			},
	});
}
</script>

</head>
<body>
<div class="mui-container" id="container" style="padding:5px">
	<div class="mui-panel">
	  <div class="panel-heading" style="padding:10px 0">
	  <table style="width:100%;">
	  <tr>
	  <td style="font-size:17px;"><b>校园论坛</b></td>
	  <td style="text-align:right">
	    <c:if test="${USER_SESSION.admin == 1}"><a href="{ pageContext.request.contextPath}/staffpanel">[管理组面板]</a>&nbsp;</c:if>
	     <a href="${ pageContext.request.contextPath}/user/${USER_SESSION.uid }"><strong>${USER_SESSION.username }</strong></a>&nbsp;
		  <a href="${ pageContext.request.contextPath}/logout">退出</a>
	  </td>
	  </tr>
	  </table>
	  </div>
	  <div style="height:40px">
	  <span style="font-size:13px;padding:6px 24px 6px 0px;margin:5px;float:left"><a href="${ pageContext.request.contextPath}/main"><strong>帖子列表</strong></a>&nbsp;/&nbsp;<strong>编辑帖子</strong></span>
	  </div>
	  <div class="mui-textfield mui-textfield--float-label">
		    <input id="title" onkeydown="if(event.keyCode==13) btn_post_click();" type="text" class="form-control" placeholder="" value="${THREAD_DETAIL.t_title }" />
		    <label for="title">贴子标题</label>
	  </div>
	  <div class="mui-textfield mui-textfield--float-label">
	    <textarea id="content" rows="5">${THREAD_DETAIL.t_content}</textarea>
	    <label>帖子正文</label>
	  </div>
	   <button class="mui-btn mui-btn--raised mui-btn--primary" style="width:100%" onclick="btn_post_click();">确定</button>
	   <div class="panel-footer" style="text-align:center;padding-top:10px">
	    2019 @ nilaoda
	   </div>
	</div>
</div>
</body>
</html>