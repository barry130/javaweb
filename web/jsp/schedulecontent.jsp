<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/5
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BaseDao" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title >本月学习计划表</title>
</head>
<body>
<div style="text-align: center;">
    <table border="2" style="margin: auto">
        <tr>
            <td width="100" name="title">用户名</td>
            <td width="100" time1="title">开始时间</td>
            <td width="100" time1="title">结束时间</td>
            <td width="300" studycontent="title">学习内容</td>
        </tr>

        <%
            ResultSet rs = null;
            String name =(String)session.getAttribute("name");
            String sql = "select * from schedule WHERE username='"+name+"' and inserttime BETWEEN date_add(curdate(),interval -day(curdate())+1 day) and last_day(curdate())";
            try{
                rs= BaseDao.implement(sql);
            out.println("你的本月学习计划表：");
            while (rs.next()) {%>
        <tr>
            <td width="100" ><%=rs.getString("username") %></td>
            <td width="100" ><%=rs.getString("starttime") %></td>
            <td width="100" ><%=rs.getString("endtime") %></td>
            <td width="100" ><%=rs.getString("studycontent") %></td>
        </tr>
        <%
                    }
            }catch (Exception e) {
                //e.printStackTrace();
                out.println("数据库连接异常！");
            }
            out.println("</br><a href='../index.jsp'>返回首页</a>");
            out.println("</br><a href='javascript:history.back(-1)'>返回上一页</a>");
        %>
    </table>

</div>
</body>
</html>

