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
    <title>后台管理</title>
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
        <h1>后台管理</h1>
    </div>
    <div class="head-l">
        <span style='cursor:pointer;color:#FFF;text-decoration: none; margin-right: 20px'>${sessionScope.user.dept.deptName}</span>
        <a class="button button-little bg-red" href="${pageContext.request.contextPath }/user/loginOut.action"><span class="icon-power-off"></span>退出登录</a>
    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-pencil-square-o"></span>管理</h2>
    <ul style="display:block">
        <li><a href="${pageContext.request.contextPath }/admin/queryCenters.action" target="right"><span class="icon-caret-right"></span>管理中心</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/queryDepts.action" target="right"><span class="icon-caret-right"></span>管理部                                                                                                                                                                                                                                          门</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/queryPersons.action" target="right"><span class="icon-caret-right"></span>管理员工</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/add.action?judge=bigCenter" target="right"><span class="icon-caret-right"></span>添加大中心</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/add.action?judge=center" target="right"><span class="icon-caret-right"></span>添加中心</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/add.action?judge=dept" target="right"><span class="icon-caret-right"></span>添加部门</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/add.action?judge=person" target="right"><span class="icon-caret-right"></span>添加员工</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/showAddUser.action" target="right"><span class="icon-caret-right"></span>添加用户</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/showUsers.action" target="right"><span class="icon-caret-right"></span>管理用户</a></li>
    </ul>
    <ul style="display:block">
        <li><a href="${pageContext.request.contextPath }/admin/viewFile.action?judge=download" target="right"><span class="icon-caret-right"></span>管理导出文件</a></li>
        <li><a href="${pageContext.request.contextPath }/admin/viewFile.action?judge=upload" target="right"><span class="icon-caret-right"></span>管理导入文件</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(".leftnav ul li a").click(function(){
        $("#a_leader_txt").text($(this).text());
        $(".leftnav ul li a").removeClass("on");
        $(this).addClass("on");
    });
</script>

<div class="admin">
    <iframe scrolling="auto" frameborder="0" src="" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>
