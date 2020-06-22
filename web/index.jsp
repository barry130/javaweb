<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>首页</title>
</head>
<body>
<div align="center">
  当前登录用户<%=session.getAttribute("name")%>;
  <%
    if (session.getAttribute("name") != null) {
      out.println("<a href='/jsp/logout.jsp'>注销</a>");
    } else {
      out.println("<a href='/html/login.html'>请登录</a>");
    }
  %>
</div>
</body>
</html>