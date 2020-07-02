<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.BaseDao" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (BaseDao.login(username, password)) {
        out.println("登陆成功！");
        session.setAttribute("name", username);
        out.println("<a href='/html/daka.html'>前往打卡</a>");
        out.println("<a href='../index.jsp'>返回首页</a>");
    } else {
        out.println("用户名或密码错误，登陆失败，请重新登录！</br>");
        out.println("正在跳转至登录页");
        response.setHeader("Refresh","2;URL=/html/login.html");
       // out.println("<a href='/html/login.html'>重新登陆</a>");
    }
%>
</body>
</html>