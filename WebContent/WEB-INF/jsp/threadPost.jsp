<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>发布帖子 - 校园论坛</title>
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/jquery-3.4.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/layer/layer.js"></script>
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/mui.min.css" rel="stylesheet" type="text/css" />
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/media.css" rel="stylesheet" type="text/css" />
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/mui.min.js"></script>
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/ajaxfileupload.js"></script>
<script>
$(document).ready(function(e) {  
    $('body').on('change',$('#ImportPicInput'),function(){  
          $("#importPicName").val($( "#ImportPicInput").val());  
    });  
});  
function btn_post_click(){
	var title = $("#title").val();
	var content = "<p>"+$("#content").val().replace(/\n/g,"</p><p>")+"</p>";
	var uid = ${USER_SESSION.uid};
	if(title=="" || content==""){
		layer.msg('标题和正文不能为空');
		return;
	}
	
	//上传图片
	if($("#importPicName").val!=""){
		layer.msg('正在上传图片...', {icon: 16,time: 100000,shade : [0.5 , '#000' , true]});
		$.ajaxFileUpload({  
		    type: "POST",  
		    url: "${ pageContext.request.contextPath}/fileUpload.action",
		    secureuri : false,
		    fileElementId:'ImportPicInput',
		    dataType: 'json',
		    success: function(data){  
		        if(data.status=='OK'){  
		        	layer.msg('图片已上传');
		        	$.ajax({
		        	        url:"${ pageContext.request.contextPath}/threadPost.action",
		        	        type: "POST",
		        	        data: JSON.stringify({t_title:title, t_content:content, t_uid:uid, t_image:data.img}),
		        	        contentType:"application/json;charset=UTF-8",
		        	        dataType: "json",
		        	        success : function(data) {
		        				if(data.status=="OK"){
		        					layer.msg('发布成功');
		        					setTimeout(function(){
		        						window.location="thread/"+data.thread_id;
		        					}, 1000);
		        				}
		        				else{
		        					layer.msg('发布失败');
		        				}
		        			}
		        	});
		        }else{  
		        	layer.msg('图片上传失败'); 
		        }  
		    }
		});  
	}
	else{
		$.ajax({
		        url:"${ pageContext.request.contextPath}/threadPost.action",
		        type: "POST",
		        data: JSON.stringify({t_title:title, t_content:content, t_uid:uid}),
		        contentType:"application/json;charset=UTF-8",
		        dataType: "json",
		        success : function(data) {
					if(data.status=="OK"){
						layer.msg('发布成功');
						setTimeout(function(){
							window.location="thread/"+data.thread_id;
						}, 1000);
					}
					else{
						layer.msg('发布失败');
					}
				}
		});
	}
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
	    <c:if test="${USER_SESSION.admin == 1}"><a href="staffpanel">[管理组面板]</a>&nbsp;</c:if>
	     <a href="${ pageContext.request.contextPath}/user/${USER_SESSION.uid }"><strong>${USER_SESSION.username }</strong></a>&nbsp;
		  <a href="${ pageContext.request.contextPath}/logout">退出</a>
	  </td>
	  </tr>
	  </table>
	  </div>
	  <div style="height:40px">
	  <span style="font-size:13px;padding:6px 24px 6px 0px;margin:5px;float:left"><a href="${ pageContext.request.contextPath}/main"><strong>帖子列表</strong></a>&nbsp;/&nbsp;<strong>发布帖子</strong></span>
	  </div>
	  <div class="mui-textfield mui-textfield--float-label">
		 <input id="title" onkeydown="if(event.keyCode==13) btn_post_click();" type="text" class="form-control" placeholder="">
		 <label for="title">贴子标题</label>
	  </div>
	  <div class="mui-textfield mui-textfield--float-label">
	     <textarea id="content" rows="5"></textarea>
	     <label>帖子正文</label>
	  </div>
	  <div class="mui-textfield mui-textfield--float-label">
		  <input type ="file" id="ImportPicInput" name= "myfile" style="display: none" accept="image/*"/>  
	      <label for="importPicName">添加附件图片</label >  
	      <input type="text" disabled="disabled" id="importPicName" />  
	      <a href="#" onclick="$('#ImportPicInput').click();" style="float:right">点此选择图片文件</a>  
	  </div>
	   <button class="mui-btn mui-btn--raised mui-btn--primary" style="width:100%" onclick="btn_post_click();">发布</button>
	   <div class="panel-footer" style="text-align:center;padding-top:10px">
	    2019 @ nilaoda
	   </div>
	</div>
</div>
</body>
</html>