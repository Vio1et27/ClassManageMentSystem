<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教室管理系统</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="Font/css/all.css">
    <link rel="stylesheet" href="css/styleForIndex.css">
    <link rel="icon" href="Font/favicon.ico">
</head>
<body>
<div class="topbar-wrapper">
    <div class="topbar w">
        <ul class="left">
            <li>
                <i class="fas fa-school"></i>
                教室管理系统
            </li>
        </ul>
        <ul class="right">
            <li class="li1">aaa
                <i class="fas fa-angle-down"></i>
                <div class="box1"></div>
            </li>
            <li class="li2">aaa
                <i class="fas fa-angle-down"></i>
                <div class="box2">

                </div>
            </li>
            <li class="login">
                <a href="settings/qx/Login/toLogin.do">
                    登录
                </a>
            </li>
            <li class="signup">
                <a href="settings/qx/Register/toRegister.do">
                    注册
                </a>
            </li>
        </ul>
    </div>
</div>

<div class="main-wrapper">
    <div class="main">

    </div>
</div>
</body>
</html>
