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
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="text-align: center;margin-left:300px;margin-right:300px;" class="table-responsive">
    <table class="table table-striped text-nowrap">
        <thead>
        <tr>
            <th>用户名</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>学习内容</th>
        </tr>
        </thead>
        <%
            ResultSet rs = null;
            String name =(String)session.getAttribute("name");
            String sql = "select * from schedule WHERE username='"+name+"' and inserttime BETWEEN date_add(curdate(),interval -day(curdate())+1 day) and last_day(curdate())";
            try{
                rs= BaseDao.implement(sql);
            out.println("你的本月学习计划表：");
            while (rs.next()) {%>
        <tbody>
        <tr>
            <td><%=rs.getString("username") %></td>
            <td><%=rs.getString("starttime") %></td>
            <td><%=rs.getString("endtime") %></td>
            <td><%=rs.getString("studycontent") %></td>
        </tr>
        </tbody>
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

