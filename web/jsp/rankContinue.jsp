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
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="text-align: center;margin-left:500px;margin-right:500px;" class="table-responsive">
    <table class="table table-striped text-nowrap">
        <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>连续打卡次数</th>
        </tr>
        </thead>
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
        <tbody>
        <tr>
            <td><% out.print(rowCount);%></td>
            <td><%=rs.getString("username") %></td>
            <td><%=rs.getString("num") %></td>
        </tr>
        </tbody>
        <%
                }
            }catch (Exception e) {
                //e.printStackTrace();
                out.println("数据库连接异常！");
            }
            out.println("<a href='../index.jsp'>返回首页</a>");
        %>
    </table>

</div>
</body>
</html>


