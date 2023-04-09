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

    <title>教室管理系统用户登录</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript">
        $(function () {

            $("#loginBtnForStu").click(function () {
                var studentNumber = $.trim($("#studentNumber").val());
                var stuPwd = $.trim($("#stuPwd").val());
                if (studentNumber == "") {
                    alert("用户名不能为空");
                    return;
                }
                if (stuPwd == "") {
                    alert("密码不能为空");
                    return;
                }
                $.ajax({
                    url: 'settings/qx/Login/LoginForStudent.do',
                    data: {
                        studentNumber:   studentNumber,
                        loginPwd: stuPwd
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == "1") {
                            window.location.href = "settings/qx/Login/toStuMain.do";
                        } else {
                            $("#msgForStu").text(data.message);
                            //alert("登录失败，用户名或密码错误!")
                        }
                    },
                    beforeSend: function () {
                        $("#msgForStu").text("正在努力验证...");
                        return true;

                    }
                });
            })

            $("#loginBtnForTea").click(function () {
                var teacherJobNumber = $.trim($("#teacherJobNumber").val());
                var teaPwd = $.trim($("#teaPwd").val());
                if (teacherJobNumber == "") {
                    alert("用户名不能为空");
                    return;
                }
                if (teaPwd == "") {
                    alert("密码不能为空");
                    return;
                }
                $.ajax({
                    url: 'settings/qx/Login/LoginForTeacher.do',
                    data: {
                        teacherJobNumber: teacherJobNumber,
                        loginPwd: teaPwd
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == "1") {
                            window.location.href = "settings/qx/Login/toTeaMain.do";
                        } else {
                            $("#msgForTea").text(data.message);
                            //alert("登录失败，用户名或密码错误!")
                        }
                    },
                    beforeSend: function () {
                        $("#msgForTea").text("正在努力验证...");
                        return true;
                    }
                });
            })


        })


    </script>
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="#">
            <h1>教师登录</h1>
            <span>尊敬的老师 : ) </span>
            <input type="text" placeholder="用户名" class="input" id="teacherJobNumber">
            <input type="password" placeholder="密码" class="input" id="teaPwd">
            <span id="msgForTea" style="color:red"></span>
            <button id="loginBtnForTea">登录</button>
        </form>
    </div>
    <div class="form-container login-container">
        <form action="#">
            <h1>学生登录</h1>
            <span>亲爱的同学(●'◡'●)</span>
            <input type="text" placeholder="用户名" class="input" id="studentNumber">
            <input type="password" placeholder="密码" class="input" id="stuPwd">
            <span id="msgForStu" style="color:red"></span>
            <button id="loginBtnForStu">登录</button>
        </form>
    </div>
    <!-- 滑动侧边栏 -->
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>我是学生？</h1>
                <p>那就来这边！</p>
                <button class="dash" id="logIn">←</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>我是教师？</h1>
                <p>请往这边~~~</p>
                <button class="dash" id="signUp">→</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="js/login.js"></script>
</html>