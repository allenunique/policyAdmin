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
    <div class="panel-head"><strong class="icon-reorder">修改员工</strong></div>
    <div><strong>修改员工</strong></div>
    <form action="${pageContext.request.contextPath }/admin/updatePerson.action?id=${requestScope.person.id}" method="post">
        员工姓名：<input type="text" name ="name" value="${requestScope.person.name}">
        电话：<input type="text" name ="tel" value="${requestScope.person.tel}">
        CRM：<input type="text" name ="crm" value="${requestScope.person.crm}">
        <button type="submit"  class="button border-green">修改</button>
    </form>
    <hr/>
    <div><strong>该员工的通话记录</strong></div>
    <table class="table table-hover text-center">
        <tr>
            <th>id</th>
            <th>日期</th>
            <th>总量</th>
            <th>总时长</th>
            <th>呼出总量</th>
            <th>呼出总时长</th>
            <th>呼入总量</th>
            <th>呼入总时长</th>
            <th>操作</th>
        </tr>
        <c:choose>
            <c:when test="${not empty requestScope.person.telMessages}">
                <c:forEach var="telMessage" items="${requestScope.person.telMessages}" varStatus="var">
                    <tr>
                        <th>${var.count}</th>
                        <th>${telMessage.date}</th>
                        <th>${telMessage.countAll}</th>
                        <th>${telMessage.allTime}</th>
                        <th>${telMessage.countOutAll}</th>
                        <th>${telMessage.outAllTime}</th>
                        <th>${telMessage.countInAll}</th>
                        <th>${telMessage.inAllTime}</th>
                       <th>
                            <a href="#">删除</a>
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
