<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>杭州华育--学生管理</title>
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="css/easyui.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
	<div id="main">
		<div>
			<h1 id="header">操作界面</h1>
			<hr />
		</div>
		<div id="tableDiv">
			<div style="margin:20px 0 10px 0;">
				<a href="javascript:void(0)" onclick="addPanel()">增加</a> <a
					href="javascript:void(0)" onclick="removePanel()">删除</a>
			</div>
			<div style="width:820px;height:300px;">
				<h3 style="color:#0099FF;text-align: center;">学员信息</h3>
				<table style="width: 820px; border-collapse:collapse;" id="stuTable">
					<tr style="background-color: gray;">
						<th style="width: 100px">学号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>年龄</th>
						<th>年级</th>
						<th>专业</th>
						<th>地址</th>
						<th>操作</th>
					</tr>
					<s:iterator value="studentList" var="student">
						<tr id=<s:property value="#student.sid" />>
							<td><s:property value="#student.sid" /></td>
							<td><s:property value="#student.name" /></td>
							<td><s:property value="#student.sex" /></td>
							<td><s:property value="#student.age" /></td>
							<td><s:property value="#student.grade" /></td>
							<td><s:property value="#student.major" /></td>
							<td><s:property value="#student.address" /></td>
							<td><a href="javascript:void(0)" onclick="update()">修改</a>&nbsp;<a
								href="javascript:void(0)"
								onclick="removePanel(<s:property value="#student.sid" />)">删除</a></td>
						</tr>

					</s:iterator>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {});
		//添加节点到table上
		// 		<input type="text" style="width:100px;"/>
		function addPanel() {
			$("#stuTable").append('<tr id=-1><td></td>' +
				'<td><input type="text" style="width:80px;" id="name"/></td>' +
				'<td><select id="sex"><option value="男">男</option><option value="女">女</option></select></td>' +
				'<td><input type="text" style="width:80px;" id="age"/></td>' +
				'<td><input type="text" style="width:80px;" id="grade"/></td>' +
				'<td><input type="text" style="width:80px;" id="major"/></td>' +
				'<td><input type="text" style="width:80px;" id="address"/></td>' +
				'<td><a href="javascript:void(0)" onclick="subm()">提交</a>&nbsp;' +
				'<a	href="javascript:void(0)" onclick="removePanel(-1)">删除</a></td></tr>');
		}
		//删除节点
		function removePanel(ojb) {
			if (window.confirm("确定要删除吗？")) {
				$("#" + ojb).remove();
				if (ojb != -1) {
					$.ajax({
						url : "${pageContext.request.contextPath}/index_delete.action",
						data : {
							"studentsystem.id" : ojb,
						},
						dataType : "text",
						timeout : 10000,
						success : function() {
							alert("删除成功");
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("网络连接错误，请稍后重试");
						},
					})
				}
			}
		}
		//提交节点
		function subm() {
			if (window.confirm("确定提交吗？")) {
				$.ajax({
					url : "${pageContext.request.contextPath}/index_add.action",
					data : {
						"studentsystem.name" : $("#name").val(),
						"studentsystem.sex" : $("#sex").find("option:selected").val(),
						"studentsystem.age" : $("#age").val(),
						"studentsystem.grade" : $("#grade").val(),
						"studentsystem.major" : $("#major").val(),
						"studentsystem.address" : $("#address").val(),
					},
					dataType : "text",
					timeout : 10000,
					success : function() {
						alert("提交成功");
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("网络连接错误，请稍后重试");
					},
				})
			}
		}
		//更新操作
		function update() {
		}
	</script>
</body>
</html>
