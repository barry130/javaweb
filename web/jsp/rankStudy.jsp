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
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>每日学习时间排行榜</title>
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
            <td width="200" name="title">用户名</td>
            <td width="200" studytime="title">每日学习时间(小时)</td>
            <td width="400" content="title">每日学习内容</td>
            <td width="400" remark="title">备注</td>
        </tr>

        <%
            Statement stmt = null;
            ResultSet rs = null;
            Date date=new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
            SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
            String sql = "select * from daka where dakatime between '"+ df1.format(new Date()) +"' AND '"+ df2.format(new Date()) +"' ORDER by studytime desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            int rowCount = 0;
            out.println(df.format(new Date())+"  打卡记录：");
            out.println("<br/>");
            while (rs.next()) {
                rowCount++;%>
        <tr>
            <td width="100"  ><% out.print(rowCount);%></td>
            <td width="100" ><%=rs.getString("username") %></td>
            <td width="100" ><%=rs.getString("studytime") %></td>
            <td width="100" ><%=rs.getString("studycontent") %></td>
            <td width="100" ><%=rs.getString("remark") %></td>
        </tr>
        <%
                    }
                    out.println("今日共打卡"+rowCount+"次");
                }else{
                    out.println("连接失败！");
                }
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

