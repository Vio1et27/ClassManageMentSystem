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
    <title>教室信息</title>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styleForClassRoomInfoForStu.css">
    <link rel="stylesheet" href="Font/css/all.css">
    <link rel="icon" href="Font/favicon.ico">
<style>
    .search span{
        margin-left:1.5%;
        margin-right: 2px;
        letter-spacing: 1px;
    }
    .search input{
        height: 20px;
        width: 120px;
    }
    .modal button:active{
        color: #2c66e4;
    }
    .modal ul li{
        margin-bottom: 20px;
        letter-spacing: 2px;
    }
    .modal ul li div{
        display:inline;
        border-bottom: 1px solid rgba(0, 0, 0, .4);
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
            queryClassroomByConditionForPage(1,10);

            function queryClassroomByConditionForPage(pageNo,pageSize) {
                var classroomName=$("#query-classroomName").val();
                var classroomLocation=$("#query-classroomLocation").val();
                var capacity=$("#query-capacity").val();
                var classroomEnvironment=$("#query-classroomEnvironment").val();
                $.ajax({
                    url:'workbench/ShowInfo/queryClassroomByConditionForPage.do',
                    data:{
                        classroomName:classroomName,
                        classroomLocation:classroomLocation,
                        capacity:capacity,
                        classroomEnvironment:classroomEnvironment,
                        pageNo:pageNo,
                        pageSize:pageSize
                    },
                    type:'post',
                    dataType:'json',
                    success:function (data) {
                        var htmlStr="";
                        $.each(data.classroomList,function (index,obj) {
                            let tempName = obj.classroomName;
                            htmlStr+="<tr class=\"active\">";
                            htmlStr+="<td>"+obj.classroomName+"</td>";
                            htmlStr+="<td>"+obj.classroomLocation+"</td>";
                            htmlStr+="<td>"+obj.capacity+"</td>";
                            htmlStr+="<td>"+obj.classroomEnvironment+"</td>";
                            htmlStr+="<td><input value=\"具体信息\"  name=\""+tempName+"\" type=\"button\"  id=\""+tempName+"\"></td>";
                            htmlStr+="</tr>";
                            temp();
                            function temp(){

                                setTimeout(() => {
                                    var inp = document.getElementsByName(tempName)[0];
                                   inp.setAttribute("onclick","showDetailBtn("+tempName+")");
                                }, 500)

                            }

                        });
                        $("#tBody").html(htmlStr);
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
                                queryClassroomByConditionForPage(pageObj.currentPage,pageObj.rowsPerPage);
                            }
                        });
                    }
                });
            }
            $("#queryClassroomBtn").click(function () {
                    queryClassroomByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
            });




        })
        function showDetailBtn(classroomName){
            var name = classroomName.id;
            console.log(name);
            $.ajax({
                url:'workbench/ShowInfo/showClassroomDetailsForStudent.do',
                data:{
                    classroomName: name
                },
                type:'post',
                dataType:'json',
                //contentType:'application/json;charset=UTF-8',
                success:function(data){
                    var classroomDetail = data.classroomDetail;
                    var courseDetail = data.courseDetail;
                    console.log(classroomDetail);
                    console.log(courseDetail);
                    if(courseDetail===null||courseDetail===undefined){
                        $("#res-classroomName").text(classroomName.id);
                        $("#res-correspondingCourses").text("该教室空闲!");
                        $("#res-startDate").text("该教室空闲!");
                        $("#res-endDate").text("该教室空闲!");
                        $("#res-createBy").text("该教室空闲!");
                    }else{
                        $("#res-classroomName").text(classroomName.id);
                        $("#res-correspondingCourses").text(classroomDetail.correspondingCourses);
                        $("#res-startDate").text(courseDetail.startDate);
                        $("#res-endDate").text(courseDetail.endDate);
                        $("#res-createBy").text(courseDetail.createBy);
                    }
                    $("#classSearch").prop("style",
                        "position:absolute;display:block;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);");
                    //$("#res-classSearch").text("style=\"position:absolute;display:block;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);\"");
                }
            });
        }

        function turnOffBtn(){
            $("#classSearch").prop("style",
                "position:absolute;display:none;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);");
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
            <li>
                <a href="workbench/ShowInfo/toCourseFormForStu.do">课程管理</a>
            </li>
            <li class="stuDetails">
                <a href="workbench/ShowInfo/toClassRoomInfoForStu.do">教室信息</a>
            </li>
            <li>
                <a href="workbench/ShowInfo/toStuInfo.do" >学生个人信息</a>
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
                <a href="">退出登录</a>
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
            教室信息
        </div>
       <%-- var classroomName=$("#query-classroomName").val();
        var classroomLocation=$("#query-classroomLocation").val();
        var capacity=$("#query-capacity").val();
        var classroomEnvironment=$("#query-classroomEnvironment").val();--%>
        <div class="search" style="width:100%;display: flex;align-items: center;justify-content: center; padding-bottom: 1%;padding-top: 1%;margin-bottom:1%;background-color: rgb(220, 220, 234);">
            <span>教室名:</span><input type="text" id="query-classroomName">
            <span>教室位置:</span><input type="text" id="query-classroomLocation">
            <span>可容纳人数:</span><input type="text" id="query-capacity">
            <span>教室环境:</span><input type="text" id="query-classroomEnvironment">
            <button style="margin-left: 10px;" id="queryClassroomBtn">查询</button>
        </div>
        <%--<div style="margin-left: 5%;margin-bottom: 1%;">
            <span>全部教室</span><input type="radio" name="aaa" checked id="AllClassroom">
            <span>自己教室</span><input type="radio" name="aaa" id="myClassroom">
        </div>--%>
        <table>
            <tr class="first">
                <td>教室名</td>
                <td>教室位置</td>
                <td>可容纳人数</td>
                <td>教室环境</td>
                <td>课程信息</td>
            </tr>
            <tbody id="tBody">


            </tbody>
        </table>
        <div id="demo_pag1"></div>
    </div>
</div>

<div class="modal-wrapper" id="classSearch" style="position:absolute;display:none;top:0;z-index:10000;width:100%;height:100%;background-color:rgba(0, 0, 0, .4);">
    <div class="modal"style="position:absolute;display:block;width:38%;height:50%;background-color:white;top:0;left:0;right:0;bottom:0;margin:auto;box-shadow: 0 3px 10px rgba(0, 0, 0, .2);">
        <button onclick="turnOffBtn()" style="float:right;padding:0 4px;border: none;background-color:transparent;font-size: 24px;">×</button>
        <div style="padding: 10px;
            font-size: 18px;
            width: fit-content;
            background-color: #c2c9d8;
            margin-top:20px;
            margin-left: 20px;
            margin-bottom: 10px;
            letter-spacing: 2px;">
            课程信息
        </div>
        <ul style="float:left;padding: 30px 20px;border-top: #859fd9 1px solid;width: 92%;">
            <li>教室名：
                <div id="res-classroomName">11</div>
            </li>
            <li>课程名：
                <div id="res-correspondingCourses">11</div>
            </li>
            <li>课程开始时间：
                <div id="res-startDate">11</div>
            </li>
            <li>课程结束时间：
                <div id="res-endDate">11</div>
            </li>
            <li>授课老师：
                <div id="res-createBy">11</div>
            </li>
        </ul>
    </div>
</div>
</body>

</html>
