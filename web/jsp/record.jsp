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
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="text-align: center;margin-left:200px;margin-right:200px;" class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>序号</th>
                <th>用户名</th>
                <th>打卡时间</th>
                <th>每日学习时间(小时)</th>
                <th>每日学习内容</th>
                <th>备注</th>
            </tr>
        </thead>

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
        <tbody>
    <tr>
        <td width="100" ><% out.print(rowCount);%></td>
        <td width="100" ><%=rs.getString("username") %></td>
        <td width="100" ><%=rs.getString("dakatime") %></td>
        <td width="100" ><%=rs.getString("studytime") %></td>
        <td width="100" ><%=rs.getString("studycontent") %></td>
        <td width="100" ><%=rs.getString("remark") %></td>
    </tr>
        </tbody>
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
