<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 15:09
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
    String name = request.getParameter("username");
    String pass1 = request.getParameter("password1");
    String pass2 = request.getParameter("password2");
    if (pass1.equals(pass2) && BaseDao.register(name, pass1)) {
        out.println("注册成功！</br>");
        out.println("正在跳转至登录页");
        response.setHeader("Refresh","2;URL=/html/login.html");
    //    out.println("<a href='/html/login.html'>请登录</a>");
    } else {
        out.println("注册失败,请重新注册！</br>");
        out.println("正在跳转至注册页");
        response.setHeader("Refresh","2;URL=/html/regis.html");
     //   out.println("<a href='/html/regis.html'>重新注册</a>");
    }
%>

</body>
</html>