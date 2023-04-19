<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>教师主页</title>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
    <link rel="icon" href="Font/favicon.ico">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForStuMain.css">
    <link rel="stylesheet" href="Font/css/all.css">
    <style>
        .aaa{
            width: 758px;
            height: 424px;
            margin: 50px auto;
            position: relative;
        }
        .aaa .ddd{
            position: absolute;
        }
        .aaa li:nth-child(1){
            z-index: 1;
        }
        .bbb{
            position: absolute;
            z-index: 9999;
            bottom: 10px;
            left: 20px;

        }
        .bbb li{
            float: left;
            margin-left: 2px;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: rgba(0, 0, 0, .4);
            background-clip: content-box;
            border: 2px solid transparent;
        }
    </style>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            let img1=document.getElementById("img1");
            let imgArr=["image/1.png","image/2.png","image/3.png","image/4.png"];
            var index=0;
            let allA=document.getElementsByClassName("cd");
            setInterval(function(){
                index++;
                if(index>=allA.length){
                    allA[index-1].style.backgroundColor=" rgba(0, 0, 0, .4)";
                    index=0;
                }
                img1.src=imgArr[index];
                allA[index].style.backgroundColor="#3b79ff";
                allA[index-1].style.backgroundColor=" rgba(0, 0, 0, .4)";
            },2800);
        }
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
                <a href="workbench/ShowInfo/toCourseInfoForTea.do">课程预约</a>
            </li>
            <li class="stuDetails">
                <a href="workbench/ShowInfo/toClassRoomInfoForTea.do">教室信息</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toTeaInfo.do" >教师个人信息</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toStuInfoForTea.do">学生信息</a>
            </li>
            <li>
                <a href="settings/qx/Login/toTeaMain.do">主页</a>
            </li>
        </ul>
        <ul class="right">
            <li>
                <div class="portrait">
                </div>
            </li>
            <li>
                ${sessionScope.sessionTeacher.fullName}
            </li>
        </ul>
    </div>
</div>

<div class="main-wrapper w clearfix">
    <div class="main"style="position: relative;">
        <div style="left: 0;right: 0;margin: 5px auto;padding:5px;padding-left:5%;color:rgb(76, 76, 215);line-height: 30px;height: 30px;font-size: 20px;letter-spacing: 4px;">欢迎来到教室管理系统!</div>
        <div style="left: 0;right: 0;margin: 5px auto;padding:5px;padding-left:5%;letter-spacing: 2px; ">本系统界面简洁，易于操作：）欢迎您的使用~</div>
        <div class="myDetails" style="
                padding: 10px;
                width: fit-content;
                border-radius: 3px;
                border: #859fd9 2px dotted;
                background-color: #c2c9d8;
                letter-spacing: 2px;
                margin-left:5%;
                margin-top:10px">
            界面展示
        </div>
        <ul class="aaa">
            <li class="ddd"><a href="#"><img src="image/1.png" id="img1" ></a></li>
            <ul class="bbb">
                <li class="active cd"><a href="#"></a></li>
                <li class="cd"><a href="#"></a></li>
                <li class="cd"><a href="#"></a></li>
                <li class="cd"><a href="#"></a></li>
            </ul>
        </ul>
    </div>
</div>

</body>
</html>