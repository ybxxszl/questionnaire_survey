<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设计空白问卷</title>
</head>
<script type="text/javascript" src="jq/jquery.js"></script>
<style type="text/css">
	table{
		width: 80%;
	}
	#designTempletName{
		position: absolute;
		left: 25%;
		width: 50%;
		height: 4%;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
	}
	#select_sort{
		position: absolute;
		left: 10%;
	}
	.question1{
		width: 30%;
	}
	.question2{
		width: 75%;
	}
	.answer{
		width: 45%;
	}
	.insert{
		width: 5%;
	}
</style>
<body>
	<%@include file="head.jsp" %>
	<form action="${pageContext.request.contextPath }/insertQuestionnaire.action" method="post">
		<div>
			<div>
				<input type="text" name="designTempletName" id="designTempletName" placeholder="请输入字典模板名称">
			</div>
			<br />
			<br />
			<br />
			<br />
			<div>
				<div>
					<table border="1px" align="center" id="table_single">
						<tr>
							<th colspan="3">单选题</th>
						</tr>
						<tr>
							<th class="question1">问题</th>
							<th class="answer">答案</th>
							<th class="insert">
								<a href="#" id="insert_single">增加</a>
							</th>
						</tr>
					</table>
				</div>
				<br />
				<div>
					<table border="1px" align="center" id="table_check">
						<tr>
							<th colspan="3">多选题</th>
						</tr>
						<tr>
							<th class="question1">问题</th>
							<th class="answer">答案</th>
							<th class="insert">
								<a href="#" id="insert_check">增加</a>
							</th>
						</tr>
					</table>
				</div>
				<br />
				<div>
					<table border="1px" align="center" id="table_text">
						<tr>
							<th colspan="2">文本题</th>
						</tr>
						<tr>
							<th class="question2">描述</th>
							<th class="insert">
								<a href="#" id="insert_text">增加</a>
							</th>
						</tr>
					</table>
				</div>
			</div>
			<br />
			<div>
				<table align="center">
					<tr>
						<td align="center">
							<input type="submit" value="提交" id="submit">
						</td>
						<td align="center">
							<input type="reset" value="重置">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
<script type="text/javascript">
	/* 防止因为没有传值而报错“空指针错误” */
	$(function(){
		$("#table_single").append("<tr hidden=hidden><td><textarea name=single_question>-</textarea></td><td><textarea name=single_answer_A>-</textarea><textarea name=single_answer_B>-</textarea><textarea name=single_answer_C>-</textarea><textarea name=single_answer_D>-</textarea></td></tr>");
		$("#table_check").append("<tr hidden=hidden><td><textarea name=check_question>-</textarea></td><td><textarea name=check_answer_A>-</textarea><textarea name=check_answer_B>-</textarea><textarea name=check_answer_C>-</textarea><textarea name=check_answer_D>-</textarea><textarea name=check_answer_E>-</textarea><textarea name=check_answer_F>-</textarea></td></tr>");
		$("#table_text").append("<tr hidden=hidden><td><textarea name=text_question>-</textarea></td></tr>");
	});
	/* 增加的单选题、多选题、文本题序号 */
	var i = 1;
	var j = 1;
	var k = 1;
	/* 记录被删除的题数，验证提交时使用 */
	var a = 0;
	var b = 0;
	var c = 0;
	/* 增加对应题 */
	$("#insert_single").click(function(){
		/* alert("增加单选"); */
		$("#table_single").append("<tr id=single"+ i +"><td>"+ i +"<textarea name=single_question id=single_question_"+ i +" cols=40 rows=5'></textarea></td><td>A.<textarea name=single_answer_A id=single_answer_"+ i +"_A cols=70 rows=1'></textarea><br />B.<textarea name=single_answer_B id=single_answer_"+ i +"_B cols=70 rows=1'></textarea><br />C.<textarea name=single_answer_C id=single_answer_"+ i +"_C cols=70 rows=1'></textarea><br />D.<textarea name=single_answer_D id=single_answer_"+ i +"_D cols=70 rows=1'></textarea></td><td><a href=# onclick='delete_single(this)'>删除</a></td></tr>");
		i ++;
	});
	$("#insert_check").click(function(){
		/* alert("增加多选"); */
		$("#table_check").append("<tr id=check"+ j +"><td>"+ j +"<textarea name=check_question id=check_question_"+ j +" cols=40 rows=9'></textarea></td><td>A.<textarea name=check_answer_A id=check_answer_"+ j +"_A cols=70 rows=1'></textarea><br />B.<textarea name=check_answer_B id=check_answer_"+ j +"_B cols=70 rows=1'></textarea><br />C.<textarea name=check_answer_C id=check_answer_"+ j +"_C cols=70 rows=1'></textarea><br />D.<textarea name=check_answer_D id=check_answer_"+ j +"_D cols=70 rows=1'></textarea><br />E.<textarea name=check_answer_E id=check_answer_"+ j +"_E cols=70 rows=1'></textarea><br />F.<textarea name=check_answer_F id=check_answer_"+ j +"_F cols=70 rows=1'></textarea></td><td><a href=# onclick='delete_check(this)'>删除</a></td></tr>");
		j ++;
	});
	$("#insert_text").click(function(){
		/* alert("增加文本"); */
		$("#table_text").append("<tr id=text"+ k +"><td>"+ k +"<textarea name=text_question id=text_question_"+ k +" cols=110 rows=7'></textarea></td><td><a href=# onclick='delete_text(this)'>删除</a></td></tr>");
		k ++;
	});
	/* 删除对应题 */
	function delete_single(parameter) {
		a ++;
		$(parameter).parent().parent().remove();
	}
	function delete_check(parameter) {
		b ++;
		$(parameter).parent().parent().remove();
	}
	function delete_text(parameter) {
		c ++;
		$(parameter).parent().parent().remove();
	}
	/* 验证提交 */
	$("#submit").click(function() {
		if($("#dictTempletName").val().length == 0) {
			alert("请填写字典模板名称");
			return false;
		}else if((i == 1 && j == 1 && k == 1) || (i - 1 == a && j - 1 == b && k - 1 == c)) {
			alert("请至少增加一个单选题或多选题或文本题");
			return false;
		} else {
			for (var n = 1; n < i; n++) {
				if($("#single_question_" + n).length > 0) {
					if($("#single_question_" + n).val().length == 0 && $("#single_answer_" + n + "_A").val().length == 0 && $("#single_answer_" + n + "_B").val().length == 0 && $("#single_answer_" + n + "_C").val().length == 0 && $("#single_answer_" + n + "_D").val().length == 0) {
						alert("单选题" + n + "为空");
						return false;
					} else if($("#single_question_" + n).val().length > 0 && $("#single_answer_" + n + "_A").val().length == 0 && $("#single_answer_" + n + "_B").val().length == 0 && $("#single_answer_" + n + "_C").val().length == 0 && $("#single_answer_" + n + "_D").val().length == 0) {
						alert("单选题" + n + "没有对应答案");
						return false;
					} else if($("#single_question_" + n).val().length == 0 && ($("#single_answer_" + n + "_A").val().length > 0 || $("#single_answer_" + n + "_B").val().length > 0 || $("#single_answer_" + n + "_C").val().length > 0 || $("#single_answer_" + n + "_D").val().length > 0)) {
						alert("单选题" + n + "没有对应问题");
						return false;
					}
				}
			}
			for (var n = 1; n < j; n++) {
				if($("#check_question_" + n).length > 0) {
					if($("#check_question_" + n).val().length == 0 && $("#check_answer_" + n + "_A").val().length == 0 && $("#check_answer_" + n + "_B").val().length == 0 && $("#check_answer_" + n + "_C").val().length == 0 && $("#check_answer_" + n + "_D").val().length == 0 && $("#check_answer_" + n + "_E").val().length == 0 && $("#check_answer_" + n + "_F").val().length == 0) {
						alert("多选题" + n + "为空");
						return false;
					} else if($("#check_question_" + n).val().length > 0 && $("#check_answer_" + n + "_A").val().length == 0 && $("#check_answer_" + n + "_B").val().length == 0 && $("#check_answer_" + n + "_C").val().length == 0 && $("#check_answer_" + n + "_D").val().length == 0 && $("#check_answer_" + n + "_E").val().length == 0 && $("#check_answer_" + n + "_F").val().length == 0) {
						alert("多选题" + n + "没有对应答案");
						return false;
					} else if($("#check_question_" + n).val().length == 0 && ($("#check_answer_" + n + "_A").val().length > 0 || $("#check_answer_" + n + "_B").val().length > 0 || $("#check_answer_" + n + "_C").val().length > 0 || $("#check_answer_" + n + "_D").val().length > 0 || $("#check_answer_" + n + "_E").val().length > 0 || $("#check_answer_" + n + "_F").val().length > 0)) {
						alert("多选题" + n + "没有对应问题");
						return false;
					}
				}
			}
			for (var n = 1; n < k; n++) {
				if($("#text_question_" + n).length > 0) {
					if($("#text_question_" + n).val().length == 0) {
						alert("文本题" + n + "为空");
						return false;
					}
				}
			}
		}
		/* 将空值添加为“-” */
		for (var x = 1; x < i; x++) {
			var A = $("#single_answer_"+ x +"_A");
			var B = $("#single_answer_"+ x +"_B");
			var C = $("#single_answer_"+ x +"_C");
			var D = $("#single_answer_"+ x +"_D");
			if(A.length > 0 && A.val().length == 0) {/* 判断id存在且val为空 */
				A.val("-");
			}
			if(B.length > 0 && B.val().length == 0) {
				B.val("-");
			}
			if(C.length > 0 && C.val().length == 0) {
				C.val("-");
			}
			if(D.length > 0 && D.val().length == 0) {
				D.val("-");
			}
		}
		for (var y = 1; y < j; y++) {
			var A = $("#check_answer_"+ y +"_A");
			var B = $("#check_answer_"+ y +"_B");
			var C = $("#check_answer_"+ y +"_C");
			var D = $("#check_answer_"+ y +"_D");
			var E = $("#check_answer_"+ y +"_E");
			var F = $("#check_answer_"+ y +"_F");
			if(A.length > 0 && A.val().length == 0) {/* 判断id存在且val为空 */
				A.val("-");
			}
			if(B.length > 0 && B.val().length == 0) {
				B.val("-");
			}
			if(C.length > 0 && C.val().length == 0) {
				C.val("-");
			}
			if(D.length > 0 && D.val().length == 0) {
				D.val("-");
			}
			if(E.length > 0 && E.val().length == 0) {
				E.val("-");
			}
			if(F.length > 0 && F.val().length == 0) {
				F.val("-");
			}
		}
	});
</script>