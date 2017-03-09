<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/26
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
        <div class="panel-head"><strong class="icon-reorder"> 任务管理</strong></div>
        <form method="post" action="${pageContext.request.contextPath }/telMessage/showTelMessage.action">
            <div class="padding border-bottom">
                <ul class="search">
                    <li>
                        <div>
                            <input class="laydate-icon" id="dateStart"  name = "startTime" style="height: 35px;margin-right: 10px" placeholder="请选择开始日期">
                            <input class="laydate-icon" id="dateEnd"  name = "endTime" style="height: 35px;margin-right: 10px" placeholder="请选择开始日期">
                        </div>
                    </li>

                    <hr/>
                    <li>
                        <select id='bigCenter'name = "bigCenter" onchange="getCenter()"><option value="">---大中心---</option></select>
                        <select id='center'name = "center"onchange="getDept()"><option value="">---中心---</option></select>
                        <select id='dept' name = "dept"><option value="">---部门---</option></select>
                    </li>
                    <hr/>
                    <li>
                        <button type="submit"  class="button border-green">搜索</button>
                    </li>
                </ul>
            </div>
        </form>
        <table class="table table-hover text-center">
            <tr>
                <th>id</th>
                <th>日期</th>
                <th>姓名</th>
                <th>电话</th>
                <th>总量</th>
                <th>总时长</th>
                <th>呼出总量</th>
                <th>呼出总时长</th>
                <th>小于一分钟呼出量</th>
                <th>小于一分钟呼出时长</th>
                <th>大于一分钟呼出量</th>
                <th>大于一分钟呼出时长</th>
                <th>大于三分钟呼出量</th>
                <th>大于三分钟呼出时长</th>
                <th>呼入总量</th>
                <th>呼入总时长</th>
                <th>小于一分钟呼入量</th>
                <th>小于一分钟呼入时长</th>
                <th>大于一分钟呼入量</th>
                <th>大于一分钟呼入时长</th>
                <th>大于三分钟呼入量</th>
                <th>大于三分钟呼入时长</th>
            </tr>

        <c:choose>
            <c:when test="${not empty requestScope.pageBean.pageData}">
                <c:forEach var="telMessage" items="${requestScope.pageBean.pageData}" varStatus="var">
                    <tr>
                        <th>${var.count}</th>
                        <th>${telMessage.date}</th>
                        <th>${telMessage.person.name}</th>
                        <th>${telMessage.telNum}</th>
                        <th>${telMessage.countAll}</th>
                        <th>${telMessage.allTime}</th>
                        <th>${telMessage.countOutAll}</th>
                        <th>${telMessage.outAllTime}</th>
                        <th>${telMessage.count_1out}</th>
                        <th>${telMessage._1outTime}</th>
                        <th>${telMessage.count$1out}</th>
                        <th>${telMessage.$1outTime}</th>
                        <th>${telMessage.count$3out}</th>
                        <th>${telMessage.$3outTime}</th>
                        <th>${telMessage.countInAll}</th>
                        <th>${telMessage.inAllTime}</th>
                        <th>${telMessage.count_1in}</th>
                        <th>${telMessage._1inTime}</th>
                        <th>${telMessage.count$1in}</th>
                        <th>${telMessage.$1inTime}</th>
                        <th>${telMessage.count$3in}</th>
                        <th>${telMessage.$3inTime}</th>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="20"><div>没有数据</div></td>
                </tr>
            </c:otherwise>
        </c:choose>

            <tr>
                <td colspan="12"><div class="pagelist">
                    <a href="${pageContext.request.contextPath }/telMessage/showTelMessage.action?currentPage=1">首页</a>
                    <a href="${pageContext.request.contextPath }/telMessage/showTelMessage.action?currentPage=${requestScope.pageBean.currentPage-1}">上一页</a>
                    <span class="current">第${requestScope.pageBean.currentPage }页 </span>
                    <span>共${requestScope.pageBean.totalPage }页</span>
                    <a href="${pageContext.request.contextPath }/telMessage/showTelMessage.action?currentPage=${requestScope.pageBean.currentPage+1}">下一页</a>
                    <a href="${pageContext.request.contextPath }/telMessage/showTelMessage.action?currentPage=${requestScope.pageBean.totalPage}">尾页</a>
                </div></td>
                <td colspan="5">
                    <a class="button border-blue" href = "${pageContext.request.contextPath }/telMessage/exportTelMessage.action">以当前搜索条件导出数据</a>
                </td>
            </tr>
        </table>

    </div>



    <script type="text/javascript">
        !function(){
            laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
            laydate({elem: '#dateStart'});//绑定元素
        }();
        !function(){
            laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
            laydate({elem:'#dateEnd'});//绑定元素
        }();
    </script>


</body>
</html>
