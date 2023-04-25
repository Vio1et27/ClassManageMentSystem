<%@ page import="com.cdy.cms.workbench.pojo.Classroom" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
    <title>课程预约</title>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"
          href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForCourseInfoForTea.css">
    <link rel="stylesheet" href="Font/css/all.css">
    <link rel="icon" href="Font/favicon.ico">
    <style>
        .search span {
            margin-left: 1.5%;
            margin-right: 2px;
        }

        .search input {
            height: 20px;
            width: 120px;
        }

        .zsg {
            margin: 0.5% 5%;
        }

        .zsg button {
            float: left;
            outline: none;
            margin: 0;
            padding: 2px;
            width: 50px;
            letter-spacing: 1px;
        }

        .zsg button:active {
            color: white;
        }

        .modal button:active {
            color: #2c66e4;
        }

        .modal ul li {
            margin-bottom: 20px;
            letter-spacing: 2px;
        }

        .modal ul li input {
            border: 1px solid rgba(0, 0, 0, .4);
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
            queryCourseByConditionForPage(1, 10);
            $(window).keydown(function (event){
                if(event.keyCode == 13){
                    $("#queryCourseBtn").click();
                }
            });
            function queryCourseByConditionForPage(pageNo, pageSize) {
                var classroomName = $("#query-classroomName").val();
                var curriculum = $("#query-curriculum").val();
                var startDate = $("#query-startDate").val();
                var endDate = $("#query-endDate").val();
                var createBy = $("#query-createBy").val();
                $.ajax({
                    url: 'workbench/ShowInfo/queryCourseByConditionForPage.do',
                    data: {
                        classroomName: classroomName,
                        curriculum: curriculum,
                        startDate: startDate,
                        endDate: endDate,
                        createBy: createBy,
                        pageNo: pageNo,
                        pageSize: pageSize
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var htmlStr = "";
                        $.each(data.courseList, function (index, obj) {
                            htmlStr += "<tr class=\"active\">";
                            htmlStr += "<td><input type=\"checkbox\" value=\"" + obj.classroomName + "\"/></td>";
                            htmlStr += "<td>" + obj.classroomName + "</td>";
                            htmlStr += "<td>" + obj.curriculum + "</td>";
                            htmlStr += "<td>" + obj.startDate + "</td>";
                            htmlStr += "<td>" + obj.endDate + "</td>";
                            htmlStr += "<td>" + obj.createBy + "</td>";
                            htmlStr += "</tr>";
                        });
                        $("#tBody").html(htmlStr);
                        $("#checkAll").prop("checked", false);
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
                                queryCourseByConditionForPage(pageObj.currentPage, pageObj.rowsPerPage);
                            }
                        });
                    }
                });
            }

            function queryCourseByName(pageNo, pageSize) {
                //var pageSize = $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage');
                //var pageNo = 1;
                var classroomName = $("#query-classroomName").val();
                var curriculum = $("#query-curriculum").val();
                var startDate = $("#query-startDate").val();
                var endDate = $("#query-endDate").val();
                $.ajax({
                    url: 'workbench/ShowInfo/queryAllCourseForTeaByCreateBy.do',
                    data: {
                        classroomName: classroomName,
                        curriculum: curriculum,
                        startDate: startDate,
                        endDate: endDate,
                        pageNo: pageNo,
                        pageSize: pageSize
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var htmlStr = "";
                        $.each(data.courseList, function (index, obj) {
                            htmlStr += "<tr class=\"active\">";
                            htmlStr += "<td><input type=\"checkbox\" value=\"" + obj.classroomName + "\"/></td>";
                            htmlStr += "<td>" + obj.classroomName + "</td>";
                            htmlStr += "<td>" + obj.curriculum + "</td>";
                            htmlStr += "<td>" + obj.startDate + "</td>";
                            htmlStr += "<td>" + obj.endDate + "</td>";
                            htmlStr += "<td>" + obj.createBy + "</td>";
                            htmlStr += "</tr>";
                        });
                        $("#tBody").html(htmlStr);
                        $("#checkAll").prop("checked", false);
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
                                queryCourseByName(pageObj.currentPage, pageObj.rowsPerPage);
                            }
                        });
                    }
                });
            }

            $("#AllCourse").click(function () {
                queryCourseByConditionForPage(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            })

            $("#myCourse").click(function () {
                queryCourseByName(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            })

            $("#queryCourseBtn").click(function () {
                if ($("#AllCourse").prop("checked")) {
                    queryCourseByConditionForPage(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                } else if ($("#myCourse").prop("checked")) {
                    queryCourseByName(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                }
            });

            $("#checkAll").click(function () {
                $("#tBody input[type='checkbox']").prop("checked", this.checked);
            });

            $("#tBody").on("click", "input", function () {
                if ($("#tBody input[type='checkbox']:checked").size() == $("#tBody input[type='checkbox']").size()) {
                    $("#checkAll").prop("checked", true);
                } else {
                    $("#checkAll").prop("checked", false);
                }
            });

            $("#createCourseBtn").click(function () {
                $("#classSearchForCourse").prop("style",
                    "position:absolute;display:block;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);");
                $("#modelBtn").prop("style", "position:absolute;display:block;width:38%;height:50%;background-color:white;top:0;left:0;right:0;bottom:0;margin:auto;box-shadow: 0 3px 10px rgba(0, 0, 0, .2);");
            })


                $("#saveCourseBtn").click(function () {
                    var classroomName = $("#create-classroomName").val();
                    var classroomCourse = $("#create-classroomCourse").val();
                    var classroomStartDate = $("#create_classroomStartDate").val();
                    var classroomEndDate = $("#create_classroomEndDate").val();
                    if (classroomName == "") {
                        $("#msgError").text("教室名不能为空!");
                        return;
                    }
                    if (classroomCourse == "") {
                        $("#msgError").text("教室课程不能为空!");
                        return;
                    }
                    if (classroomStartDate == "") {
                        $("#msgError").text("课程开始时间不能为空!");
                        return;
                    }
                    if (classroomEndDate == "") {
                        $("#msgError").text("课程结束时间不能为空!");
                        return;
                    }
                    $.ajax({
                        url: 'workbench/ShowInfo/saveAppointCourse.do',
                        data: {
                            classroomName: classroomName,
                            curriculum: classroomCourse,
                            startDate: classroomStartDate,
                            endDate: classroomEndDate
                        },
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            if (data.code == "1") {
                                turnOffCourseBtn();
                                queryCourseByConditionForPage(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                            } else {
                                $("#msgError").text(data.message);
                            }
                        },
                        beforeSend: function () {
                            $("#msgError").text("正在努力验证...");
                            return true;
                        }
                    });
                })
            $("#deleteCourseBtn").click(function (){

                    var classroomName = $("#tBody input[type='checkbox']:checked");
                    if(classroomName.size()==0){
                        alert("请选择要删除的课程!");
                        return;
                    }
                    if(window.confirm("确定删除吗?")){
                        var names = "";
                        $.each(classroomName,function (){
                            names+="classroomName="+this.value+"&";
                        });
                        names = names.substr(0,names.length-1);
                        $.ajax({
                            url:'workbench/AppointClassroom/deleteAppointClass.do',
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

            $("#updateCourseBtn").click(function (){


                var cnt = $("#tBody input[type='checkbox']:checked").size();
                if(cnt>1 || cnt==0) {
                    alert("请选择一项进行修改!");
                    return;
                }
                var classroomNameee = $("#tBody input[type='checkbox']:checked").val();
                $.ajax({
                    url:'workbench/activity/returnEditInfoByName.do',
                    data:{
                        classroomName:classroomNameee
                    },
                    type:'post',
                    dataType:'json',
                    success:function (data){
                        $("#update-classroomName").val(data.classroomName);
                        $("#update-classroomCourse").val(data.curriculum);
                        $("#update_classroomStartDate").val(data.startDate);
                        $("#update_classroomEndDate").val(data.endDate);
                        $("#classSearchForUpdate").prop("style",
                            "position:absolute;display:block;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);");
                        $("#modelBtnUpdate").prop("style", "position:absolute;display:block;width:38%;height:50%;background-color:white;top:0;left:0;right:0;bottom:0;margin:auto;box-shadow: 0 3px 10px rgba(0, 0, 0, .2);");
                    }
                })


            })
            //updateCourse
            $("#updateCourse").click(function () {
                var oldName = $("#tBody input[type='checkbox']:checked").val();
                var classroomName = $("#update-classroomName").val();
                var curriculum = $("#update-classroomCourse").val();
                var startDate = $("#update_classroomStartDate").val();
                var endDate = $("#update_classroomEndDate").val();
                if (classroomName == "" ||classroomName==null) {
                    /*$("#msgErrorUpdate").text("教室名不能为空!");
                    return;*/
                    classroomName = oldName;
                }
                if (curriculum == "") {
                    $("#msgErrorUpdate").text("教室课程不能为空!");
                    return;
                }
                if (startDate == "") {
                    $("#msgErrorUpdate").text("课程开始时间不能为空!");
                    return;
                }
                if (endDate == "") {
                    $("#msgErrorUpdate").text("课程结束时间不能为空!");
                    return;
                }
                $.ajax({
                    url: 'workbench/AppointClassroom/updateAppointClass.do',
                    data: {
                        classroomName: classroomName,
                        curriculum: curriculum,
                        startDate: startDate,
                        endDate: endDate,
                        oldName:oldName,
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == "1") {
                            turnOffCourseBtnUpdate();
                            queryCourseByConditionForPage(1, $("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                        } else {
                            $("#msgErrorUpdate").text(data.message);
                        }
                    }

                });
            })
            })





        function turnOffCourseBtn() {
            $("#classSearchForCourse").prop("style", "position:absolute;display:none;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);");
            $("#modelBtn").prop("style", "position:absolute;display:none;width:38%;height:50%;background-color:white;top:0;left:0;right:0;bottom:0;margin:auto;box-shadow: 0 3px 10px rgba(0, 0, 0, .2);");
        }

        function turnOffCourseBtnUpdate() {
            $("#classSearchForUpdate").prop("style", "position:absolute;display:none;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);");
            $("#modelBtnUpdate").prop("style", "position:absolute;display:none;width:38%;height:50%;background-color:white;top:0;left:0;right:0;bottom:0;margin:auto;box-shadow: 0 3px 10px rgba(0, 0, 0, .2);");
        }
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
                <a href="workbench/ShowInfo/toCourseInfoForTea.do">课程预约</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toClassRoomInfoForTea.do">教室信息</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toTeaInfo.do">教师个人信息</a>
            </li>
            <li>
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
                <div class="portrait"></div>
            </li>
            <li>
                ${sessionScope.sessionTeacher.fullName}
            </li>
        </ul>
    </div>
</div>
<div class="head-wrapper w">
    <div class="head w">
        <h1>欢迎来到教室管理系统！</h1>
    </div>
</div>
<div class="main-wrapper w">
    <div class="main w">
        <div class="myDetails">
            课程预约
        </div>
        <div class="search"
             style="width:100%;display: flex;align-items: center;justify-content: center; padding-bottom: 1%;padding-top: 1%;margin-bottom:1%;background-color: rgb(220, 220, 234);">
            <span>教室:</span><input type="text" id="query-classroomName">
            <span>课程:</span><input type="text" id="query-curriculum">
            <span>开始时间:</span><input type="datetime-local" id="query-startDate">
            <span>结束时间:</span><input type="datetime-local" id="query-endDate">
            <span>授课老师:</span><input type="text" id="query-createBy">
            <button style="margin-left: 10px;" id="queryCourseBtn">查询</button>
        </div>
        <div style="margin-left: 5%;margin-bottom: 1%;">
            <span>全部课程</span><input type="radio" name="aaa" checked id="AllCourse">
            <span>自己课程</span><input type="radio" name="aaa" id="myCourse">
        </div>
        <div class="zsg clearfix">
            <button id="createCourseBtn" style="background-color: rgb(131, 209, 211);border: 1px solid;">创建</button>
            <button id="updateCourseBtn" style="background-color: rgb(134, 166, 220);border: 1px solid;">修改</button>
            <button id="deleteCourseBtn" style="background-color: rgb(221, 125, 125);border: 1px solid;">删除</button>
        </div>
        <table>
            <tr class="first">
                <td>
                    <input type="checkbox" id="checkAll">
                </td>
                <td>教室位置</td>
                <td>课程</td>
                <td>创建时间</td>
                <td>结束时间</td>
                <td>授课老师</td>
            </tr>
            <tbody id="tBody">
        </table>
        <div id="demo_pag1"></div>
    </div>
</div>

<div id="classSearchForCourse" class="modal-wrapper" style="position:absolute;display:none;
    top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);">
    <div id="modelBtn" class="modal"
         style="position:absolute;display:block;width:38%;height:50%;background-color:white;top:0;left:0;right:0;bottom:0;margin:auto;box-shadow: 0 3px 10px rgba(0, 0, 0, .2);">
        <button onclick="turnOffCourseBtn()" style="float:right;padding:0 4px;border: none;background-color:transparent;font-size: 24px;">×
        </button>
        <div style="padding: 10px;
            font-size: 18px;
            width: fit-content;
            background-color: #c2c9d8;
            margin-top:20px;
            margin-left: 20px;
            margin-bottom: 10px;
            letter-spacing: 2px;">
            创建课程
        </div>
        <ul style="float:left;padding: 30px 20px;
            border-top: #859fd9 1px solid;
            width: 92%;">
            <li>教室名：
                <%--<select style="width:28%;" id="create-classroomName">
                    <c:forEach items="${emptyclassrooms}" var="room">
                        <option>${room.classroomname}</option>
                    </c:forEach>
                </select>--%>
<%--                <input type="text" id="create-classroomName">--%>
                <select id="create-classroomName">
                    <%
                        List<String> classroomList = (ArrayList<String>)request.getAttribute("emptyclassrooms");
                        for (String classroom : classroomList) { %>
                    <option><%=classroom%></option>
                    <%
                        }
                    %>
                </select>
            </li>
            <li>课程名：
                <input type="text" id="create-classroomCourse">
            </li>
            <li>课程开始时间：
                <input type="datetime-local" id="create_classroomStartDate">
            </li>
            <li>课程结束时间：
                <input type="datetime-local" id="create_classroomEndDate">
            </li>
            <br>
            <span id="msgError" style="color:red"></span>
            <br>
            <li>
                <button id="saveCourseBtn"
                        style="position: absolute;left: 0;right: 0;margin: 0 auto;width: fit-content;letter-spacing: 1px;">
                    立即创建
                </button>
            </li>
        </ul>
    </div>
</div>

<div id="classSearchForUpdate" class="modal-wrapper" style="position:absolute;display:none;
    top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);">
    <div id="modelBtnUpdate" class="modal"
         style="position:absolute;display:block;width:38%;height:50%;background-color:white;top:0;left:0;right:0;bottom:0;margin:auto;box-shadow: 0 3px 10px rgba(0, 0, 0, .2);">
        <button onclick="turnOffCourseBtnUpdate()" style="float:right;padding:0 4px;border: none;background-color:transparent;font-size: 24px;">×
        </button>
        <div style="padding: 10px;
            font-size: 18px;
            width: fit-content;
            background-color: #c2c9d8;
            margin-top:20px;
            margin-left: 20px;
            margin-bottom: 10px;
            letter-spacing: 2px;">
            更新课程
        </div>
        <ul style="float:left;padding: 30px 20px;
            border-top: #859fd9 1px solid;
            width: 92%;">
            <li>教室名：
                <%-- <select style="width:28%;" id="create-classroomName">
                     <c:forEach items="${emptyclassrooms}" var="obj">
                         <option value="${obj.classroominformationid}">${obj.classroomname}</option>
                     </c:forEach>
                 </select>--%>
                <select id="update-classroomName">
                    <%
                        List<String> classroomListUpdate = (ArrayList<String>)request.getAttribute("emptyclassrooms");
                        for (String classroom : classroomListUpdate) { %>
                    <option><%=classroom%></option>
                    <%
                        }
                    %>
                </select>
            </li>
            <li>课程名：
                <input type="text" id="update-classroomCourse">
            </li>
            <li>课程开始时间：
                <input type="datetime-local" id="update_classroomStartDate">
            </li>
            <li>课程结束时间：
                <input type="datetime-local" id="update_classroomEndDate">
            </li>
            <br>
            <span id="msgErrorUpdate" style="color:red"></span>
            <br>
            <li>
                <button id="updateCourse"
                        style="position: absolute;left: 0;right: 0;margin: 0 auto;width: fit-content;letter-spacing: 1px;">
                    更新
                </button>
            </li>
        </ul>
    </div>
</div>
</body>

</html>
