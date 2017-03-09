<%--
  Created by IntelliJ IDEA.
  User: ad
  Date: 2017-02-06
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="renderer" content="webkit">
  <title>后台管理中心</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
  <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
  <script type="text/javascript">
    $(function(){
      $(".leftnav h2").click(function(){
        $(this).next().slideToggle(200);
        $(this).toggleClass("on");
      })
      $(".leftnav ul li a").click(function(){
        $("#a_leader_txt").text($(this).text());
        $(".leftnav ul li a").removeClass("on");
        $(this).addClass("on");
      })
    });
  </script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="${pageContext.request.contextPath }/img/logo.gif" class="radius-circle rotate-hover" height="50" alt="" /></h1>
  </div>
  <div class="head-l">
    <span style='cursor:pointer;color:#FFF;text-decoration: none; margin-right: 20px'>${sessionScope.user.dept.deptName}</span>
    <a class="button button-little bg-red" href="${pageContext.request.contextPath }/user/loginOut.action"><span class="icon-power-off"></span>退出登录</a>
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2>投诉流转系统</h2>
  <ul style="display:block">
    <li><a href="${pageContext.request.contextPath }/order/addTask.action" target="right"><span class="icon-caret-right"></span>下发任务</a></li>
    <li><a href="${pageContext.request.contextPath }/order/searchTasks.action?status=11" target="right"><span class="icon-caret-right"></span>已发布任务</a></li>
  </ul>
  <h2>电话量统计系统</h2>
  <ul style="display:block">
    <li><a href="${pageContext.request.contextPath }/telMessage/showTelMessage.action" target="right"><span class="icon-caret-right"></span>查看电话量</a></li>
    <li><a href="${pageContext.request.contextPath }/telMessage/showUpload.action" target="right"><span class="icon-caret-right"></span>上传文件</a></li>
  </ul>
  <ul style="display:block">
    <li><a href="${pageContext.request.contextPath }/user/viewUpdate.action" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
    <li><a href="${pageContext.request.contextPath }/#" target="right"><span class="icon-caret-right"></span>下载中心</a></li>
  </ul>
</div>

<div class="admin">
  <iframe scrolling="auto" frameborder="0" src="" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>
