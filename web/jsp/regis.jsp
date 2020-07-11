<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.BaseDao" %>
<%@ page import="java.util.Objects" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>用户注册系统</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("username");
    String pass1 = request.getParameter("password1");
    String pass2 = request.getParameter("password2");
    if(Objects.equals(name, "") || Objects.equals(pass1, "") || Objects.equals(pass2, "")){
        out.println("用户名或密码为空，请重新注册！正在跳转至注册页");
        response.setHeader("Refresh", "2;URL=/html/regis.html");
    }
    else {
        if (!pass2.equals(pass1)) {
            out.println("两次密码不一致，请重新注册！正在跳转至注册页");
            response.setHeader("Refresh", "2;URL=/html/regis.html");
        } else {
            if (BaseDao.register(name, pass1)) {
                out.println("注册成功！</br>");
                out.println("正在跳转至登录页");
                response.setHeader("Refresh", "2;URL=/html/login.html");
                //    out.println("<a href='/html/login.html'>请登录</a>");
            } else {
                out.println("用户名已存在，请重新注册！</br>");
                out.println("正在跳转至注册页");
                response.setHeader("Refresh", "2;URL=/html/regis.html");
                //   out.println("<a href='/html/regis.html'>重新注册</a>");
            }
        }
    }
%>

</body>
</html>