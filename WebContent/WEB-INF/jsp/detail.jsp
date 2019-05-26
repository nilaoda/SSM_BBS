<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>${THREAD_DETAIL.t_title } - 校园论坛</title>
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/jquery-3.4.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/layer/layer.js"></script>
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/mui.min.css" rel="stylesheet" type="text/css" >
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/media.css" rel="stylesheet" type="text/css" >
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/mui.min.js"></script>
<script>
function btn_click(){
	var t_id = ${THREAD_DETAIL.t_id };
	layer.confirm('确定删除本帖子吗？', {
		  btn: ['确定','取消'], //按钮
	      title:'请确认'
		}, function(){
			$.ajax({
			        url:"${ pageContext.request.contextPath}/threadDel.action",
			        type: "POST",
			        data:JSON.stringify({t_id:t_id}),
			        contentType:"application/json;charset=UTF-8",
			        dataType: "json",
			        success : function(data) {
						if(data.status=="OK"){
							layer.msg('删除成功');
							setTimeout(function(){
								window.location = "${ pageContext.request.contextPath}/main"
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
	     <c:if test="${USER_SESSION.admin == 1}"><a href="${ pageContext.request.contextPath}/staffpanel">[管理组面板]</a>&nbsp;</c:if>
	     <a href="${ pageContext.request.contextPath}/user/${USER_SESSION.uid }"><strong>${USER_SESSION.username }</strong></a>&nbsp;
		  <a href="${ pageContext.request.contextPath}/logout">退出</a>
	  </td>
	  </tr>
	  </table>
	  </div>
	  <div style="height:40px">
	  <span style="font-size:13px;padding:6px 24px 6px 0px;margin:5px;float:left"><a href="${ pageContext.request.contextPath}/main"><strong>帖子列表</strong></a>&nbsp;/&nbsp;<strong>帖子详情</strong></span>
	  </div>
	  <h2>${THREAD_DETAIL.t_title }
		  <c:if test="${USER_SESSION.admin == 1 || USER_SESSION.uid == THREAD_DETAIL.t_uid}">
		      &nbsp;<a href="${ pageContext.request.contextPath}/edit/${THREAD_DETAIL.t_id }" style="font-size:14px">[编辑]</a>&nbsp;<a href="#" onclick="btn_click()" style="font-size:14px">[删除]</a>
	      </c:if>
	  </h2>
	  作者：<a href="${ pageContext.request.contextPath}/user/${THREAD_DETAIL.t_uid }"><strong>${THREAD_DETAIL.userName }</strong></a>
	  发布时间：${THREAD_DETAIL.t_time }&nbsp;浏览量：${THREAD_DETAIL.t_clickCount }&nbsp;回复数量：${THREAD_DETAIL.t_replyCount }
	  <div class="mui-divider"></div>
	  <div class="thread-content" style="padding:10px;margin:15px 0;text-indent:2em;">
	  ${THREAD_DETAIL.t_content }
	  <c:if test="${THREAD_DETAIL.t_image != null }">
		  <div class="image">
		      <i>附件：</i><br/>
		      <img src="${ pageContext.request.contextPath}/upload/${THREAD_DETAIL.t_image}" style="max-width:100%" alt="${THREAD_DETAIL.t_image}" />
		  </div>
	  </c:if>
	  </div>
	   <div class="panel-footer" style="text-align:center;padding-top:10px">
	    2019 @ nilaoda
	   </div>
	</div>
</div>
</body>
</html>