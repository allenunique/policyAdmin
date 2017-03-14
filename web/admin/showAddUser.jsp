<%--
  Created by IntelliJ IDEA.
  User: ad
  Date: 2017-03-14
  Time: 11:02
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
    <div class="panel-head"><strong class="icon-reorder">添加用户</strong></div>
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/admin/addUser.action">
        <div class="form-group">
            <div class="label">
                <label>选择所属大中心：</label>
            </div>
            <div class="field">
                <select id='bigCenter'name = "bigCenter" onchange="getCenter()"><option value="">---大中心---</option></select>
            </div>
        </div>
        <div class="form-group">
            <div class="label">
                <label>选择所属中心：</label>
            </div>
            <div class="field">
                <select id='center'name = "center" onchange="getDept()"><option>---中心---</option></select>
            </div>
        </div>
        <div class="form-group">
            <div class="label">
                <label>选择所属部门：</label>
            </div>
            <div class="field">
                <select id='dept' name = "dept"><option>---部门---</option></select>
            </div>
        </div>

        <hr/>
        <div class="form-group">
            <div class="label">
                <label>请输入用户名：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" name="userName" size="50" placeholder="请输入用户名"/>
            </div>
        </div>
        <div class="form-group">
            <div class="label">
                <label>请输入用户密码：</label>
            </div>
            <div class="field">
                <input type="password" class="input w50" name="newpass" size="50" placeholder="请输入密码" data-validate="required:请输入密码,length#>=5:密码不能小于5位" />
            </div>
        </div>
        <div class="form-group">
            <div class="label">
                <label>确认密码：</label>
            </div>
            <div class="field">
                <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入密码" data-validate="required:请再次输入密码,repeat#newpass:两次输入的密码不一致" />
            </div>
        </div>
        <div class="form-group">
            <div class="label">
                <label></label>
            </div>
            <div class="field">
                <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
            </div>
        </div>
        </form>
</div>
</body>
</html>

