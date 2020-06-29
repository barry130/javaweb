<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.BaseDao" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>用户打卡系统</title>
</head>
<body>
<div>
    当前登录用户<%=session.getAttribute("name")%>;
<%
    String content = request.getParameter("content");
    String username =(String)session.getAttribute("name");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
    SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
    if(BaseDao.isdaka(username,df1.format(new Date()),df2.format(new Date()))) {
        out.println("今日已打卡，请明日再来！");
        out.println("<a href='../index.jsp'>返回首页</a>");
    }
    else {
        if (BaseDao.insert(username, df.format(new Date()), "1", content)) {
            out.println("打卡成功！");
            out.println("<a href='../index.jsp'>返回首页</a>");
        } else {
            out.println("打卡失败，请重新打卡！");
            out.println("<a href='/html/login.html'>重新登陆</a>");
        }
    }
%>
</div>
</body>
</html>
