<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生主页</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForStuMain.css">
    <link rel="stylesheet" href="Font/css/all.css">

    <script>
        $(function (){






        })
    </script>
</head>
<body>
<div class="topbar-wapper">
    <div class="topbar w">
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
                <a href="settings/qx/Login/toStuMain.do" >学生个人信息</a>
            </li>
            <li>
                <a href="">教师信息</a>
            </li>
            <li>
                <a href="">主页</a>
            </li>
        </ul>
        <ul class="right">
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
