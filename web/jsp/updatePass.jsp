<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/3
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.BaseDao" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>修改密码</title>
</head>
<body>
<%
    String name = (String) session.getAttribute("name");
    String pass1 = request.getParameter("password1");
    String pass2 = request.getParameter("password2");
    String pass3 = request.getParameter("password3");
    if (pass2.equals(pass3)) {
        out.println("两次密码不一致，请重新修改！正在跳转至密码修改页");
        response.setHeader("Refresh", "2;URL=/html/updatePass.html");
    } else {
        if (BaseDao.updatePassword(name, pass1, pass2)) {
            out.println("密码修改成功！</br>");
            session.invalidate();
            out.println("正在跳转至登录页");
            response.setHeader("Refresh", "2;URL=/html/login.html");
            //    out.println("<a href='/html/login.html'>请登录</a>");
        } else {
            out.println("密码修改失败,请重新修改！</br>");
            out.println("正在跳转至密码修改页");
            response.setHeader("Refresh", "2;URL=/html/updatePass.html");
        }
    }
%>
</body>
</html>
