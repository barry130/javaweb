<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/6
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    nav{
        background:#ffffff;
    }
    .zuo{
        margin-right:100px;
    }

</style>
<body>
<%
    String username =(String)session.getAttribute("name");
    if(username==null){
%>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-header zuo pull-right">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../html/regis.html"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="../html/login.html"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
        </div>
</nav>
<%
    }
    else {
%>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-header zuo pull-right">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        当前用户:<%=username%><b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="../html/daka.html">今日打卡</a></li>
                        <li><a href="../html/updatePass.html">修改密码</a></li>
                        <li><a href="../jsp/record.jsp">打卡记录查询</a></li>
                        <li><a href="../html/rank.html">排行榜</a></li>
                        <li><a href="../html/schedule.html">添加本月学习计划表</a></li>
                        <li><a href="../jsp/schedulecontent.jsp">查看本月学习计划表</a></li>
                        <li><a href="../jsp/logout.jsp">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
</nav>
<%
    }
%>
</body>
</html>
