<%--
  Created by IntelliJ IDEA.
  User: ad
  Date: 2017-03-06
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath }/js/laydate.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: "post",
                url: "${ctx}/select/getBigCenter.action",
                success: function (data) {
                    var myobj=eval(data);
                    for (var i = 0; i < myobj.length; i++) {
                        $('#bigCenter').append("<option value='" + myobj[i].bigCenterName + "' >" + myobj[i].bigCenterName + "</option>");
                    }
                },
                error: function () {
                    alert("加载大中心失败");
                }
            });
        });
        /*加载中心下拉选*/
        function getCenter() {
            var id = $("#bigCenter").val();
            $("#center").empty();
            $("#dept").empty();
            $.ajax({
                type: "post",
                url: "${ctx}/select/getCenter.action",
                data: {"bigCenterName": id},
                success: function (data) {
                    var myobj=eval(data);
                    $('#center').append("<option value='' selected='selected' >" + '---中心---' + "</option>");
                    $('#dept').append("<option value='' selected='selected' >" + '---部门---' + "</option>");
                    for (var i = 0; i < myobj.length; i++) {

                        $('#center').append("<option value='" + myobj[i].centerName + "' >" + myobj[i].centerName + "</option>");
                    }
                },
                error: function () {
                    alert("加载中心失败");
                }
            });
        };
        /*加载部门下拉选*/
        function getDept() {
            var id = $("#center").val();
            $("#dept").empty();
            //$("#area_code").empty();
            $.ajax({
                type: "post",
                url: "${ctx}/select/getDept.action",
                data: {"centerName": id},
                success: function (data) {
                    var myobj=eval(data);
                    $('#dept').append("<option value='' selected='selected' >" + '---部门---' + "</option>");
                    //$('#area_code').append("<option value='' selected='selected' >" + '请选择' + "</option>");
                    for (var i = 0; i < myobj.length; i++) {

                        $('#dept').append("<option value='" + myobj[i].deptName + "' >" + myobj[i].deptName + "</option>");
                    }
                },
                error: function () {
                    alert("加载部门失败");
                }
            });
        };
    </script>
</head>
<body>

    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">添加</strong></div>
        <div><strong>添加</strong></div>
        <c:choose>
            <c:when test="${requestScope.judge eq \"bigCenter\"}">
                <form action="${pageContext.request.contextPath }/admin/addBigCenter.action" method="post">
                    请输入大中心名称：<input type="text" name ="bigCenterName">
                    <button type="submit"  class="button border-green">添加</button>
                </form>
            </c:when>
            <c:when test="${requestScope.judge == \"center\"}">
                <form action="${pageContext.request.contextPath }/admin/addCenter.action" method="post">
                选择所属大中心：<select id='bigCenter'name = "bigCenter""><option value="">---大中心---</option></select>
                    <hr/>
                请输入中心名称：<input type="text" name ="centerName">
                    <button type="submit"  class="button border-green">添加</button>
                </form>
            </c:when>
            <c:when test="${requestScope.judge == \"dept\"}">
                <form action="${pageContext.request.contextPath }/admin/addDept.action" method="post">
                选择所属大中心：<select id='bigCenter'name = "bigCenter" onchange="getCenter()"><option value="">---大中心---</option></select>
                选择所属中心:<select id='center'name = "center"><option>---中心---</option></select>
                    <hr/>
                请输入部门名称：<input type="text" name ="deptName">
                 <button type="submit"  class="button border-green">添加</button>
                </form>
            </c:when>
            <c:when test="${requestScope.judge == \"person\"}">
                <form action="${pageContext.request.contextPath }/admin/addPerson.action" method="post">
                选择所属大中心：<select id='bigCenter'name = "bigCenter" onchange="getCenter()"><option value="">---大中心---</option></select>
                选择所属中心:<select id='center'name = "center" onchange="getDept()"><option>---中心---</option></select>
                选择部门: <select id='dept' name = "dept"><option>---部门---</option></select>
                <hr/>
                 请输入员工姓名：<input type="text" name ="name">
                请输入员工电话：<input type="text" name ="tel">
                请输入员工CRM：<input type="text" name ="crm">
                 <button type="submit"  class="button border-green">添加</button>
                </form>
            </c:when>

        </c:choose>

    </div>
</body>
</html>
