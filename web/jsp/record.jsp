<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BaseDao" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title >打卡记录查询</title>
</head>
<body>
<div style="text-align: center;">
<table border="2" style="margin: auto">
    <tr>
        <td width="50" s="title">序号</td>
        <td width="100" name="title">用户名</td>
        <td width="200" time="title">打卡时间</td>
        <td width="100" studytime="title">每日学习时间(小时)</td>
        <td width="400" content="title">每日学习内容</td>
        <td width="400" remark="title">备注</td>
    </tr>

<%
        ResultSet rs = null;
        String username1 =(String)session.getAttribute("name");
        String sql = "select * from daka where username='" + username1 + "' order by id desc";
        try {
            rs= BaseDao.implement(sql);
        int rowCount = 0;
        out.println("打卡记录查询结果：");
        out.println("<br/>");

        while (rs.next()) {
            rowCount++;%>
    <tr>
        <td width="100" ><% out.print(rowCount);%></td>
        <td width="100" ><%=rs.getString("username") %></td>
        <td width="100" ><%=rs.getString("dakatime") %></td>
        <td width="100" ><%=rs.getString("studytime") %></td>
        <td width="100" ><%=rs.getString("studycontent") %></td>
        <td width="100" ><%=rs.getString("remark") %></td>
    </tr>
    <%
            }
            out.println("你共打卡"+rowCount+"次");
        }catch (Exception e) {
            //e.printStackTrace();
            out.println("数据库连接异常！");
        }
        out.println("<br/>");
        out.println("<a href='../index.jsp'>返回首页</a>");
    %>
</table>

</div>
</body>
</html>
