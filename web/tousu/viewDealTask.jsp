<%@ page language="java" import="java.util.*"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>处理任务</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){

            $(".cascade_drop_down").change(

                    function () {
                        var name = $(this).attr("name") + "_next";
                        $("#two").empty();
                        $.ajax({
                            type:'post',
                            url:'${ctx}/tousu/config/' + $(this).val() + '.txt',
                            data:'name=' + name + '&val=' + $(this).val(),
                            dataType:'text',
                            success:function(msg){
                                ops = msg.split("\n");
                                for (i = 0; i < ops.length; i++) {
                                    $("#two").append(ops[i]);
                                }
                            },
                            error:function(){
                                alert("请选择.");
                            }
                        });
                    });

        });

    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 任务详情 </strong></div>
    <div class="body-content" style="margin-left: 50px">
        <div class = "info_block">
            <div class = "info_title">受理时间:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name = "createOrderTime" value = "${requestScope.order.orderMessage1.createOrderTime }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">流转渠道:</div>
            <div class = "info_content" >
                <input  type = "text" class = "input" name = "orderFrom" value = "${requestScope.order.orderMessage1.orderFrom }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">流转类别:</div>
            <div class = "info_content">
                <input  type = "text" class = "input" name = "orderType" value = "${requestScope.order.orderMessage1.orderType }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">高危选项:</div>
            <div class = "info_content" >
                <input  type = "text" class = "input" name = "danger" value = "${requestScope.order.orderMessage1.danger }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">一级分类:</div>
            <div class = "info_content" >
                <input  type = "text" class = "input" name = "classify_one" value = "${requestScope.order.orderMessage1.classify_one }" readonly>
            </div>
        </div>

        <div class = "info_block">
            <div class = "info_title">二级分类:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name ="classify_two" value = "${requestScope.order.orderMessage1.classify_two }" readonly>
            </div>
        </div>

        <div class = "info_block">
            <div class = "info_title">三级分类:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name = "classify_three" value = "${requestScope.order.orderMessage1.classify_three }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">客户用户名:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name = "userName" value = "${requestScope.order.orderMessage1.userName }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">投诉人:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name = "tousuren"  value = "${requestScope.order.orderMessage1.tousuren }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">联系方式:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name = "contact" value = "${requestScope.order.orderMessage1.contact }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">父用户:</div>
            <div class =  "info_content">
                <input  type = "text" class = "input" name = "fatherUser" value = "${requestScope.order.orderMessage1.fatherUser }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">首次联系情况:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name = "firstContact" value = "${requestScope.order.orderMessage1.firstContact }"  readonly>
            </div>
        </div>

        <div class = "info_block">
            <div class = "info_title">大中心:</div>
            <div class="info_content">
                <input  type = "text" class = "input" name = "user.dept.center.bigCenter.bigCenterName"  value = "${requestScope.order.orderMessage1.user.dept.center.bigCenter.bigCenterName }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">中心:</div>
            <div class="info_content">
                <input  type = "text" class = "input" name = "user.dept.center.centerName" value = "${requestScope.order.orderMessage1.user.dept.center.centerName }"  readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">部门:</div>
            <div class="info_content">
                <input  type = "text" class = "input" name = "user.dept.deptName" value = "${requestScope.order.orderMessage1.user.dept.deptName }"  readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">被投诉人:</div>
            <div class =  "info_content" >
                <input  type = "text" class = "input" name = "beitousuren" value = "${requestScope.order.orderMessage1.beitousuren }" readonly>
            </div>
        </div>
        <div class = "info_block">
            <div class = "info_title">事件详情:</div>
            <div class =  "info_content" style="height: auto" >
                <textarea  name ="eventDetail" cols="50" rows="7" readonly>${requestScope.order.orderMessage1.eventDetail }</textarea>
            </div>
        </div>
        <hr>
        <c:choose>
            <c:when test="${requestScope.order.status==0 }">
                <div class = "info_block">
                    <div class = "info_title">剩余时间:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage2.timeLimit" value = "${requestScope.order.orderMessage2.timeLimit }小时" readonly>
                    </div>
                </div>
                <form class="form-x"  action="/order/dealTask.action" method="post">
                <div class = "form-group">
                <input type="hidden" name="id" value="${requestScope.order.orderId}">
                <div class = "info_block">
                    <div class = "info_title">处理人:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage2.chuliren" data-validate="required:处理人不能为空">
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">事件结果:</div>
                    <div class =  "info_content" style="height: auto" >
                        <textarea  name ="orderMessage2.result" cols="50" rows="7" data-validate="required:事件结果不能为空"></textarea>
                    </div>
                </div>
                 </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" > 提交</button>
                </div>
                </form>
                <hr>
            </c:when>

            <c:when test="${requestScope.order.status==2 }">

                <div class = "info_block">
                    <div class = "info_title">处理人:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage2.chuliren" value = "${requestScope.order.orderMessage2.chuliren }" readonly>
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">事件结果:</div>
                    <div class =  "info_content" style="height: auto" >
                        <textarea  name ="orderMessage2.result" cols="50" rows="7" readonly>${requestScope.order.orderMessage2.result }</textarea>
                    </div>
                </div>
                <hr>
            <form class="form-x"  action="/order/dealTask.action" method="post">
                <div class = "form-group">
                <input type="hidden" name="id" value="${requestScope.order.orderId}">
                <div class = "info_block">
                    <div class = "info_title">投诉回访确认:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage3.confirm" >
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">问题是否关闭:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage3.isclose" >
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">实际投诉原因的一级分类:</div>
                    <div class =  "info_content" style="height: auto" >
                        <%--<textarea  name ="orderMessage3.realReason1" cols="25" rows="5" ></textarea>--%>
                        <select id = "one" name = "orderMessage3.realReason1" class="cascade_drop_down">
                            <option value ="" selected = "selected" disabled="true">===请选择===</option>
                            <option value ="c_1">服务问题</option>
                            <option value ="c_2">12分问题</option>
                            <option value ="c_3">政策问题</option>
                            <option value ="c_4">产品问题</option>
                            <option value ="c_5">联系不到网络营销顾问分</option>
                            <option value ="c_6">网站问题题</option>
                            <option value ="c_7">退款问题</option>
                            <option value ="c_8">其它</option>
                        </select>
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">实际投诉原因的二级分类:</div>
                    <div class =  "info_content" style="height: auto" >
                        <%--<textarea  name ="orderMessage3.realReason2" cols="25" rows="5"></textarea>--%>
                            <select id="two" name="orderMessage3.realReason2" class="cascade_drop_down">
                            </select>
                    </div>

                </div>
                <div class = "info_block">
                    <div class = "info_title">有理判定:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage3.judge">
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">有理级别:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage3._level">
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">是否重复:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage3.isrepeat" >
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">是否为总部回访:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage3.aBP">
                    </div>
                </div>
                <div class = "info_block">
                    <div class = "info_title">记录人:</div>
                    <div class =  "info_content">
                        <input  type = "text" class = "input" name = "orderMessage3.recordPerson" data-validate="required:记录人不能为空">
                    </div>
                </div>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" > 提交</button>
                </div>
                </form>
            </c:when>

        </c:choose>

    </div>
</div>
</body></html>