<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  <title>考研打卡系统</title>
</head>
<style>
  body{
    background: url('static/img/background.jpg') no-repeat fixed center;
  }
  .card{
    margin: 270px 50px;
    text-align:center;
    font-size:70px;
  }
</style>
<body>
<jsp:include page="/jsp/head.jsp"/>
<div class="card">
  <div class="card-body">
    <p>距离2020考研仅剩</p>
    <%
      Date date=new Date();
      long b=date.getTime();
      long a=(new Date("2020/12/19 00:00:00")).getTime();
      long d=(a-b)/1000/3600/24;
    %>
    <p><%=d%>天</p>
  </div>
</div>
</body>
</html>