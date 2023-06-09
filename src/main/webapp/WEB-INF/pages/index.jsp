<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
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
    <style>
        .box2 p,
        .box1 p{
            height: 30%;
            letter-spacing: 2px;
            color: #0b2983;
        }
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
<div class="topbar-wrapper">
    <div class="topbar w clearfix">
        <ul class="left">
            <li>
                <i class="fas fa-school"></i>
                教室管理系统
            </li>
        </ul>
        <ul class="right">
            <li class="li1">反馈
                <i class="fas fa-angle-down"></i>
                <div class="box1"  style="overflow: hidden;font-size: 13px;">
                    <p>qq邮箱:</p>
                    <p>3104044743</p>
                    <p>@qq.com</p>
                </div>
            </li>
            <li class="li2">制作人员
                <i class="fas fa-angle-down"></i>
                <div class="box2"  style="overflow: hidden;">
                    <p>陈后珩</p>
                    <p>董灿</p>
                    <p>严权</p>
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


<div class="main-wrapper w clearfix">
    <div class="main" style="position: relative;">
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
