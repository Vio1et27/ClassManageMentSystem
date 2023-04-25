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
    <title>注册</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForRegister.css">
    <link rel="icon" href="Font/favicon.ico">
    <script type="text/javascript">
        $(function () {


            $("#registerBtnForStu").click(function () {
                var fullName = $.trim($("#fullName").val());
                var studentNumber = $.trim($("#studentNumber").val());
                var loginPwd = $.trim($("#loginPwd").val());
                var age = $.trim($("#age").val());
                var gender = $('input[type=radio]:checked').val();
                var pattpassword = /^[a-zA-Z]\w{5,17}$/;
                var pattstudentNumber = /^\d{7,}$/;
                var pattNameAndPos = /^[\u4E00-\u9FA5A-Za-z0-9]{2,12}$/;
                if(fullName==""||fullName==null){
                    $("#msgForStu").text("姓名不能为空!");
                    return;
                }
                if (!pattNameAndPos.test(fullName)) {
                    $("#msgForStu").text("姓名为中文、英文、数字但不包括下划线等符号，且长度在2-12!");
                    return;
                }
                if(studentNumber==""||studentNumber==null){
                    $("#msgForStu").text("学号不能为空!");
                    return;
                }
                if (!pattstudentNumber.test(studentNumber)) {
                    $("#msgForStu").text("学号至少为7位数字");
                    return;
                }
                if(loginPwd==""||loginPwd==null){
                    $("#msgForStu").text("密码不能为空!");
                    return;
                }
                if (!pattpassword.test(loginPwd)) {
                    $("#msgForStu").text("密码以字母开头，长度在6~18之间，只能包含字母、数字和下划线!");
                    return;
                }
                if (age <= 16 || age >= 25) {
                    $("#msgForStu").text("年龄不符要求(17 - 24)!");
                    return;
                }
                if (gender == ""||gender==null) {
                    $("#msgForStu").text("性别不能为空!");
                    return;
                }
                $.ajax({
                    url: 'settings/qx/Register/registerForStudent.do',
                    data: {
                        fullName: fullName,
                        studentNumber: studentNumber,
                        gender: gender,
                        age: age,
                        loginPwd: loginPwd
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == "1") {
                            window.location.href = "settings/qx/Login/toLogin.do";
                            //alert("test");
                        } else {
                            $("#msgForStu").text(data.message);
                            //alert("注册失败");

                        }
                    },
                    beforeSend: function () {
                        $("#msgForStu").text("正在努力验证...");
                        return true;
                    }
                })

            })
        });
    </script>
</head>
<body>
<div class="container">
    <div class="form-container student" id="studentContainer">
        <div style="margin: 20px">
            <h1>学生注册</h1>
            <div style="margin: 20px 40px;">
                <span>姓名：</span>
                <input type="text" id="fullName" placeholder="">
                <br><br>
                <span>学号：</span>
                <input type="text" id="studentNumber" placeholder="">
                <br><br>
                <span>密码：</span>
                <input type="password" id="loginPwd" placeholder="">
                <br><br>
                <span>年龄：</span>
                <input type="text" id="age" placeholder="">
                <br><br>
                <span>性别：</span>
                <span>男</span><input type="radio" name="gender" value="male">
                <span>女</span><input type="radio" name="gender" value="female">
            </div>
            <span id="msgForStu" style="color:red"></span>
            <button id="registerBtnForStu">注册</button>
            <br>
            <div style="text-align: center;margin-bottom: 10px;"><a href="settings/qx/Register/toTeaRegister.do">教师注册</a></div>
            <div style="text-align: center;"><a href="settings/qx/Login/toLogin.do" style="margin-top:20px;color: #000;">已有账号?立即登录!</a></div>
        </div>
    </div>
</div>
</body>
</html>