<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/5
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.BaseDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>计划表提交页面</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name =(String)session.getAttribute("name");
    String time1 = request.getParameter("time1");
    String time2 = request.getParameter("time2");
    String content = request.getParameter("content");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    if(name!=null) {
        if (BaseDao.insert_schedule(name, df.format(new Date()), time1, time2, content)) {
            out.println("提交成功！</br>");
            out.println("<a href='/html/schedule.html'>继续增加</a>");
            out.println("<a href='/jsp/schedulecontent.jsp'>查询本月已经添加的计划表</a>");
            out.println("<a href='../index.jsp'>返回首页</a>");
        } else {
            out.println("提交失败！</br>");
            out.println("<a href='/html/schedule.html'>重新提交</a>");
            out.println("<a href='../index.jsp'>返回首页</a>");
        }
    }
    else {
        out.println("请登录！</br>正在跳转至首页");
        response.setHeader("Refresh","2;URL=../index.jsp");
    }
%>
</body>
</html>
