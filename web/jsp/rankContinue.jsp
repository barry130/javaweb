<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/3
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BaseDao" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>连续打卡次数排行榜</title>
</head>
<body>
<div style="text-align: center;">
    <table border="2" style="margin: auto">
        <tr>
            <td width="100" s="title">序号</td>
            <td width="100" name="title">用户名</td>
            <td width="200" continuetimes="title">连续打卡次数</td>
        </tr>

        <%
            ResultSet rs = null;
            String sql = "SELECT username,num from user ORDER BY num desc";
            try{
                rs= BaseDao.implement(sql);
            int rowCount = 0;
            out.println("连续打卡次数排行榜：");
            out.println("<br/>");

            while (rs.next()) {
                rowCount++;%>
        <tr>
            <td width="100" ><% out.print(rowCount);%></td>
            <td width="100" ><%=rs.getString("username") %></td>
            <td width="100" ><%=rs.getString("num") %></td>
        </tr>
        <%
                }
            }catch (Exception e) {
                //e.printStackTrace();
                out.println("数据库连接异常！");
            }
            out.println("<a href='/html/rank.html'>返回排行榜</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;");
            out.println("<a href='../index.jsp'>返回首页</a>");
        %>
    </table>

</div>
</body>
</html>


