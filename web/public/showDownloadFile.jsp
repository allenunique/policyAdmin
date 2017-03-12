<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type " content="text/html; charset=utf-8" />
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
    <div class="panel-head"><strong class="icon-reorder"> 下载中心</strong></div>
    <table class="table table-hover text-center">
      <tr>
        <th>文件名称</th>
        <th>下载</th>
      </tr>             
        <c:choose>
        	<c:when test="${not empty requestScope.downList}">
        		<c:forEach var="name" items="${requestScope.downList}">
	  					<tr>
	  					<td>${name }</td>
	  					<td><a href = "${pageContext.request.contextPath }/download/download_file.action?fileName=${name }&token=${token} ">下载</a></td>
         				</tr>
        		</c:forEach>
        	</c:when>
        	<c:otherwise>
        	<tr>
        		<td colspan="2"><div>没有数据</div></td>
     		</tr>
        	</c:otherwise>
        </c:choose>
 	    </table>
 	 </div>
	</body>
</html>