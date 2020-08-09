<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/1
  Time: 20:47
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
    <title>每日学习时间排行榜</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="text-align: center;margin-left:250px;margin-right:250px;" class="table-responsive">
    <table class="table table-striped text-nowrap">
        <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>每日学习时间(小时)</th>
            <th>每日学习内容</th>
            <th>备注</th>
        </tr>
        </thead>
        <%
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
            SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
            String sql = "select * from daka where dakatime between '"+ df1.format(new Date()) +"' AND '"+ df2.format(new Date()) +"' ORDER by studytime desc";
            ResultSet rs=null;
            try {
                rs=BaseDao.implement(sql);
            int rowCount = 0;
            out.println(df.format(new Date())+"  打卡记录：");
            out.println("<br/>");
            while (rs.next()) {
                rowCount++;%>
        <tbody>
        <tr>
            <td><% out.print(rowCount);%></td>
            <td><%=rs.getString("username") %></td>
            <td><%=rs.getString("studytime") %></td>
            <td><%=rs.getString("studycontent") %></td>
            <td><%=rs.getString("remark") %></td>
        </tr>
        </tbody>
        <%
                    }
                    out.println("今日共打卡"+rowCount+"次");
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

