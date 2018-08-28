<%@page import="java.util.List"%>
<%@page import="com.vo.DesignTemplet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的问卷</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<style type="text/css">
	.head{
		text-align: center;
		font-family: "微软雅黑";
		font-weight: bold;
		font-size: 14px;
	}
	.options{
		text-align: center;
		font-family: "微软雅黑";
		font-size: 12px;
	}
	#paging{
		position: absolute;
		top: 80%;
		left: 45%;
	}
	#info{
		margin-top: 10%;
		font-size: 25px;
		font-weight: bolder;
		text-align: center;
	}
</style>
<body>
	<%@include file="head.jsp" %>
	<div>
		<div>
			<table align="center">
				<tr class="head">
					<td style="width: 350px;">问卷名称</td>
					<td style="width: 150px;">完成时间</td>
					<td style="width: 100px;">当前状态</td>
					<td style="width: 100px;">预览问卷</td>
					<td style="width: 100px;">查看问卷</td>
					<td style="width: 100px;">修改问卷</td>
					<td style="width: 100px;">删除问卷</td>
				</tr>
				<c:forEach var="designTemplet" items="${designTempletList }">
					<tr class="options">
						<td>${designTemplet.designTempletName }</td>
						<td>${designTemplet.finishTime }</td>
						<td>
							<a href="#" onclick="changeState(this)" id="${designTemplet.designTempletId }">
								<c:if test="${designTemplet.state == 1 }">
									未回收
								</c:if>
								<c:if test="${designTemplet.state == 2 }">
									开始回收
								</c:if>
								<c:if test="${designTemplet.state == 3 }">
									继续回收
								</c:if>
								<c:if test="${designTemplet.state == 4 }">
									结束回收
								</c:if>
							</a>
						</td>
						<td><a href="${pageContext.request.contextPath }/previewQuestionnaire.action?designTempletId=${designTemplet.designTempletId }">预览问卷</a></td>
						<td><a href="${pageContext.request.contextPath }/showQuestionnaire.action?designTempletId=${designTemplet.designTempletId }">查看问卷</a></td>
						<td><a href="#" onclick="modifyQuestionnaire(this)" class="${designTemplet.designTempletId }">修改问卷</a></td>
						<td><a href="#" onclick="deleteQuestionnaire(this)" class="${designTemplet.designTempletId }">删除问卷</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="paging">
		<c:if test="${PageBean.page != 1 }">
			<a href="${pageContext.request.contextPath }/showQuestionnaireList.action?userId=${user_session.userId }&page=1">首页</a>
			<a href="${pageContext.request.contextPath }/showQuestionnaireList.action?userId=${user_session.userId }&page=${PageBean.page - 1 }">上一页</a>
		</c:if>
		<c:forEach var="i" begin="1" end="${PageBean.totalPage }">
			<c:if test="${PageBean.page == i }">
				<font color="red" size="+2">${i }</font>
			</c:if>
			<c:if test="${PageBean.page != i }">
				<font color="blue" size="+1"><a href="${pageContext.request.contextPath }/showQuestionnaireList.action?userId=${user_session.userId }&page=${i }">${i }</a></font>
			</c:if>
		</c:forEach>
		<c:if test="${PageBean.page != PageBean.totalPage }">
			<a href="${pageContext.request.contextPath }/showQuestionnaireList.action?userId=${user_session.userId }&page=${PageBean.page + 1 }">下一页</a>
			<a href="${pageContext.request.contextPath }/showQuestionnaireList.action?userId=${user_session.userId }&page=${PageBean.totalPage }">尾页</a>
		</c:if>
	</div>
	<div id="info">
		
	</div>
</body>
</html>
<script type="text/javascript">
	if($("table tr").length == 2) {
		$("#paging").empty();
		$("#info").text("您还没有创建调查问卷。。。");
	}
	/* 更改问卷状态 */
	function changeState(parameter) {
		var designTempletId = $(parameter).attr("id");
		var state = $(parameter).text().trim();
		var temp;
		if(state == "未回收") {
			$(parameter).text("开始回收");
			temp = 2;
		}
		if(state == "开始回收") {
			$(parameter).text("结束回收");
			temp = 4;
		}
		if(state == "继续回收") {
			$(parameter).text("结束回收");
			temp = 4;
		}
		if(state == "结束回收") {
			$(parameter).text("继续回收");
			temp = 3;
		}
		$.ajax({
			url: "${pageContext.request.contextPath }/changeState.action",
			data: {designTempletId: designTempletId, state: temp},
			error: function() {
				alert("changeState的ajax出错");
			},
			success: function(data) {
				if(data.length != 0) {
					alert("欢迎访问 " + data + ".html");
				}
			}
		});
	}
	
	/* 修改或删除问卷的需要满足条件 */
	function modifyQuestionnaire(parameter) {
		var designTempletId = $(parameter).attr("class");
		var state = $("#" + designTempletId).text().trim();
		if(state != "未回收") {
			alert("正在回收的问卷不能修改");
		} else {
			window.location.href = "${pageContext.request.contextPath }/modifyQuestionnaire.action?designTempletId=" + designTempletId;
		}
	}
	function deleteQuestionnaire(parameter) {
		var designTempletId = $(parameter).attr("class");
		var state = $("#" + designTempletId).text().trim();
		if(state != "未回收" && state != "结束回收") {
			alert("正在回收的问卷不能删除");
		} else {
			window.location.href = "${pageContext.request.contextPath }/deleteQuestionnaire.action?designTempletId=" + designTempletId;
		}
	}
</script>
