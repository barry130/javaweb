<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title >打卡记录查询</title>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://101.200.56.162:3306/javaweb"; //数据库名
        String username = "canace";  //数据库用户名
        String password = "123456";  //数据库用户密码
        Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

        if(conn != null){
          //  out.print("数据库连接成功！");
            out.print("<br />");
%>
<table border="2">
    <tr>
        <td width="100" name="title">用户名</td>
        <td width="200" time="title">打卡时间</td>
        <td width="900" time="title">打卡备注详情</td>
    </tr>
    <%
        Statement stmt = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        String username1 =(String)session.getAttribute("name");
        String sql = "select * from daka where username='" + username1 + "' order by id desc";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        int rowCount = 0;
        out.print("打卡记录查询结果：");
        out.print("<br/>");

        while (rs.next()) {
            rowCount++;%>
    <tr>
        <td width="100" ><%=rs.getString("username") %></td>
        <td width="100" ><%=rs.getString("dakatime") %></td>
        <td width="100" ><%=rs.getString("remark") %></td>
    </tr>
    <%
                }
                out.print("你共打卡"+rowCount+"次");
            }else{
                out.print("连接失败！");
            }
        }catch (Exception e) {
            //e.printStackTrace();
            out.print("数据库连接异常！");
        }
        out.println("<a href='../index.jsp'>返回首页</a>");
    %>
</table>

</body>
</html>
