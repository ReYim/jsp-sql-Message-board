<%@ page language="java" import="java.util.*" import="java.util.Date"
	import="java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员回复</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

body
{
	background-color: #2e244f;
}

.maindiv 
{
	width: 900px;
	margin: 0 auto;
	height: 100%;
	border-left: 1px solid #5C6090;
	border-right: 1px solid #5C6090;
}

.divhead
{
	margin-bottom: 1em;
	width: 700px;
	margin: 0 auto;
	padding-top: 2em;
	height: 400px;
	font-family: "Times New Roman", Georgia, Serif;
	font-size: 20px;
	color: #a68dd9;
	text-align: right;
}

.borderdiv
{
	width: 700px;
	margin: 2em auto;
	border-bottom: 2px solid #5C6090;
	text-align: left;
	padding-bottom: 0.5em;
}

.cocodiv
{
	width: 700px;
	margin: 0 auto;
}

#userdiv 
{
	float: left;
	width: 120px;
	text-align: left;
	height: 50px;
	font-family: "Times New Roman", Georgia, Serif;
	font-size: 20px;
	color: #a68dd9;
}

#liuyandiv 
{
	width: 580px;
	font-family: "Times New Roman", Georgia, Serif;
	font-size: 20px;
	height: 50px;
	text-align: left;
	float: left;
	color: #F381E0;
}

#timediv 
{
	width: 700px;
	font-family: "Times New Roman", Georgia, Serif;
	color: #a68dd9;
	font-size: 20px;
	height: 30px;
	padding-top: 175px;
	text-align: right;
	border-bottom: 2px solid #5C6090;
	margin-bottom: 1em;
}

input 
{
	float: right;
	width: 575px;
	height: 2em;
	margin-top: -0.4em;
	border-color: #bbb;
	border-radius: 4px;
	border-top-color: #fff;
	border-left-color: #fff;
	font-family: "Times New Roman", Georgia, Serif;
	font-size: 15px;
	padding-left: 0.5em;
}

textarea 
{
	width: 692px;
	border-color: #bbb;
	border-radius: 4px;
	border-width: 2px;
	font-size: 20px;
	font-family: Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana,
		sans-serif;
}

.myButton 
{
	-moz-box-shadow: inset 0px 0px 0px -15px #6e59b2;
	-webkit-box-shadow: inset 0px 0px 0px -15px #6e59b2;
	box-shadow: inset 0px 0px 0px -15px #6e59b2;
	background-color: #6e59b2;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	border: 1px solid #241d13;
	display: inline-block;
	cursor: pointer;
	color: white;
	font-family: "Times New Roman", Georgia, Serif;
	font-size: 16px;
	padding: 7px 30px;
	text-decoration: none;
	text-shadow: 0px -1px 0px #7a2a1d;
}

.myButton:hover 
{
	background-color: #6e59b2;
}

.myButton:active 
{
	position: relative;
	top: 1px;
}

.cleanButton 
{
	-moz-box-shadow: inset 0px 0px 0px -15px #6e59b2;
	-webkit-box-shadow: inset 0px 0px 0px -15px #6e59b2;
	box-shadow: inset 0px 0px 0px -15px #6e59b2;
	background-color: #6e59b2;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	border: 1px solid #241d13;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana,
		sans-serif;
	font-size: 20px;
	padding: 5px 18px;
	margin: 1em 2em;
	position: absolute;
	text-decoration: none;
	text-shadow: 0px -1px 0px #7a2a1d;
}

.myButton:hover 
{
	background-color: #6e59b2;
}

.myButton:active 
{
	position: relative;
	top: 1px;
}
</style>


</head>

<body>
	<div id="main" class="maindiv">
		<div id="head" class=divhead>
			<form action="管理员回复.jsp" method="post">

				留言人名：&nbsp;&nbsp; <input id="guser" name="guser" type="text"
					style="margin-right:8px;width: 570px"> <br> <br>


				<textarea id="gcontent" name="gcontent" cols="50" rows="8"></textarea>
				<br>
				<br>
				 <input value="发布" type="submit" class="myButton"
					style="width: 700px" />
					 <br>
				<br> 
				<a href="留言板.jsp"
					style="text-decoration:none;font-size: 16px;color:white;margin-right: 320px;">返回留言板</a>
			</form>
		</div>

	</div>

	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String stname = request.getParameter("guser");
		String sthmsg = request.getParameter("gcontent");

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(" yyyy-MM-dd HH:mm:ss ");
		String nowTime = sdf.format(date);

		String driverName = "com.mysql.jdbc.Driver"; //驱动名称  
		String DBUser = "root"; //mysql用户名  
		String DBPasswd = "123456"; //mysql密码  
		String DBName = "mys"; //数据库名  

		String connUrl = "jdbc:mysql://localhost/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;
		Class.forName(driverName).newInstance();
		Connection conn = DriverManager.getConnection(connUrl);
		Statement stat = conn.createStatement();
		stat.executeQuery("SET NAMES UTF8");

		String sql = "update msb set msb.hmsg='" + sthmsg + "' ,msb.gtime='" + nowTime + "' where msb.name='"
				+ stname + "'    ";
		int i = stat.executeUpdate(sql);
		//out.print(sthmsg);
		stat.close();
		conn.close();
	%>

</body>
</html>
