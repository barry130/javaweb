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
    <title>修改密码</title>
</head>
<body>
<%
    String name = (String) session.getAttribute("name");
    String pass1 = request.getParameter("password1");
    String pass2 = request.getParameter("password2");
    if (BaseDao.updatePassword(name, pass1,pass2)) {
        out.println("密码修改成功！</br>");
        session.invalidate();
        out.println("正在跳转至登录页");
        response.setHeader("Refresh","2;URL=/html/login.html");
        //    out.println("<a href='/html/login.html'>请登录</a>");
    } else {
        out.println("密码修改失败,请重新修改！</br>");
        out.println("正在跳转至密码修改页");
        response.setHeader("Refresh","2;URL=/html/updatePass.html");
    }
%>
</body>
</html>
