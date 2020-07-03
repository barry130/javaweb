<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/3
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>连续打卡次数排行榜</title>
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
<div style="text-align: center;">
    <table border="2" style="margin: auto">
        <tr>
            <td width="100" s="title">序号</td>
            <td width="100" name="title">用户名</td>
            <td width="200" continuetimes="title">连续打卡次数</td>
        </tr>

        <%
            Statement stmt = null;
            ResultSet rs = null;
            String sql = "SELECT username,num from user ORDER BY num DESC ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            int rowCount = 0;
            out.println("连续打卡次数次数排行榜：");
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
                }else{
                    out.println("连接失败！");
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

