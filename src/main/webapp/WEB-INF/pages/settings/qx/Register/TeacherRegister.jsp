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
    <title>注册</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForRegister.css">
    <script type="text/javascript">
        $(function () {


            $("#registerBtnForTea").click(function () {
                var fullName = $("#fullName").val();
                var teacherJobNumber = $("#teacherJobNumber").val();
                var loginPwd = $("#loginPwd").val();
                var position = $("#position").val();
                var gender = $('input[type=radio]:checked').val();
                if (fullName == "") {
                    alert("教师姓名不能为空！");
                    return;
                }
                if (teacherJobNumber == "") {
                    alert("教职工不能为空!");
                    return;
                }
                if (loginPwd == "") {
                    alert("密码不能为空!");
                    return;
                }
                if (position == "") {
                    alert("职位不能为空");
                    return;
                }
                if (gender == "") {
                    alert("性别不能为空!");
                    return;
                }
                $.ajax({
                    url: 'settings/qx/Register/registerForTeacher.do',
                    data: {
                        fullName: fullName,
                        teacherJobNumber: teacherJobNumber,
                        gender: gender,
                        position: position,
                        loginPwd: loginPwd
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == "1") {
                            window.location.href = "settings/qx/Login/toLogin.do";
                        } else {
                            $("#msgForTea").text(data.message);
                        }
                    },
                    beforeSend: function () {
                        $("#msgForTea").text("正在努力验证...");
                        return true;
                    }

                })

            })
        });
    </script>
</head>
<body>
<div class="container">
    <div class="form-container teacher" id="teacherContainer">
        <div>
            <h1>教师注册</h1>
            <span>姓名：</span>
            <input type="text" id="fullName">
            <br><br>
            <span>工号：</span>
            <input type="text" id="teacherJobNumber">
            <br><br>
            <span>职位：</span>
            <input type="text" id="position">
            <br><br>
            <span>密码：</span>
            <input type="password" id="loginPwd">
            <br><br>
            <span>性别：</span>
            <span>男</span><input type="radio" name="gender" value="male">
            <span>女</span><input type="radio" name="gender" value="female">
            <br><br>
            <span id="msgForTea" style="color:red"></span>
            <button id="registerBtnForTea">注册</button>
            <br><br><a href="settings/qx/Register/toStuRegister.do">学生注册</a>
        </div>
        <a href="settings/qx/Login/toLogin.do" style="margin-top:20px;color: #000;">已有账号?立即登录!</a>
    </div>
</div>
</body>
</html>