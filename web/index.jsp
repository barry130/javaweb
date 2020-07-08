<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  <title>考研打卡系统</title>
</head>
<body>
<div id="showTimes" align="center"></div>
<div align="center">
  <%

    if (session.getAttribute("name") != null) {
      String username =(String)session.getAttribute("name");
      out.println("当前登录用户："+username+"</br>");
      out.println("<a href='/html/daka.html'>前往打卡</a>");
      out.println("<a href='/html/updatePass.html'>修改密码</a>");
      out.println("<a href='/jsp/logout.jsp'>注销</a></br>");
      out.println("<a href='/jsp/record.jsp'>查询打卡记录</a>");
      out.println("<a href='/html/rank.html'>排行榜</a></br>");
      out.println("<a href='/html/schedule.html'>添加本月学习计划表</a>");
      out.println("<a href='/jsp/schedulecontent.jsp'>查看本月学习计划表</a>");
    } else {
      out.println("<a href='/html/login.html'>请登录</a>");
    }
    //当前时间毫秒数
    Long current_time1=System.currentTimeMillis();
    //结束时间毫秒数
    Long end_time=1608307200000l;
    //计算时间差
    Long time=end_time-current_time1;
  %>
</div>
<script>
    var second = <%= time / 1000%>; // 剩余秒数
    // 写一个方法，将秒数专为天数
    var toDays = function(){
        var s = second % 60; // 秒
        var mi = (second - s) / 60 % 60; // 分钟
        var h =  ((second - s) / 60 - mi ) / 60 % 24; // 小时
        var d =  (((second - s) / 60 - mi ) / 60 - h ) / 24 // 天
        return "考研剩余：" + d + "天" + h + "小时" + mi + "分钟" + s + "秒";
    }
    //然后写一个定时器
    window.setInterval(function(){
        second --;
        document.getElementById("showTimes").innerHTML = toDays ();
    }, 1000);
</script>
</body>
</html>