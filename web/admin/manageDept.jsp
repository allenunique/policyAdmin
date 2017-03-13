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
                    for (var i = 0; i < myobj.length; i++) {

                        $('#center').append("<option value='" + myobj[i].centerName + "' >" + myobj[i].centerName + "</option>");
                    }
                },
                error: function () {
                    alert("加载中心失败");
                }
            });
        };
     </script>

        </head>
<body>

<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">管理部门</strong></div>

    <form action="${pageContext.request.contextPath }/admin/queryDepts.action" method="post">
    请选择所属大中心: <select id='bigCenter'name = "bigCenter" onchange="getCenter()"><option value="">---大中心---</option></select>
    请选择要管理的大中心: <select id='center'name = "center"><option>---中心---</option></select>
    <hr/>
    <button type="submit"  class="button border-green">搜索</button>
    </form>

    <table class="table table-hover text-center">
        <tr>
            <th>id</th>
            <th>部门名称</th>
            <th>操作</th>
        </tr>
        <c:choose>
            <c:when test="${not empty requestScope.depts}">
                <c:forEach var="dept" items="${requestScope.depts}" varStatus="var">
                    <tr>
                        <th>${var.count}</th>
                        <th>${dept.deptName}</th>
                        <th>
                            <a href="${pageContext.request.contextPath }/admin/viewDept.action?id=${dept.deptId}">修改</a>
                            <a href="${pageContext.request.contextPath }/admin/deleteDept.action?id=${dept.deptId}">删除</a>
                        </th>

                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="3"><div>没有数据</div></td>
                </tr>
            </c:otherwise>
        </c:choose>
     </table>
</div>
</body>
</html>