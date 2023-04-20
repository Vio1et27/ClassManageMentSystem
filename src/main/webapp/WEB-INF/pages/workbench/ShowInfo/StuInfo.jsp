
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生个人信息</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForTeaInfo.css">
    <link rel="stylesheet" href="Font/css/all.css">
    <link rel="icon" href="Font/favicon.ico">

    <style>
        .right:hover .downlist{
            height: 60px;
        }
        .downlist{
            position: absolute;
            top: 50px;
            right: 0;
            width: 100px;
            height: 0px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, .2);
            background-color: white;
            transition: height 0.3s;
            overflow: hidden;
            text-align: center;
        }
        .downlist a:hover{
            color: #859fd9;
        }
        .downlist a:active{
            color: crimson;
            font-size: large;
        }
    </style>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="topbar-wapper">
    <div class="topbar w clearfix">
        <ul class="left">
            <li class="cmms">
                <i class="fas fa-school"></i>
                教室管理系统
            </li>
            <li>
                <a href="workbench/ShowInfo/toCourseFormForStu.do">课程管理</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toClassRoomInfoForStu.do">教室信息</a>
            </li>
            <li class="stuDetails">
                <a href="workbench/ShowInfo/toStuInfo.do">学生个人信息</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toTeaInfoForStu.do">教师信息</a>
            </li>
            <li>
                <a href="settings/qx/Login/toStuMain.do">主页</a>
            </li>
        </ul>
        <ul class="right" style="position: relative;">
            <li class="downlist">
                <a href="">退出登录</a>
            </li>
            <li>
                <div class="portrait">
                </div>
            </li>
            <li>
                ${sessionScope.sessionStudent.fullName}
            </li>
        </ul>
    </div>
</div>
<div class="head-wrapper">
    <div class="head w">
        <h1>欢迎来到教室管理系统！</h1>
    </div>
</div>
<div class="main-wrapper">
    <div class="main">
        <div class="myDetails">
            我的信息
        </div>
        <ul>
            <li>姓名：
                <div id="stuName">${sessionScope.sessionStudent.fullName}</div>
            </li>
            <li>学号：
                <div id="stuNum">${sessionScope.sessionStudent.studentNumber}</div>
            </li>
            <li>性别：
                <div id="stuGender">${sessionScope.sessionStudent.gender}</div>
            </li>
            <li>年龄：
                <div id="stuAge">${sessionScope.sessionStudent.age}</div>
            </li>
            <li>创建信息时间：
                <div id="stuCreateDate">${sessionScope.sessionStudent.createTime}</div>
            </li>
            <li>更新信息时间：
                <div id="stuUpdateDate">${sessionScope.sessionStudent.updateTime}</div>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
