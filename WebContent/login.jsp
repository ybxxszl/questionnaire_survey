<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<body>
	<%@include file="head.jsp" %>
	<form action="${pageContext.request.contextPath }/loginUser.action" method="post">
		<table border="2px" align="center">
			<tr>
				<th colspan="3">
					<div id="title" align="center">登录</div>
				</th>
			</tr>
			<tr>
				<td>
					<div class="prompt">账号</div>
				</td>
				<td colspan="2">
					<div id="account">
						<input type="text" name="account" id="input_account" placeholder="请输入您的账号">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">密码</div>
				</td>
				<td colspan="2">
					<div id="password">
						<input type="password" name="password" id="input_password" placeholder="请输入您的密码">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">验证码</div>
				</td>
				<td>
					<div id="code">
						<input type="text" name="code" id="input_code" placeholder="请输入您的验证码">
					</div>
				</td>
				<td>
					<div id="img">
						<img src="${pageContext.request.contextPath }/changeCode.action" alt="验证码" id="img_code"/>
						<a id="a" href="#"><font size="-5">看不清，换一张</font></a>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div id="autoLogin">
						<input type="checkbox" value="autoLogin" name="autoLogin" id="input_autoLogin">自动登录
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div id="submit" align="center">
						<input type="submit" value="登录" id="login">
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<script type="text/javascript">
	$("#a").click(function(){
		$("#img_code").attr("src", "${pageContext.request.contextPath }/changeCode.action?id=" + Math.random());
	});
</script>