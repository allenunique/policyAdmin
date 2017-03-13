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
    <div class="panel-head"><strong class="icon-reorder">管理部门</strong></div>

    <form action="${pageContext.request.contextPath }/admin/queryPersons.action" method="post">
    请选择所属大中心: <select id='bigCenter'name = "bigCenter" onchange="getCenter()"><option value="">---大中心---</option></select>
    请选择所属中心:<select id='center'name = "center" onchange="getDept()"><option>---中心---</option></select>
    请选择部门: <select id='dept' name = "dept"><option>---部门---</option></select>
        <hr/>
    <button type="submit"  class="button border-green">搜索</button>
    </form>

    <table class="table table-hover text-center">
        <tr>
            <th>id</th>
            <th>姓名</th>
            <th>电话</th>
            <th>CRM</th>
            <th>操作</th>
        </tr>
        <c:choose>
            <c:when test="${not empty requestScope.persons}">
                <c:forEach var="person" items="${requestScope.persons}" varStatus="var">
                    <tr>
                        <th>${var.count}</th>
                        <th>${person.name}</th>
                        <th>${person.tel}</th>
                        <th>${person.crm}</th>
                        <th>
                            <a href="${pageContext.request.contextPath }/admin/viewPerson.action?id=${person.id}">修改</a>
                            <a href="${pageContext.request.contextPath }/admin/deletePerson.action?id=${person.id}">删除</a>
                        </th>

                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5"><div>没有数据</div></td>
                </tr>
            </c:otherwise>
        </c:choose>
     </table>
</div>
</body>
</html>