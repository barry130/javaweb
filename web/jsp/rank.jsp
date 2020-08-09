<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/9
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>排行榜</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="tabbable" style="text-align: center;">
    <ul class="nav nav-tabs" style="display: inline-block;float: none;">
        <li class="active"><a href="#tab1" data-toggle="tab">每日打卡时间排行榜</a></li>
        <li><a href="#tab2" data-toggle="tab">每日学习时间排行榜</a></li>
        <li><a href="#tab3" data-toggle="tab">连续打卡次数排行榜</a></li>
        <li><a href="#tab4" data-toggle="tab">累计打卡次数排行榜</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active " id="tab1">
            <jsp:include page="rankDay.jsp"/>
        </div>
        <div class="tab-pane" id="tab2">
            <jsp:include page="rankStudy.jsp"/>
        </div>
        <div class="tab-pane" id="tab3">
            <jsp:include page="rankContinue.jsp"/>
        </div>
        <div class="tab-pane" id="tab4">
            <jsp:include page="rankTimes.jsp"/>
        </div>
    </div>
</div>
</body>
</html>
