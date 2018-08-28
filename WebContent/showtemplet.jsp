<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示模板列表及对应内容</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<style type="text/css">
	#sort{
		position: absolute;
		top: 200px;
		left: 50px;
		font-family: "微软雅黑";
		font-size: 18px;
	}
	#templet{
		position: absolute;
		top: 150px;
		left: 200px;
		font-family: "微软雅黑";
		font-size: 16px;
	}
	#paging{
		position: absolute;
		top: 500px;
		left: 250px;
		font-family: "微软雅黑";
		font-size: 14px;
	}
	#preview{
		position: absolute;
		top: 200px;
		left: 800px;
		font-family: "微软雅黑";
		font-size: 14px;
	}
</style>
<body>
	<%@include file="head.jsp" %>
	<div>
		<div id="sort">
			<table>
				<c:forEach var="sort" items="${sort }">
					<tr style="height: 40px;">
						<td>
							<a href="#" onclick="getPagingPage(${sort.sortId }, 1)">${sort.sortName }</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="templet">
			<table id="table_templet">
				
			</table>
			<span style="position: absolute; top: 75px; left:150px; font-size: 22px;" id="span_templet">请选择分类</span>
		</div>
		<div id="paging">
			
		</div>
		<div id="preview">
			<a href="#" id="a_preview">
				<table id="table_preview">
					
				</table>
			</a>
			<span style="position: absolute; top: 50px; left:200px; font-size: 24px;" id="span_preview">点击模板预览</span>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	/* ajax实现分页和预览 */
	var current_page;/* 记录当前页 */
	
	/* 加载分页的页数和分页的内容 */
	function getPagingPage(sortId, page) {
		getPaging(sortId);
		getPage(sortId, page);
	}
	
	/* 获取分页的页数 */
	function getPaging(sortId) {
		//alert("获取分页的页数分类ID：" + sortId);
		$.ajax({
			url: "${pageContext.request.contextPath }/getPaging.action",
			data: {sortId: sortId},
			error: function() {
				alert("getPaging的ajax出错");
			},
			success: function(data) {
				$("#paging").empty();
				for(var i = 1; i <= data; i++) {
					$("#paging").append("<a href=# onclick='getPage(" + sortId + ", " + i + ")'>" + i + "</a>&nbsp;")
				}
				
				var shang;
				var xia;
				if(current_page == 1) {
					shang = 1;
				} else {
					shang = current_page - 1;
				}
				if(current_page == data){
					xia = data;
				} else {
					xia = current_page + 1
				}/* 如果是上一页，判断当前也是不是首页；如果是下一页，判断当前也是不是尾页。 */
				
				$("#paging").append("<a href=# onclick='getPage(" + sortId + ", 1)'>首页</a>&nbsp;<a href=# onclick='getPage(" + sortId + ", " + shang + ")'>上一页</a>&nbsp;<a href=# onclick='getPage(" + sortId + ", " + xia + ")'>下一页</a>&nbsp;<a href=# onclick='getPage(" + sortId + ", " + data + ")'>尾页</a>");
			} 
		});
	}
	
	/* 获取分页的内容 */
	function getPage(sortId, page) {
		//alert("分类ID：" + sortId + " 页数：" + page);
		current_page = page;
		$.ajax({
			url: "${pageContext.request.contextPath }/getPage.action",
			data: {sortId: sortId, page: page},
			error: function() {
				alert("getPage的ajax出错");
			},
			success: function(data) {
				$("#span_templet").css("display", "none");
				$("#table_templet").empty();
				for(var i = 0; i < data.length; i++) {
					$("#table_templet").append("<tr style='height: 30px;'><td><a href=# onclick='showTemplet(this)' id=" + data[i].dictTempletId + ">"+ data[i].dictTempletName +"</a></td></tr>")
				}
			}
		});
	}
	/* 本来想直接传ID，但是传不过来，不明白是ID长度的问题还是ID格式的问题 */
	function showTemplet(parameter) {
		//alert($(parameter).attr("id"));
		var dictTempletId = $(parameter).attr("id");
		$.ajax({
			url: "${pageContext.request.contextPath }/showTemplet_ajax.action",
			data: {dictTempletId: dictTempletId},
			error: function() {
				alert("showTemplet的ajax出错");
			},
			success: function(data) {
				$("#a_preview").attr("href", "${pageContext.request.contextPath }/showTemplet.action?dictTempletId=" + dictTempletId);//给a标签添加访问地址
				$("#span_preview").css("display", "none");
				$("#table_preview").empty();
				$.each(data, function(i, d) {
					$("#table_preview").append("<tr style='height: 20px;'><td>" + d.option + "</td></tr>");
				});
			} 
		});
	}
</script>
