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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生信息</title>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"
          href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForStuInfoForTea.css">
    <link rel="stylesheet" href="Font/css/all.css">
    <link rel="icon" href="Font/favicon.ico">
    <style>
        .search span {
            margin-left: 1.5%;
            margin-right: 2px;
            letter-spacing: 1px;
        }

        .search input{
            outline: none;
            border: 1px solid #b6b8bc;
            border-radius: 3px;
            height: 26px;
            width: 126px;
            padding: 1px 6px;
            background-color: white;
        }
        .search input:focus{
            border: 1px solid #5684d9;
            color: #5684d9;
        }
        .search input:hover{
            background-color: #ECF5FF;
            border: 1px solid #5684d9;
        }
        button{
            padding:0.4rem 1rem;
            background-color: white;
            color: #333;
            border-radius: 4px;
            border: 1px solid #818181;
            outline: none;
            cursor: pointer;
        }
        button:hover{
            background-color: #ECF5FF;
            color: #409eff;
            border: 1px solid #409eff;
        }
        button:active{
            border: 1px solid rgba(33, 143, 206, 0.5);
            color: rgba(33, 143, 206, 0.5);
            transform: none;
        }
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
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript"
            src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>
    <script type="text/javascript">
        $(function () {
            queryStudentByConditionForPage(1, 10);
            $(window).keydown(function (event){
                if(event.keyCode == 13){
                    $("#queryStuBtn").click();
                }
            });
            function queryStudentByConditionForPage(pageNo, pageSize) {
                var stuName = $("#queryName").val();
                var stuNum = $("#queryNum").val();
                var stuAge = $("#queryAge").val();
                var stuGender = $("#queryGender").val();
                $.ajax({
                    url: 'workbench/ShowInfo/queryStuByConditionForTea.do',
                    data: {
                        stuName: stuName,
                        stuNum: stuNum,
                        stuAge: stuAge,
                        stuGender: stuGender,
                        pageNo: pageNo,
                        pageSize: pageSize
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var htmlStr = "";
                        $.each(data.stuForTeaList, function (index, obj) {
                            htmlStr += "<tr class=\"active\">";
                            htmlStr += "<td>" + obj.fullName + "</td>";
                            htmlStr += "<td>" + obj.studentNumber + "</td>";
                            htmlStr += "<td>" + obj.gender + "</td>";
                            htmlStr += "<td>" + obj.age + "</td>";
                            htmlStr += "</tr>";
                        });
                        $("#tBody").html(htmlStr);
                        var totalPages = 1;
                        if (data.totalRows % pageSize == 0) {
                            totalPages = data.totalRows / pageSize;
                        } else {
                            totalPages = parseInt(data.totalRows / pageSize) + 1;
                        }
                        //对容器调用bs_pagination工具函数，显示翻页信息
                        $("#demo_pag1").bs_pagination({
                            currentPage: pageNo,
                            rowsPerPage: pageSize,
                            totalRows: data.totalRows,
                            totalPages: totalPages,
                            visiblePageLinks: 5,
                            showGoToPage: true,
                            noData: true,
                            showRowsPerPage: true,
                            showRowsInfo: true,
                            onChangePage: function (event, pageObj) {
                                queryStudentByConditionForPage(pageObj.currentPage, pageObj.rowsPerPage);
                            }
                        });
                    }
                });
            }

            function queryStudentByName(pageNo, pageSize) {
                //var pageSize = $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage');
                //var pageNo = 1;
                var stuName = $("#queryName").val();
                var stuNum = $("#queryNum").val();
                var stuAge = $("#queryAge").val();
                var stuGender = $("#queryGender").val();
                $.ajax({
                    url: 'workbench/ShowInfo/queryStuForTeaByStuName.do',
                    data: {
                        stuName: stuName,
                        stuNum: stuNum,
                        stuAge: stuAge,
                        stuGender: stuGender,
                        pageNo: pageNo,
                        pageSize: pageSize
                    },
                    type: 'post',
                    dataType: 'json',
                    //contentType: "application/json",
                    success: function (data) {
                        var htmlStr = "";

                        $.each(data.stuForTeaByNameList, function (index, obj) {

                                htmlStr += "<tr class=\"active\">";
                                htmlStr += "<td>" +  obj.fullName + "</td>";
                                htmlStr += "<td>" +  obj.studentNumber + "</td>";
                                htmlStr += "<td>" +  obj.gender+ "</td>";
                                htmlStr += "<td>" +  obj.age + "</td>";
                                htmlStr += "</tr>";


                        });
                        $("#tBody").html(htmlStr);
                        var totalPages = 1;
                        if (data.totalRows % pageSize == 0) {
                            totalPages = data.totalRows / pageSize;
                        } else {
                            totalPages = parseInt(data.totalRows / pageSize) + 1;
                        }
                        //对容器调用bs_pagination工具函数，显示翻页信息
                        $("#demo_pag1").bs_pagination({
                            currentPage: pageNo,
                            rowsPerPage: pageSize,
                            totalRows: data.totalRows,
                            totalPages: totalPages,
                            visiblePageLinks: 5,
                            showGoToPage: true,
                            noData: true,
                            showRowsPerPage: true,
                            showRowsInfo: true,
                            onChangePage: function (event, pageObj) {
                                queryStudentByName(pageObj.currentPage, pageObj.rowsPerPage);
                            }
                        });
                    }
                });
            }

            $("#AllStudent").click(function () {
                queryStudentByConditionForPage(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            })

            $("#myStudent").click(function () {
                queryStudentByName(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            })

            $("#queryStuBtn").click(function () {
                if ($("#AllStudent").prop("checked")) {
                    queryStudentByConditionForPage(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                } else if ($("#myStudent").prop("checked")) {
                    queryStudentByName(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                }
            });


        })


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
                <a href="workbench/ShowInfo/toCourseInfoForTea.do">课程预约</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toClassRoomInfoForTea.do">教室信息</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toTeaInfo.do">教师个人信息</a>
            </li>
            <li class="stuDetails">
                <a href="workbench/ShowInfo/toStuInfoForTea.do">学生信息</a>
            </li>
            <li>
                <a href="settings/qx/Login/toTeaMain.do">主页</a>
            </li>
        </ul>
        <ul class="right" style="position: relative;">
            <li class="downlist">
                <a href="workbench/ShowInfo/logOutMainForTea.do">退出登录</a>
            </li>
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
<div class="head-wrapper">
    <div class="head w">
        <h1>欢迎来到教室管理系统！</h1>
    </div>
</div>
<div class="main-wrapper w">
    <div class="main w">
        <div class="myDetails">
            学生信息
        </div>
        <div class="search"
             style="width:100%;display: flex;align-items: center;justify-content: center; padding-bottom: 1%;padding-top: 1%;margin-bottom:1%;background-color: rgb(220, 220, 234);">
            <span>姓名:</span><input type="text" id="queryName">
            <span>学号:</span><input type="text" id="queryNum">
            <span>性别:</span><input type="text" id="queryGender">
            <span>年龄:</span><input type="text" id="queryAge">
            <button style="margin-left: 10px;letter-spacing: 1px;" id="queryStuBtn">查询</button>
        </div>
        <div style="margin-left: 5%;margin-bottom: 1%;">
            <span>全部学生</span><input type="radio" name="aaa" checked id="AllStudent">
            <span>自己学生</span><input type="radio" name="aaa" id="myStudent">
        </div>
        <table>
            <tr class="first">
                <td>姓名</td>
                <td>学号</td>
                <td>性别</td>
                <td>年龄</td>
            </tr>
            <tbody id="tBody">

            </tbody>

        </table>
        <div id="demo_pag1"></div>
    </div>
</div>
</body>

</html>
