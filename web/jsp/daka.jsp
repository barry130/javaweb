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
    String studytime = request.getParameter("studytime");
    String content = request.getParameter("content");
    String remark = request.getParameter("remark");
    String username =(String)session.getAttribute("name");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
    SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
    if(username!=null) {
        if (BaseDao.isdaka(username, df1.format(new Date()), df2.format(new Date()))) {
            out.println("今日已打卡，请明日再来！</br>");
            out.println("正在跳转至首页");
            response.setHeader("Refresh","2;URL=../index.jsp");}
         else {
            int num = 1;
            if (BaseDao.insert(username, df.format(new Date()),studytime,content, num, remark)) {
                out.println("打卡成功！</br>");
                out.println("正在跳转至首页");
                response.setHeader("Refresh","2;URL=../index.jsp");
              //  out.println("<a href='../index.jsp'>返回首页</a>");
            } else {
                out.println("打卡失败，请重新打卡！</br>");
                out.println("正在跳转至打卡页面");
                response.setHeader("Refresh","2;URL=/html/daka.html");
             //   out.println("<a href='/html/login.html'>重新登陆</a>");
            }
        }
    }
    else {
        out.println("正在跳转至首页");
        response.setHeader("Refresh","2;URL=../index.jsp");}
%>
</div>
</body>
</html>
