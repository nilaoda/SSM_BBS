<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>帖子列表 - 校园论坛</title>
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/jquery-3.4.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/layer/layer.js"></script>
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/mui.min.css" rel="stylesheet" type="text/css" >
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/media.css" rel="stylesheet" type="text/css"/ >
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/mui.min.js"></script>
<script>
function btn_post_click(){
	var field = $("#btn_field").html();
	var keyword = $("#inputSearch").val();
	if(field.indexOf("标题") != -1){
		window.location="${ pageContext.request.contextPath}/search?title="+encodeURI(keyword);
	}
	else if(field.indexOf("正文") != -1){
		window.location="${ pageContext.request.contextPath}/search?content="+encodeURI(keyword);
	}
	else if(field.indexOf("均出现") != -1){
		window.location="${ pageContext.request.contextPath}/search?title="+encodeURI(keyword)+"&content="+encodeURI(keyword);
	}
	else{
		layer.msg("请选择搜索字段!");
	}
}
function field_click(element){
	$("#btn_field").html(element.innerText+'\n<span class="mui-caret"></span>');
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
	  <span style="font-size:13px;padding:6px 24px 6px 0px;margin:5px;float:left"><strong>帖子列表</strong>&nbsp;/</span>
	  </div>
      <div class="mui-form--inline">
		  <div class="mui-textfield">
		    <input type="text"  onkeydown="if(event.keyCode==13) btn_post_click();" id="inputSearch" placeholder="搜索">
		  </div>
     	   <div class="mui-dropdown">
			<button id="btn_field" class="mui-btn mui-btn--raised" data-mui-toggle="dropdown">
				请选择字段
			  <span class="mui-caret"></span>
			</button>
			 <ul class="mui-dropdown__menu">
				 <li><a href="#" onclick="field_click(this)">标题</a></li>
				 <li><a href="#" onclick="field_click(this)">正文</a></li>
				 <li><a href="#" onclick="field_click(this)">均出现</a></li>
			</ul>
			</div>
		  <button class="mui-btn mui-btn--raised" onclick="btn_post_click();">搜索</button>
          <a href="${ pageContext.request.contextPath}/thread-post" class="mui-btn mui-btn--raised mui-btn--primary" style="float:right;margin:5px">发帖</a>
      </div>
	  <table class="mui-table mui-table--bordered" style="margin-top:20px">
		  <thead>
		    <tr class="hidden-xxxs">
		      <th colspan="2">标题</th>
		      <th style="width: 100px;" class="hidden-xxs">作者</th>
		      <th style="width: 150px;" class="hidden-xs">发表于</th></tr>
		  </thead>
		  <tbody>
		  <!-- 输出帖子列表 -->
		  <c:forEach items="${THREADS_LIST}" var="thread">
			    <tr>
			      <td colspan="2">
			        <a href="${ pageContext.request.contextPath}/thread/${thread.t_id}">${thread.t_title}</a>
			      </td>
			      <td class="hidden-xxs">
			        <a href="${ pageContext.request.contextPath}/user/${thread.t_uid}">${thread.userName}</a></td>
			      <td class="hidden-xs">${thread.t_time}</td>
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