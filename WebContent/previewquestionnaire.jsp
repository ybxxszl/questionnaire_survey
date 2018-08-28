<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预览</title>
</head>
<script type="text/javascript" src="jq/jquery.js" ></script>
<body>
	<%
		int m = 1;
		int n;
	%>
	<%@include file="head.jsp" %>
	<div>
		<br />
		<br />
		<div>
			<h1 style="text-align: center;">${designTempletName }</h1>
		</div>
		<br />
		<br />
		<div>
			<table width="700px" align="center">
				<c:forEach var="designSingle" items="${designSingleList }">
					<%
						n = 65;
					%>
					<tr style="height: 50px;">
						<td colspan="2">
							<%=m++ %>、${designSingle.designSingleContent }
						</td>
					</tr>
					<c:forEach var="designSingleOption" items="${designSingleOptionList }">
						<c:if test="${designSingle.designSingleId == designSingleOption.designSingleId }">
							<c:if test="${designSingleOption.designSingleOrder % 2 == 1 }">
								<tr style="font-size: 14px; height: 40px;">
							</c:if>
								<td>
									<input type="radio" class="single" id="${designSingle.designSingleId }" value="${designSingleOption.designSingleOptionId }" />&nbsp;<%=(char)n++ %>.${designSingleOption.designSingleOptionContent }
								</td>
							<c:if test="${designSingleOption.designSingleOrder % 2 != 1 }">
								</tr>
							</c:if>
						</c:if>
					</c:forEach>
				</c:forEach>
				<c:forEach var="designCheckbox" items="${designCheckboxList }">
					<%
						n = 65;
					%>
					<tr style="height: 50px;">
						<td colspan="2">
							<%=m++ %>、${designCheckbox.designCheckboxContent }
						</td>
					</tr>
					<c:forEach var="designCheckboxOption" items="${designCheckboxOptionList }">
						<c:if test="${designCheckbox.designCheckboxId == designCheckboxOption.designCheckboxId }">
							<c:if test="${designCheckboxOption.designCheckboxOrder % 2 == 1 }">
								<tr style="font-size: 14px; height: 40px;">
							</c:if>
								<td>
									<input type="checkbox" class="checkbox" id="${designCheckbox.designCheckboxId }" value="${designCheckboxOption.designCheckboxOptionId }" />&nbsp;<%=(char)n++ %>.${designCheckboxOption.designCheckboxOptionContent }
								</td>
							<c:if test="${designCheckboxOption.designCheckboxOrder % 2 != 1 }">
								</tr>
							</c:if>
						</c:if>
					</c:forEach>
				</c:forEach>
				<c:forEach var="designText" items="${designTextList }">
					<tr>
						<td colspan="2" style="height: 50px;">
							<%=m++ %>、${designText.designTextContent }
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea style="font-family: 微软雅黑; font-size: 14px;" rows="4" cols="80" class="text" id="${designText.designTextId }"></textarea>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br />
		<br />
		<div style="text-align: center;">
			<a href="${pageContext.request.contextPath }/getPDF.action?designTempletId=${designTempletId }">导出PDF</a>
		</div>
	</div>
</body>
</html>