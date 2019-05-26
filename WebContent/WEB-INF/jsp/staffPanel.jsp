<%@page import="com.nilaoda.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
  	//权限验证
  	User user = (User) session.getAttribute("USER_SESSION");
  	if (user.getAdmin() != 1)
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
<title>管理组面板 - 校园论坛</title>
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/jquery-3.4.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/layer/layer.js"></script>
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/mui.min.css" rel="stylesheet" type="text/css" >
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/media.css" rel="stylesheet" type="text/css" >
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/mui.min.js"></script>
<script>
function btn_click(element){
	if(element.id.search("del_") != -1){
		var uid = element.id.replace(/del_/, "");
		var username = element.name;
		layer.confirm('该操作将同时删除用户['+username+']的所有帖子！', {
			  btn: ['确定','取消'], //按钮
		      title:'确定要删除用户吗?'
			}, function(){
				$.ajax({
				        url:"${ pageContext.request.contextPath}/del.action",
				        type: "POST",
				        data:JSON.stringify({uid:uid}),
				        contentType:"application/json;charset=UTF-8",
				        dataType: "json",
				        success : function(data) {
							if(data.status=="OK"){
								layer.msg('删除成功');
								setTimeout(function(){
									window.location.reload()
								}, 1000);
							}
							else{
								layer.msg('删除失败');
							}
						},
				});
			}, function(){
			   return;
		});
	}
	else if(element.id.search("reset_") != -1){
		var uid = element.id.replace(/reset_/, "");
		var username = element.name;
		layer.prompt({
			  formType: 0,
			  value: '',
			  title: '修改用户['+username+']的密码',
			  area: ['340px', '150px'] //自定义文本域宽高
			}, function(value, index, elem){
			   if(value!=""){
				   layer.msg('操作中...', {icon: 16,time: 100000,shade : [0.5 , '#000' , true]});
				   $.ajax({
			        url:"${ pageContext.request.contextPath}/resetpassword.action",
			        type: "POST",
			        data:JSON.stringify({uid:uid, password:value}),
			        contentType:"application/json;charset=UTF-8",
			        dataType: "json",
			        success : function(data) {
						if(data.status=="OK"){
							layer.msg('密码重置成功');
						}
						else{
							layer.msg('密码重置失败');
						}
					},
			       });
               }
			  layer.close(index);
			});
	}
	else if(element.id.search("rename_") != -1){
		var uid = element.id.replace(/rename_/, "");
		var username = element.name;
		layer.prompt({
			  formType: 0,
			  value: username,
			  title: '修改用户['+username+']的用户名',
			  area: ['340px', '150px'] //自定义文本域宽高
			}, function(value, index, elem){
			   if(value!="" && value!=username){
				   layer.msg('操作中...', {icon: 16,time: 100000,shade : [0.5 , '#000' , true]});
				   $.ajax({
			        url:"${ pageContext.request.contextPath}/renameuser.action",
			        type: "POST",
			        data:JSON.stringify({uid:uid, username:value}),
			        contentType:"application/json;charset=UTF-8",
			        dataType: "json",
			        success : function(data) {
						if(data.status=="OK"){
							layer.msg('用户名修改成功');
							setTimeout(function(){
								window.location.reload()
							}, 1000);
						}
						else{
							layer.msg('用户名修改失败');
						}
					},
			       });
               }
			  layer.close(index);
			});
	}
	else if(element.id.search("setAdmin_") != -1){
		var uid = element.id.replace(/setAdmin_/, "");
		var username = element.name;
		layer.confirm('确定要将用户['+username+']设置为管理员吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				$.ajax({
				        url:"${ pageContext.request.contextPath}/setadmin.action",
				        type: "POST",
				        data:JSON.stringify({uid:uid}),
				        contentType:"application/json;charset=UTF-8",
				        dataType: "json",
				        success : function(data) {
							if(data.status=="OK"){
								layer.msg('设置成功');
								setTimeout(function(){
									window.location.reload()
								}, 1000);
							}
							else{
								layer.msg('设置失败');
							}
						},
				});
			}, function(){
			   return;
		});
	}
	else if(element.id.search("takeAdmin_") != -1){
		var uid = element.id.replace(/takeAdmin_/, "");
		var username = element.name;
		layer.confirm('确定要将用户['+username+']的管理员身份取消吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				$.ajax({
				        url:"${ pageContext.request.contextPath}/takeadmin.action",
				        type: "POST",
				        data:JSON.stringify({uid:uid}),
				        contentType:"application/json;charset=UTF-8",
				        dataType: "json",
				        success : function(data) {
							if(data.status=="OK"){
								layer.msg('设置成功');
								setTimeout(function(){
									window.location.reload()
								}, 1000);
							}
							else{
								layer.msg('设置失败');
							}
						},
				});
			}, function(){
			   return;
		});
	}
}
</script>
</head>
<body>
<div class="mui-container" style="padding:5px">
	<div class="mui-panel">
	  <div class="panel-heading" style="padding:10px 0">
	  <table style="width:100%;">
	  <tr>
	  <td style="font-size:17px;"><b>校园论坛</b></td>
	  <td style="text-align:right">
	     <c:if test="${USER_SESSION.admin == 1}"><a href="${ pageContext.request.contextPath}/staffpanel">[管理组面板]</a>&nbsp;</c:if>
	     <a href="${ pageContext.request.contextPath}/user/${USER_SESSION.uid }"><strong>${USER_SESSION.username }</strong></a>&nbsp;
		  <a href="${ pageContext.request.contextPath}/logout">退出</a>
	  </td>
	  </tr>
	  </table>
	  </div>
	  <div class="panel-body">
	  <div style="height:40px">
	  <span style="font-size:13px;padding:6px 24px 6px 0px;margin:5px;float:left"><a href="${ pageContext.request.contextPath}/main"><strong>帖子列表</strong></a>&nbsp;/&nbsp;<strong>管理组面板</strong></span>
	  </div>
	  <table class="mui-table mui-table--bordered" style="margin-top:20px">
		  <thead>
		    <tr class="hidden-xxxs">
		      <th class="hidden-xs">UID</th>
		      <th>用户名</th>
		      <th>身份</th>
		      <th>操作</th></tr>
		  </thead>
		  <tbody>
		  <!-- 输出帖子列表 -->
		  <c:forEach items="${ALL_USERS}" var="user">
			    <tr>
			      <td class="hidden-xs">
			        ${user.uid}
			      </td>
			      <td>
			        ${user.username}
			      </td>
			      <td>
			        <c:if test="${user.admin == 1}">管理员</c:if>
			        <c:if test="${user.admin == 0}">普通会员</c:if>
			      </td>
			      <td>
			        <div class="mui-dropdown">
					  <button class="mui-btn mui-btn--flat" data-mui-toggle="dropdown">
					    请选择
					    <span class="mui-caret"></span>
					  </button>
					  <ul class="mui-dropdown__menu">
					    <c:if test="${user.username != USER_SESSION.username}"><li><a id="del_${user.uid}" href="#" name="${user.username}" onclick="btn_click(this)">删除用户</a></li></c:if>
					    <li><a id="reset_${user.uid}" name="${user.username}" href="#" onclick="btn_click(this)">重置密码</a></li>
					    <li><a id="rename_${user.uid}" name="${user.username}" href="#" onclick="btn_click(this)">修改用户名</a></li>
					    <c:if test="${user.admin == 0}"><li><a id="setAdmin_${user.uid}" href="#" name="${user.username}" onclick="btn_click(this)">设为管理员</a></li></c:if>
					    <c:if test="${user.admin == 1 && user.username != USER_SESSION.username}"><li><a id="takeAdmin_${user.uid}" href="#" name="${user.username}" onclick="btn_click(this)">取消管理员</a></li></c:if>
					  </ul>
					</div>
			      </td>
			    </tr>
		  </c:forEach>
		  </tbody>
		  <tfoot></tfoot>
		</table>
	  </div>
	   <div class="panel-footer" style="text-align:center;padding-top:10px">
	    2019 @ nilaoda
	   </div>
	</div>
</div>
</body>
</html>