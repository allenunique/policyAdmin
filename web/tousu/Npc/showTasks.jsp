<%--
  Created by IntelliJ IDEA.
  User: ad
  Date: 2017-02-17
  Time: 11:24
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
    <style type="text/css">
        .done{ background-color: #aeecff }
        .table-hover > tbody > tr.done:hover > td {background-color:#87e7ff}
    </style>
    <style type="text/css">
        .deal{ background-color: #aeffae}
        .table-hover > tbody > tr.deal:hover > td {background-color:#87ff8a}
    </style>
    <style type="text/css">
        .timeout{ background-color: #ff8480 }
        .table-hover > tbody > tr.timeout:hover > td {background-color:#ff6d68}
    </style>
</head>
<body>

<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 任务管理</strong></div>
    <form method="post" action="${pageContext.request.contextPath }/order/searchTasks.action">
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <div>
                        <input class="laydate-icon" id="date"  name = "startTime" style="height: 35px;margin-right: 10px" placeholder="请选择开始日期">
                        <input class="laydate-icon" id="dateEnd"  name = "endTime" style="height: 35px;margin-right: 10px" placeholder="请选择结束日期">
                    </div>
                </li>
                <hr/>
                <li>
                    <input type="text" name = "userName" style="height: 35px;margin-right: 10px" placeholder="请输入查找用户名">
                    <input type="text" name = "contact" style="height: 35px;margin-right: 10px" placeholder="请输入联系方式">
                    <input type="text" name = "classify_one" style="height: 35px;margin-right: 10px" placeholder="请输入一级分类">
                </li>
                <hr/>
                <li>
                    <select id='bigCenter'name = "bigCenter" onchange="getCenter()"><option value="">---大中心---</option></select>
                    <select id='center'name = "center"><option value="">---中心---</option></select>
                </li>
                <hr/>
                <li>
                    选择任务状态
                    <select name="status">
                        <option value="2">待处理</option>
                        <option value="11" selected>全部任务</option>
                        <option value="0" >已发布，未处理</option>
                        <option value="20">未处理的超时</option>
                        <option value="21">已处理的超时</option>
                        <option value="1">已流转完成</option>
                    </select>
                </li>
                <hr/>
                <li>
                    <button type="submit"  class="button border-green" onclick="return onemonthtypeChange()">搜索</button>
                </li>
            </ul>
        </div>
    </form>

    <table class="table table-hover text-center">
        <tr>
            <th>受理时间</th>
            <th>流转渠道</th>
            <th>流转类别</th>
            <th>高危选项</th>
            <th>一级分类</th>
            <th>客户用户名</th>
            <th>联系方式</th>
            <th>投诉人</th>
            <th>被投诉人</th>
            <th>操作</th>
        </tr>
        <c:choose>
            <c:when test="${not empty requestScope.pageBean.pageData}">
                <c:forEach var="order" items="${requestScope.pageBean.pageData}">
                    <c:choose>
                        <c:when test="${order.status == 1}">
                            <input type="hidden" value = "${order.orderId}" name = "id">
                            <tr class="done">
                                <td>${order.orderMessage1.createOrderTime }</td>
                                <td>${order.orderMessage1.orderFrom }</td>
                                <td>${order.orderMessage1.orderType }</td>
                                <td>${order.orderMessage1.danger }</td>
                                <td>${order.orderMessage1.classify_one }</td>
                                <td>${order.orderMessage1.userName }</td>
                                <td>${order.orderMessage1.contact }</td>
                                <td>${order.orderMessage1.tousuren }</td>
                                <td>${order.orderMessage1.beitousuren }</td>
                                <td>
                                    <div class="button-group"> <a class="button border-green" href = "/order/showDetail.action?id=${order.orderId}">查看</a> </div>
                                </td>
                            </tr>
                        </c:when>
                        <c:when test="${order.status == 20}">
                            <input type="hidden" value = "${order.orderId}" name = "id">
                            <tr  class = "timeout">
                                <td>${order.orderMessage1.createOrderTime }</td>
                                <td>${order.orderMessage1.orderFrom }</td>
                                <td>${order.orderMessage1.orderType }</td>
                                <td>${order.orderMessage1.danger }</td>
                                <td>${order.orderMessage1.classify_one }</td>
                                <td>${order.orderMessage1.userName }</td>
                                <td>${order.orderMessage1.contact }</td>
                                <td>${order.orderMessage1.tousuren }</td>
                                <td>${order.orderMessage1.beitousuren }</td>
                                <td>
                                    <!--<button type="button-group"  class="button border-green">查看</button>-->
                                    <div class="button-group">
                                        <a class="button border-green" href = "/order/showDetail.action?id=${order.orderId}">查看</a>
                                    </div>
                                    <div class="button-group">
                                        <a class="button border-back" href = "/order/republishTasks.action?id=${order.orderId}">重新发布</a>
                                    </div>
                                </td>
                            </tr>
                        </c:when>
                        <c:when test="${order.status == 21}">
                            <input type="hidden" value = "${order.orderId}" name = "id">
                            <tr  class = "timeout">
                                <td>${order.orderMessage1.createOrderTime }</td>
                                <td>${order.orderMessage1.orderFrom }</td>
                                <td>${order.orderMessage1.orderType }</td>
                                <td>${order.orderMessage1.danger }</td>
                                <td>${order.orderMessage1.classify_one }</td>
                                <td>${order.orderMessage1.userName }</td>
                                <td>${order.orderMessage1.contact }</td>
                                <td>${order.orderMessage1.tousuren }</td>
                                <td>${order.orderMessage1.beitousuren }</td>

                                <td>
                                    <!--<button type="button-group"  class="button border-green">查看</button>-->
                                    <div class="button-group">
                                        <a class="button border-green" href = "/order/showDetail.action?id=${order.orderId}">查看</a>
                                    </div>
                                </td>
                            </tr>
                        </c:when>
                        <c:when test="${order.status == 2}">
                            <input type="hidden" value = "${order.orderId}" name = "id">
                            <tr  class = "deal">
                                <td>${order.orderMessage1.createOrderTime }</td>
                                <td>${order.orderMessage1.orderFrom }</td>
                                <td>${order.orderMessage1.orderType }</td>
                                <td>${order.orderMessage1.danger }</td>
                                <td>${order.orderMessage1.classify_one }</td>
                                <td>${order.orderMessage1.userName }</td>
                                <td>${order.orderMessage1.contact }</td>
                                <td>${order.orderMessage1.tousuren }</td>
                                <td>${order.orderMessage1.beitousuren }</td>
                                <td>
                                    <div class="button-group">
                                        <a class="button border-green" href = "/order/showDetail.action?id=${order.orderId}">查看</a>
                                    </div>
                                    <div class="button-group">
                                        <a class="button border-blue" href = "/order/viewDealTask.action?id=${order.orderId}">处理</a>
                                    </div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" value = "${order.orderId}" name = "id">
                            <tr>
                                <td>${order.orderMessage1.createOrderTime }</td>
                                <td>${order.orderMessage1.orderFrom }</td>
                                <td>${order.orderMessage1.orderType }</td>
                                <td>${order.orderMessage1.danger }</td>
                                <td>${order.orderMessage1.classify_one }</td>
                                <td>${order.orderMessage1.userName }</td>
                                <td>${order.orderMessage1.contact }</td>
                                <td>${order.orderMessage1.tousuren }</td>
                                <td>${order.orderMessage1.beitousuren }</td>
                                <td>
                                    <div class="button-group"> <a class="button border-green" href = "/order/showDetail.action?id=${order.orderId}">查看</a> </div>
                                    <div class="button-group"> <a class="button border-red" href="/order/deleteTask.action?id=${order.orderId}&currentPage=${requestScope.pageBean.currentPage}" onclick="return del()">删除</a> </div>
                                </td>
                            </tr>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="10"><div>没有数据</div></td>
                </tr>
            </c:otherwise>
        </c:choose>
        <tr>
            <td colspan="8"><div class="pagelist">
                <a href="${pageContext.request.contextPath }/order/searchTasks.action?currentPage=1">首页</a>
                <a href="${pageContext.request.contextPath }/order/searchTasks.action?currentPage=${requestScope.pageBean.currentPage-1}">上一页</a>
                <span class="current">第${requestScope.pageBean.currentPage }页 </span>
                <span>共${requestScope.pageBean.totalPage }页</span>
                <a href="${pageContext.request.contextPath }/order/searchTasks.action?currentPage=${requestScope.pageBean.currentPage+1}">下一页</a>
                <a href="${pageContext.request.contextPath }/order/searchTasks.action?currentPage=${requestScope.pageBean.totalPage}">尾页</a>
            </div></td>
            <td colspan="2">
                <a class="button border-blue" href = "${pageContext.request.contextPath }/order/exportData.action">以当前搜索条件导出数据</a>
            </td>
        </tr>
    </table>
</div>

<script type="text/javascript">
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#date'});//绑定元素
    }();
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem:'#dateEnd'});//绑定元素
    }();
</script>

<script type="text/javascript">

    function del(){
        if(confirm("您确定要删除该条记录吗?")){
            return true;
        }else{
            return false;
        }
    }
    function onemonthtypeChange(){
        var startDate = $("#date").val();
        var endDate=$("#dateEnd").val();
        /*if(startDate==""||startDate==null){
            alert("请选择开始时间！");
            return false;
        }
        if(endDate==""||endDate==null){
            alert("请选择结束时间！");
            return false;
        }*/
        if((startDate !=""&&startDate!=null)&&(endDate!=""||endDate!=null)){
            var startNum = parseInt(startDate.replace(/-/g,''),10);
            var endNum = parseInt(endDate.replace(/-/g,''),10);
            if(startNum>endNum){
                alert("结束时间不能在开始时间之前！");
                return false;
            }
        }

    }
</script>
</body>
</html>
