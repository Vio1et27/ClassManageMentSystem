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
    <title>课程管理</title>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForCourseInfoForStu.css">
    <link rel="stylesheet" href="Font/css/all.css">
    <link rel="icon" href="Font/favicon.ico">
    <style>
        .search span{
            margin-left:1.5%;
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
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>




    <script type="text/javascript">
        $(function (){
            queryCourseByConditionForPage(1,10);

            $(window).keydown(function (event){
                if(event.keyCode == 13){
                    $("#queryCourseBtn").click();
                }
            });
            function queryCourseByConditionForPage(pageNo,pageSize) {
                var classroomName=$("#query-classroomName").val();
                var curriculum=$("#query-curriculum").val();
                var startDate=$("#query-startDate").val();
                var endDate=$("#query-endDate").val();
                var createBy=$("#query-createBy").val();
                $.ajax({
                    url:'workbench/ShowInfo/queryCourseByConditionForPage.do',
                    data:{
                        classroomName:classroomName,
                        curriculum:curriculum,
                        startDate:startDate,
                        endDate:endDate,
                        createBy:createBy,
                        pageNo:pageNo,
                        pageSize:pageSize
                    },
                    type:'post',
                    dataType:'json',
                    success:function (data) {
                        var htmlStr="";
                        $.each(data.courseList,function (index,obj) {
                            htmlStr+="<tr class=\"active\">";
                            htmlStr+="<td><input type=\"checkbox\" value=\""+obj.classroomName+"\"/></td>";
                            htmlStr+="<td>"+obj.classroomName+"</td>";
                            htmlStr+="<td>"+obj.curriculum+"</td>";
                            htmlStr+="<td>"+obj.startDate+"</td>";
                            htmlStr+="<td>"+obj.endDate+"</td>";
                            htmlStr+="<td>"+obj.createBy+"</td>";
                            htmlStr+="</tr>";
                        });
                        $("#tBody").html(htmlStr);
                        $("#checkAll").prop("checked",false);
                        var totalPages = 1;
                        if(data.totalRows%pageSize==0){
                            totalPages=data.totalRows/pageSize;
                        }else{
                            totalPages=parseInt(data.totalRows/pageSize)+1;
                        }
                        //对容器调用bs_pagination工具函数，显示翻页信息
                        $("#demo_pag1").bs_pagination({
                            currentPage:pageNo,
                            rowsPerPage:pageSize,
                            totalRows:data.totalRows,
                            totalPages:totalPages,
                            visiblePageLinks:5,
                            showGoToPage:true,
                            noData:true,
                            showRowsPerPage:true,
                            showRowsInfo:true,
                            onChangePage: function(event,pageObj) {
                                queryCourseByConditionForPage(pageObj.currentPage,pageObj.rowsPerPage);
                            }
                        });
                    }
                });
            }
            function queryCourseByName(pageNo,pageSize){
                //var pageSize = $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage');
                //var pageNo = 1;
                var classroomName=$("#query-classroomName").val();
                var curriculum=$("#query-curriculum").val();
                var startDate=$("#query-startDate").val();
                var endDate=$("#query-endDate").val();
                var createBy=$("#query-createBy").val();
                $.ajax({
                    url:'workbench/ShowInfo/queryAllCourseForStuByStuName.do',
                    data:{
                        classroomName:classroomName,
                        curriculum:curriculum,
                        startDate:startDate,
                        endDate:endDate,
                        createBy:createBy,
                        pageNo:pageNo,
                        pageSize:pageSize
                    },
                    type:'post',
                    dataType:'json',
                    success:function (data) {
                        var htmlStr="";
                        $.each(data.courseList,function (index,obj) {
                            htmlStr+="<tr class=\"active\">";
                            htmlStr+="<td><input type=\"checkbox\" value=\""+obj.classroomName+"\"/></td>";
                            htmlStr+="<td>"+obj.classroomName+"</td>";
                            htmlStr+="<td>"+obj.curriculum+"</td>";
                            htmlStr+="<td>"+obj.startDate+"</td>";
                            htmlStr+="<td>"+obj.endDate+"</td>";
                            htmlStr+="<td>"+obj.createBy+"</td>";
                            htmlStr+="</tr>";
                        });
                        $("#tBody").html(htmlStr);
                        $("#checkAll").prop("checked",false);
                        var totalPages = 1;
                        if(data.totalRows%pageSize==0){
                            totalPages=data.totalRows/pageSize;
                        }else{
                            totalPages=parseInt(data.totalRows/pageSize)+1;
                        }
                        //对容器调用bs_pagination工具函数，显示翻页信息
                        $("#demo_pag1").bs_pagination({
                            currentPage:pageNo,
                            rowsPerPage:pageSize,
                            totalRows:data.totalRows,
                            totalPages:totalPages,
                            visiblePageLinks:5,
                            showGoToPage:true,
                            noData:true,
                            showRowsPerPage:true,
                            showRowsInfo:true,
                            onChangePage: function(event,pageObj) {
                                queryCourseByName(pageObj.currentPage,pageObj.rowsPerPage);
                            }
                        });
                    }
                });
            }

            /*if($("#AllCourse").prop("checked")){
                queryCourseByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            }else if($("#myCourse").prop("checked")){
                queryCourseByName(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            }*/
            $("#AllCourse").click(function (){
                queryCourseByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            })

            $("#myCourse").click(function (){
                queryCourseByName(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            })

            $("#queryCourseBtn").click(function () {
                if($("#AllCourse").prop("checked")){
                    queryCourseByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                }else if($("#myCourse").prop("checked")){
                    queryCourseByName(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                }
            });

            $("#checkAll").click(function (){
                $("#tBody input[type='checkbox']").prop("checked",this.checked);
            });

            $("#tBody").on("click","input",function () {
                if($("#tBody input[type='checkbox']:checked").size() == $("#tBody input[type='checkbox']").size()){
                    $("#checkAll").prop("checked",true);
                }else{
                    $("#checkAll").prop("checked",false);
                }
            });

            $("#appointClassRoom").click(function(){
                var classroomName = $("#tBody input[type='checkbox']:checked");
                var classrooms = $("#tBody input[type='checkbox']:checked").size();
                if(classrooms == 0){
                    alert("请选择课程！");
                    return;
                }
                if(window.confirm("确定预约吗?")){
                    var names = "";
                    $.each(classroomName,function (){
                        names+="classroomName="+this.value+"&";
                    });
                    names = names.substr(0,names.length-1);
                    $.ajax({
                        url:'workbench/AppointClassroom/appointCourseForStu.do',
                        data:names,
                        type:'post',
                        dataType:'json',
                        success:function(data){
                            if(data.code=="1"){
                                queryCourseByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                            }else{
                                alert(data.message);
                            }
                        }
                    });
                }

            })


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
            <li class="stuDetails">
                <a href="workbench/ShowInfo/toCourseFormForStu.do">课程管理</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toClassRoomInfoForStu.do">教室信息</a>
            </li>
            <li>
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
                <a href="workbench/ShowInfo/logOutMainForStu.do">退出登录</a>
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
<div class="main-wrapper w">
    <div class="main w">
        <div class="myDetails">
            我的课程
        </div>
        <%--var classroomName=$("#query-classroomName").val();
        var curriculum=$("#query-curriculum").val();
        var startDate=$("#query-startDate").val();
        var endDate=$("#query-endDate").val();
        var createBy=$("#query-createBy").val();--%>
        <div class="search" style="width:100%;display: flex;align-items: center;justify-content: center; padding-bottom: 1%;padding-top: 1%;margin-bottom:1%;background-color: rgb(220, 220, 234);">
            <span>教室:</span><input type="text" id="query-classroomName">
            <span>课程:</span><input type="text" id="query-curriculum">
            <span>开始时间:</span><input type="datetime-local" id="query-startDate">
            <span>结束时间:</span><input type="datetime-local" id="query-endDate">
            <span>授课老师:</span><input type="text" id="query-createBy">
            <button style="margin-left: 10px;" id="queryCourseBtn">查询</button>
        </div>
        <div style="margin-left: 5%;margin-bottom: 1%;">
            <span>自己课程</span><input type="radio" name="aaa" id="myCourse">
            <span>全部课程</span><input type="radio" name="aaa" id="AllCourse" checked>
            <span>预约教室</span><button id="appointClassRoom" style="padding:3px 5px;">+</button>
        </div>
        <table>
            <tr class="first">
                <td>
                    <input type="checkbox" id="checkAll">
                </td>
                <td>教室</td>
                <td>课程</td>
                <td>开始时间</td>
                <td>结束时间</td>
                <td>授课老师</td>
            </tr>
            <tbody id="tBody">


           <%-- <tr>
                <td>教室</td>
                <td>课程</td>
                <td>开始时间</td>
                <td>结束时间</td>
                <td>授课老师</td>
            </tr>--%>

            </tbody>
        </table>
        <div id="demo_pag1"></div>
    </div>
</div>
</body>

</html>
