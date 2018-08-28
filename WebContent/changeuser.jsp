<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
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
	<form action="${pageContext.request.contextPath }/changeUser.action" method="post" enctype="multipart/form-data">
		<table border="2px" align="center">
			<tr>
				<th colspan="3">
					<div id="title" align="center">个人信息</div>
				</th>
			</tr>
			<tr>
				<td>
					<div class="prompt">头像</div>
				</td>
				<td>
					<div id="photo">
						<input type="file" name="file" id="input_photo">
					</div>
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
						<input type="text" value="${user_session.account }" name="account" id="input_account" placeholder="请输入您的账号" disabled="disabled">
					</div>
				</td>
				<td>
					<div>
						<span>账号不能更改</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">更改密码</div>
				</td>
				<td>
					<div id="password">
						<input type="password" value="${user_session.password }" name="password" id="input_password" placeholder="请输入您的密码">
					</div>
				</td>
				<td>
					<div>
						<span>至少包括1个大写字母、1个小写字母、1个数字、1个特殊符号，至少6位</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">更改确认</div>
				</td>
				<td>
					<div id="pwd">
						<input type="password" value="${user_session.password }" name="pwd" id="input_pwd" placeholder="请再输入一次">
					</div>
				</td>
				<td>
					<div>
						<span>至少包括1个大写字母、1个小写字母、1个数字、1个特殊符号，至少6位</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">更改姓名</div>
				</td>
				<td>
					<div id="name">
						<input type="text" value="${user_session.name }" name="name" id="input_name" placeholder="请输入您的姓名">
					</div>
				</td>
				<td>
					<div>
						<span>由汉字组成，共2-5位</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">更改性别</div>
				</td>
				<td>
					<div id="sex">
						<input type="radio" value="男" name="sex" id="man" class="input_sex">男
						<input type="radio" value="女" name="sex" id="woman" class="input_sex">女
					</div>
				</td>
				<td>
					<div>
						<span>请选择性别</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">更改出生日期</div>
				</td>
				<td>
					<div id="birthday">
						<select name="year" id="select_year">
							
						</select>
						<select name="month" id="select_month">
							
						</select>
						<select name="day" id="select_day">
							
						</select>
					</div>
				</td>
				<td>
					<div>
						<span>请选择生日</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">更改电话号码</div>
				</td>
				<td>
					<div id="phone">
						<input type="text" value="${user_session.phone }" name="phone" id="input_phone" placeholder="请输入您的电话号码">
					</div>
				</td>
				<td>
					<div>
						<span>请输入正确格式的电话号码</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="prompt">更改电子邮件</div>
				</td>
				<td>
					<div id="email">
						<input type="text" value="${user_session.email }" name="email" id="input_email" placeholder="请输入您的电子邮件">
					</div>
				</td>
				<td>
					<div>
						<span>请输入正确格式的电子邮件</span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div id="submit" align="center">
						<input type="submit" value="提交" id="change">
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<script type="text/javascript">
	/* 初始化 */
	$(function() {
		/* 初始化出生日期 */
		for(var i = 1950; i <= 2050; i ++) {
			$("#select_year").append("<option value=" + i + ">" + i + "</option>");
		}
		for(var i = 1; i <= 12; i ++) {
			$("#select_month").append("<option value=" + i + ">" + i + "</option>");
		}
		for(var i = 1; i <= 31; i ++) {
			$("#select_day").append("<option value=" + i + ">" + i + "</option>");
		}
		/* 根据数据库中值设置性别 */
		var sex = "${user_session.sex }";
		if(sex == "男") {
			$("#man").attr("checked", "checked");
		}
		if(sex == "女") {
			$("#woman").attr("checked", "checked");
		}
		/* 根据数据库中值设置出生日期 */
		var birthday = "${user_session.birthday }"
		var time = new Date(birthday)
		var year = time.getFullYear();
		var month = time.getMonth() + 1;
		var date = time.getDate();
		$("#select_year").val(year);
		$("#select_month").val(month);
		$("#select_day").val(date);
	});
	/* 计算当前年月的天数 */
	$("#select_day").click(function() {
		year = $("#select_year").val();
		month = $("#select_month").val();
		if(month == 1 || month == 3 || month == 5 || month == 7 ||  month == 8 || month == 10 || month == 12) {
			day = 31;
		}else if(month == 4 || month == 6 || month == 9 || month == 11) {
			day = 30;
		}else{
			if(year % 400 == 0 || year % 4 == 0 && year % 100 != 0) {
				day = 29;
			}else{
				day = 28;
			}
		}
		for(var i = 1; i <= day; i ++) {
			$("#select_day").append("<option value=" + i + ">" + i + "</option>");
		}
	});
	/* 验证输入 */
	$("#register").click(function() {
		account = $("#input_account").val();
		password = $("#input_password").val();
		pwd = $("#input_pwd").val();
		name = $("#input_name").val();
		phone = $("#input_phone").val();
		email = $("#input_email").val();
		/* jq验证输入格式是否正确 */
		if(account.length == 0){
			alert("账号不能为空");
			return false;
		}else if(account.length < 4 || account.length > 10) {
			alert("账号必须为4-10位");
			return false;
		}else if(!(/^[a-zA-Z0-9_]{4,10}$/).test(account)) {
			alert("账号必须由字母、数字、下划线组成");
			return false;
		}
		if(password.length == 0){
			alert("密码不能为空");
			return false;
		}else if(password.length < 6) {
			alert("密码必须至少6位");
			return false;
		}else if(!(/^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/).test(password)) {
			alert("密码必须至少包括1个大写字母、1个小写字母、1个数字、1个特殊符号");
			return false;
		}
		if(password != pwd) {
			alert("两次输入的密码不相同");
			return false;
		}
		if(name.length == 0){
			alert("姓名不能为空");
			return false;
		}else if(name.length < 2 || name.length > 5) {
			alert("姓名必须为2-5位");
			return false;
		}else if(!(/^[\u4e00-\u9fa5]{2,5}$/).test(name)) {
			alert("姓名必须由汉字组成");
			return false;
		}
		if(phone.length == 0){
			alert("电话号码不能为空");
			return false;
		}else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/).test(phone)) {
			alert("电话号码格式有误");
			return false;
		}
		if(email.length == 0){
			alert("电子邮件不能为空");
			return false;
		}else if(!(/^[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?$/).test(email)) {
			alert("电子邮件格式有误");
			return false;
		}
	});
</script>