<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>注册 - 校园论坛</title>
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/jquery-3.4.1.min.js"></script>
<script src="${ pageContext.request.contextPath}/layer/layer.js"></script>
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/mui.min.css" rel="stylesheet" type="text/css" />
<link href="${ pageContext.request.contextPath}/mui-0.9.41/css/media.css" rel="stylesheet" type="text/css" />
<script src="${ pageContext.request.contextPath}/mui-0.9.41/js/mui.min.js"></script>
<script>
function btn_post_click(){
	var username = $("#username").val();
	var password = $("#password").val();
	var password2 = $("#password2").val();
	if(username=="" || password==""){
		layer.msg('用户名或密码不能为空');
		return;
	}
	if(password2 != password){
		layer.msg('两次输入的密码不同');
	}
	
	$.ajax({
	        url:"${ pageContext.request.contextPath}/register.action",
	        type: "POST",
	        data:JSON.stringify({username:username,password:password}),
	        contentType:"application/json;charset=UTF-8",
	        dataType: "json",
	        success : function(data) {
				if(data.status=="OK"){
					layer.msg('注册成功');
					setTimeout(function(){
						window.location="login";
					}, 1000);
				}
				else if(data.status=="DUPE"){
					layer.msg('用户名已存在');
				}
				else{
					layer.msg('注册失败');
				}
			},
	});
}
</script>
</head>
<body>
<div class="mui-container" style="padding:5px">
	<div class="mui-panel">
	  <div class="panel-heading" style="padding:10px 0">
	  <table style="width:100%;">
	  <tr>
	  <td style="font-size:17px;"><b>校园论坛注册</b></td>
	  <td style="text-align:right">
		  <a href="${ pageContext.request.contextPath}/login">登录</a>
		  &nbsp;
	      <a href="${ pageContext.request.contextPath}/register">注册</a>
	  </td>
	  </tr>
	  </table>
	  </div>
	  <div class="mui-textfield mui-textfield--float-label">
		    <input id="username" onkeydown="if(event.keyCode==13) btn_post_click();" type="text" class="form-control" placeholder="">
		    <label for="username">用户名</label>
	  </div>
	  <div class="mui-textfield mui-textfield--float-label">
		    <input id="password" onkeydown="if(event.keyCode==13) btn_post_click();" type="password" class="form-control" placeholder="">
		    <label for="password">密码</label>
	   </div>
	   <div class="mui-textfield mui-textfield--float-label">
		    <input id="password2" onkeydown="if(event.keyCode==13) btn_post_click();" type="password" class="form-control" placeholder="">
		    <label for="password2">确认密码</label>
	   </div>
	   <button class="mui-btn mui-btn--raised mui-btn--primary" style="width:100%" onclick="btn_post_click();">注册</button>
	   <div class="panel-footer" style="text-align:center;padding-top:10px">
	    2019 @ nilaoda
	   </div>
	</div>
</div>
</body>
</html>