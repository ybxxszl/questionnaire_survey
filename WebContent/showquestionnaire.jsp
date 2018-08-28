<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看问卷</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<body>
	<%
		int m = 1;
		int n;
		List<String> PNG = (List<String>) session.getAttribute("PNG");
	%>
	<%@include file="head.jsp" %>
	<div>
		<div>
			<h4 style="text-align: center;">${designTempletName }</h4>
		</div>
		<br />
		<div>
			<table border="1px" width="700px" align="center">
				<c:forEach varStatus="i" var="designSingle" items="${designSingleList }">
					<%
						n = 65;
					%>
					<tr style="height: 40px;">
						<td>
							<%=m++ %>、${designSingle.designSingleContent }
						</td>
					</tr>
					<tr>
						<td>
							<img alt="单选题图表" src="DisplayChart?filename=<%=PNG.get(m - 2) %>">
						</td>
					</tr>
				</c:forEach>
				<c:forEach var="designCheckbox" items="${designCheckboxList }">
					<%
						n = 65;
					%>
					<tr style="height: 40px;">
						<td>
							<%=m++ %>、${designCheckbox.designCheckboxContent }
						</td>
					</tr>
					<tr>
						<td>
							<img alt="多选题图表" src="DisplayChart?filename=<%=PNG.get(m - 2) %>">
						</td>
					</tr>
				</c:forEach>
				<c:forEach var="designText" items="${designTextList }">
					<tr style="height: 40px;">
						<td colspan="2">
							<%=m++ %>、${designText.designTextContent }
						</td>
					</tr>
					<%
						int temp = 1;
					%>
					<c:forEach var="textAnswer" items="${textAnswerList }">
						<c:if test="${designText.designTextId == textAnswer.designTextId }">
							<tr style="font-size: 12px; height: 30px;">
								<td colspan="2"  style="font-size: 16px;">
									<%=temp++ %>回答：${textAnswer.textAnswerContent }
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table>
		</div>
		<br />
		<br />
		<div style="text-align: center;">
			<a href="${pageContext.request.contextPath }/getExcel.action?designTempletId=${designTempletId }">导出Excel</a>
		</div>
	</div>
</body>
</html>