<%--
  Created by IntelliJ IDEA.
  User: ad
  Date: 2017-03-04
  Time: 17:19
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

</head>
<body>

<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">修改中心</strong></div>
    <div><strong>修改中心名称</strong></div>
    <form action="${pageContext.request.contextPath }/admin/updateCenter.action?centerId=${requestScope.center.centerId}" method="post">
        中心名称：<input type="text" name ="centerName" value="${requestScope.center.centerName}">
        <button type="submit"  class="button border-green">修改</button>
    </form>
    <hr/>
    <div><strong>该中心所包含的部门</strong></div>
    <table class="table table-hover text-center">
        <tr>
            <th>id</th>
            <th>部门</th>
            <th>操作</th>
        </tr>
        <c:choose>
            <c:when test="${not empty requestScope.center.depts}">
                <c:forEach var="dept" items="${requestScope.center.depts}" varStatus="var">
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
