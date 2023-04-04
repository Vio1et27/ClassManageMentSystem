<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    $(function (){
        /**
         * 点击注册按钮后，跳转到注册界面
         */
        $("#registerBtn").onclick(function (){
            window.location.href="settings/qx/Register/toRegister.do"
        })
        /**
         * 当用户敲下回车键时，登录
         */
       /* $(window).keydown(function (event){
            if(event.keyCode == 13){
                $("#loginBtn").click();
            }
        });*/

        $("#loginBtnForStu").click(function () {
            var loginAct = $.trim($("#loginAct").val());
            var loginPwd = $.trim($("#loginPwd").val());
            var isRemPwd = $("#isRemPwd").prop("checked");
            if (loginAct == "") {
                alert("用户名不能为空");
                return;
            }
            if (loginPwd == "") {
                alert("密码不能为空");
                return;
            }
            $.ajax({
                url: 'settings/qx/Login/LoginForStudent.do',
                data: {
                    loginAct: loginAct,
                    loginPwd: loginPwd,
                    isRemPwd: isRemPwd
                },
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data.code == "1") {
                        window.location.href = "workbench/main/toStuMain.do";
                    } else {
                        $("#msg").text(data.message);
                    }
                },
                beforeSend: function () {
                    $("#msg").text("正在努力验证...");
                    return true;
                }
            });
        });


        $("#loginBtnForTea").click(function () {
            var loginAct = $.trim($("#loginAct").val());
            var loginPwd = $.trim($("#loginPwd").val());
            var isRemPwd = $("#isRemPwd").prop("checked");
            if (loginAct == "") {
                alert("用户名不能为空");
                return;
            }
            if (loginPwd == "") {
                alert("密码不能为空");
                return;
            }
            $.ajax({
                url: 'settings/qx/Login/LoginForTeacher.do',
                data: {
                    loginAct: loginAct,
                    loginPwd: loginPwd,
                    isRemPwd: isRemPwd
                },
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data.code == "1") {
                        window.location.href = "workbench/main/toTeaMain.do";
                    } else {
                        $("#msg").text(data.message);
                    }
                },
                beforeSend: function () {
                    $("#msg").text("正在努力验证...");
                    return true;
                }
            });
        });
    })
</script>
<body>
    <!--这里放登录页面-->
<h2>这是一个登录界面</h2>

    <div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
        <div style="position: absolute; top: 0px; right: 60px;">
            <div class="page-header">
                <h1>登录</h1>
            </div>
            <form action="workbench/index.html" class="form-horizontal" role="form">
                <div class="form-group form-group-lg">
                    <div style="width: 350px;">
                        <input class="form-control" id="loginAct" type="text" value="${cookie.loginAct.value}" placeholder="用户名">
                    </div>
                    <div style="width: 350px; position: relative;top: 20px;">
                        <input class="form-control" id="loginPwd" type="password" value="${cookie.loginPwd.value}" placeholder="密码">
                    </div>
                    <div class="checkbox" style="position: relative;top: 30px; left: 10px;">
                        <label>
                            <c:if test="${not empty cookie.loginAct and not empty cookie.loginPwd}">
                                <input type="checkbox" id="isRemPwd" checked="checked"> 记住密码
                            </c:if>
                            <c:if test="${empty cookie.loginAct and empty cookie.loginPwd}">
                                <input type="checkbox" id="isRemPwd"> 记住密码
                            </c:if>

                        </label>
                        <span id="msg" style="color:red"></span>
                    </div>
                    <button type="button" id="loginBtnForTea" class="btn btn-primary btn-lg btn-block"
                            style="width: 350px; position: relative;top: 45px;">以教师身份登录
                    </button>
                    <button type="button" id="loginBtnForStu" class="btn btn-primary btn-lg btn-block"
                            style="width: 350px; position: relative;top: 45px;">以学生身份登录
                    </button>
                    <button type="button" id="registerBtn" class="btn btn-primary btn-lg btn-block"
                            style="width: 350px; position: relative;top: 45px;">注册
                    </button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
