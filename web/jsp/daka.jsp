<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.BaseDao" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>用户打卡系统</title>
</head>
<body>
<div>
    当前登录用户<%=session.getAttribute("name")%>;
<%
    request.setCharacterEncoding("utf-8");
    String studytime = request.getParameter("studytime");
    String content = request.getParameter("content");
    String remark = request.getParameter("remark");
    String username1 =(String)session.getAttribute("name");
    ResultSet rs = null;
    String sql = "SELECT count(*) FROM ( SELECT date_sub(a.dakatime, INTERVAL 1 DAY) signDate, " +
            "( @i := DATE_ADD(@i, INTERVAL - 1 DAY) ) today " +
            "FROM ( SELECT dakatime FROM daka where username='"+username1+"' ORDER BY dakatime DESC ) a " +
            "INNER JOIN ( SELECT @i := max(dakatime) AS signMax FROM daka where username='"+username1+"' AND " +
            "( TO_DAYS(dakatime) = TO_DAYS(curdate()) OR TO_DAYS(dakatime) = TO_DAYS( DATE_ADD(curdate(), INTERVAL - 1 DAY) ) )" +
            " ) b ON b.signMax IS NOT NULL AND TO_DAYS(DATE_ADD(@i, INTERVAL - 1 DAY)) = TO_DAYS( date_sub(a.dakatime, INTERVAL 1 DAY) ) ) c";
    try {
        rs=BaseDao.implement(sql);
    int num=0;
    while(rs.next()){
         num=rs.getInt("count(*)")+1;
    }
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
    SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
    if(username1!=null) {
        if (BaseDao.isdaka(username1, df1.format(new Date()), df2.format(new Date()))) {
            out.println("今日已打卡，请明日再来！</br>");
            out.println("正在跳转至首页");
            response.setHeader("Refresh","2;URL=../index.jsp");}
         else {
            if (BaseDao.insert(username1, df.format(new Date()),studytime,content,remark)) {
                if (BaseDao.insert_num(username1, num)) {
                    out.println("打卡成功！</br>");
                    out.println("你连续打卡" + num + "天</br>");
                    out.println("正在跳转至首页");
                    response.setHeader("Refresh", "2;URL=../index.jsp");
                    //  out.println("<a href='../index.jsp'>返回首页</a>");
                }
            }else {
                out.println("打卡失败，请重新打卡！</br>");
                out.println("正在跳转至打卡页面");
                response.setHeader("Refresh","2;URL=/html/daka.html");
             //   out.println("<a href='/html/login.html'>重新登陆</a>");
            }
        }
    }
    else {
        out.println("正在跳转至首页");
        response.setHeader("Refresh","2;URL=../index.jsp");}
%>
</div>
<%
    }catch (Exception e) {
    //e.printStackTrace();
    out.println("数据库连接异常！");
    }
%>
</body>
</html>
