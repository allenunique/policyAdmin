<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
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
    <div class="panel-head"><strong class="icon-reorder">用户管理</strong></div>
    <table class="table table-hover text-center">
      <tr>
        <th>用户名</th>
        <th>部门</th>
        <th>操作</th>
      </tr>
        <c:choose>
        	<c:when test="${not empty requestScope.pageBean.pageData}">
        		<c:forEach var="user" items="${requestScope.pageBean.pageData}">
	  					<tr>
	  					<td>${user.username }</td>
	  					<td>${user.dept.deptName }</td>
	  					<td><a href = "${pageContext.request.contextPath }/admin/deleteUser.action?id=${user.userId}">删除</a></td>
         				</tr>
        		</c:forEach>
        	</c:when>
        	<c:otherwise>
        	<tr>
        		<td colspan="3"><div>没有数据</div></td>
     		</tr>
        	</c:otherwise>
        </c:choose>

        <td colspan="3"><div class="pagelist">
            <a href="${pageContext.request.contextPath }/admin/showUsers.action?currentPage=1">首页</a>
            <a href="${pageContext.request.contextPath }/admin/showUsers.action?currentPage=${requestScope.pageBean.currentPage-1}">上一页</a>
            <span class="current">第${requestScope.pageBean.currentPage }页 </span>
            <span>共${requestScope.pageBean.totalPage }页</span>
            <a href="${pageContext.request.contextPath }/admin/showUsers.action?currentPage=${requestScope.pageBean.currentPage+1}">下一页</a>
            <a href="${pageContext.request.contextPath }/admin/showUsers.action?currentPage=${requestScope.pageBean.totalPage}">尾页</a>
        </div></td>

 	    </table>
 	 </div>
	</body>
</html>