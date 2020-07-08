<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/1
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dao.BaseDao" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>每日打卡时间排行榜</title>
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
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
            SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
            String sql = "select * from daka where dakatime between '"+ df1.format(new Date()) +"' AND '"+ df2.format(new Date()) +"'";
            try{
                rs= BaseDao.implement(sql);
            int rowCount = 0;
            out.println(df.format(new Date())+"  打卡记录：");
            out.println("<br/>");
            while (rs.next()) {
                rowCount++;%>
        <tr>
            <td width="100"  ><% out.print(rowCount);%></td>
            <td width="100" ><%=rs.getString("username") %></td>
            <td width="100" ><%=rs.getString("dakatime") %></td>
            <td width="100" ><%=rs.getString("studytime") %></td>
            <td width="100" ><%=rs.getString("studycontent") %></td>
            <td width="100" ><%=rs.getString("remark") %></td>
        </tr>
        <%
                    }
                    out.println("今日共打卡"+rowCount+"次");
            }catch (Exception e) {
                //e.printStackTrace();
                out.println("数据库连接异常！");
            }
            out.println("<br/>");
            out.println("<a href='/html/rank.html'>返回排行榜</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;");
            out.println("<a href='../index.jsp'>返回首页</a>");
        %>
    </table>
</div>
</body>
</html>

