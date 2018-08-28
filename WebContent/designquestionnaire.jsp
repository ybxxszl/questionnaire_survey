<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设计问卷</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<style type="text/css">
	img{
		width: 300px;
		height: 300px;
	}
	span{
		font-size: 20px;
		font-weight: bold;
	}
</style>
<body>
	<%@include file="index.jsp" %>
	<div>
		<table align="center" width="400px" height="400px">
			<tr>
				<td>
					<div>
						<img alt="模板问卷" src="image/picture/templet.jpg">
					</div>
				</td>
				<td>
					<div>
						<img alt="空白问卷" src="image/picture/empty.jpg">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="${pageContext.request.contextPath }/getSort.action"><span>设计模板问卷</span></a>
					</div>
				</td>
				<td>
					<div align="center">
						<a href="${pageContext.request.contextPath }/designemptyquestionnaire.jsp"><span>设计空白问卷</span></a>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>