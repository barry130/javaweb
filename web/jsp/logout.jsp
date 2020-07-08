<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>用户注销系统</title>
</head>
<body>
<%
    session.invalidate();
%>
<div align="center">
    <h1>注销成功</h1>
    <form action="../index.jsp">
        <input type = "submit" value = "返回" />
    </form>
</div>
</body>
</html>
