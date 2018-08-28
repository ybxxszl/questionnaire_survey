<%@page import="com.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<style type="text/css">
	a{
		text-decoration: none;
	}
	#table{
		height: 5%;
		width: 100%;
	}
	#img_logo{
		height: 60px;
		width: 90px;
	}
	.logo{
		text-align: center;
	}
	.personal{
		text-align: center;
		font-family: 楷体;
		font-size: 18px;
	}
	.option{
		text-align: center;
		font-family: 宋体;
		font-weight: bold;
		font-size: 20px;
	}
	.img_title_photo{
		height: 50px;
		width: 50px;
	}
</style>
<body>
	<table border="2px" align="center" id="table">
		<tr>
			<td id="logo">
				<div class="logo">
					<a href="${pageContext.request.contextPath }/index.jsp"><img alt="logo" src="image/logo/logo.jpg" id="img_logo"></a>
				</div>
			</td>
			<td id="create_questionnaire">
				<div class="option">
					<a href="${pageContext.request.contextPath }/designquestionnaire.jsp" class="questionnaire">设计问卷</a>
				</div>
			</td>
			<td id="my_questionnaire">
				<div class="option">
					<a href="${pageContext.request.contextPath }/showQuestionnaireList.action?userId=${user_session.userId }&page=1" class="questionnaire">我的问卷</a>
				</div>
			</td>
			<td id="personal">
				<div class="personal">
					<c:if test="${user_session == null }">
						<a href="${pageContext.request.contextPath }/login.jsp">登录</a>
						<a href="${pageContext.request.contextPath }/register.jsp">注册</a>
					</c:if>
					<c:if test="${user_session != null }">
						<div id="img_title">
							<img alt="头像" src="image/photo/${user_session.photo }" class="img_title_photo">
						</div>
						<a href="${pageContext.request.contextPath }/showuser.jsp">${user_session.name }</a>
						<a href="${pageContext.request.contextPath }/exitUser.action">退出</a>
					</c:if>
				</div>
			</td>
		</tr>
	</table>
	<br />
	<br />
</body>
</html>
<script type="text/javascript">
	/* jquery判断user_session是否存在，即判断是否已登录，未登录时user_session为null，是一个4位的字符串，所以判断长度为4时为未登录状态，不能进行设计问卷和我的问卷操作 */
	$(".questionnaire").click(function() {
		var user_session = "<%=session.getAttribute("user_session") %>";
		if(user_session.length == 4) {
			alert("请先登录");
			return false;
		}
	});
</script>