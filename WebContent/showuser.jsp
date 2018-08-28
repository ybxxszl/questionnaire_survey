<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>展示个人信息</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<style type="text/css">
	img{
		height: 100px;
		width: 120px;
	}
</style>
<body>
	<%@include file="head.jsp" %>
		<table border="2px" align="center">
			<tr>
				<th colspan="2">
					<div id="title" align="center">个人信息</div>
				</th>
			</tr>
			<tr>
				<td>
					<div class="prompt">头像</div>
				</td>
				<td>
					<div id="img">
						<img alt="头像" src="image/photo/${user_session.photo }" id="img_photo">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">账号</div>
				</td>
				<td>
					<div id="account">
						${user_session.account }
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">密码</div>
				</td>
				<td>
					<div id="password">
						********
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">姓名</div>
				</td>
				<td>
					<div id="name">
						${user_session.name }
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">性别</div>
				</td>
				<td>
					<div id="sex">
						${user_session.sex }
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">出生日期</div>
				</td>
				<td>
					<div id="birthday">
						
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">电话号码</div>
				</td>
				<td>
					<div id="phone">
						${user_session.phone }
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">电子邮件</div>
				</td>
				<td>
					<div id="email">
						${user_session.email }
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="change" align="center">
						<a href="${pageContext.request.contextPath }/changeuser.jsp">修改</a>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<script type="text/javascript">
	$(function(){
		/* 根据数据库中值设置出生日期 */
		var birthday = "${user_session.birthday }"
		var time = new Date(birthday)
		var year = time.getFullYear();
		var month = time.getMonth() + 1;
		var date = time.getDate();
		$("#birthday").text(year + "年" + month + "月" + date + "日");
	});
</script>