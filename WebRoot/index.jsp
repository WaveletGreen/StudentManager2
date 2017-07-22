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
<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>

<body>
	<div id="main">
		<div>
			<h1 id="header">操作界面</h1>
			<hr />
		</div>
		<div id="tableDiv">
			<div style="margin:20px 0 10px 0;">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="addPanel()">增加</a> <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="removePanel()">删除</a>
			</div>
			<div id="aa" class="easyui-accordion"
				style="width:500px;height:300px;">
				<div data-options="iconCls:'icon-ok'"
					style="overflow:auto;padding:10px;">
					<h3 style="color:#0099FF;text-align: center;">学员信息</h3>
					<table style="border: 1px solid gray;width: 480px">
						<tr style="background-color: gray">
							<th>学号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>年级</th>
							<th>专业</th>
							<th>地址</th>
						</tr>
						<s:iterator value="studentList" var="student">
							<tr></tr>
						</s:iterator>
					</table>
					<p>Accordion is a part of easyui framework for jQuery. It lets
						you define your accordion component on web page more easily.</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function selectPanel() {
			$.messager.prompt('Prompt', 'Please enter the panel title:', function(s) {
				if (s) {
					$('#aa').accordion('select', s);
				}
			});
		}
		var idx = 1;
		function addPanel() {
			$('#aa').accordion('add', {
				title : 'Title' + idx,
				content : '<div style="padding:10px">Content' + idx + '</div>'
			});
			idx++;
		}
		function removePanel() {
			var pp = $('#aa').accordion('getSelected');
			if (pp) {
				var index = $('#aa').accordion('getPanelIndex', pp);
				$('#aa').accordion('remove', index);
			}
		}
	</script>
</body>
</html>
