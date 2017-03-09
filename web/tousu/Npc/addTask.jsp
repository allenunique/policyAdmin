<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>发布任务</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){

        $(".cascade_drop_down").change(
                function () {
                  var name = $(this).attr("name") + "_next";
                  var next = $("#" + name).val();

                  if (next == null || next == '') {
                    return;
                  }

                  $("#" + next).empty();
                  $.ajax({
                    type:'post',
                    url:'../config/' + $(this).val() + '.txt',
                    data:'name=' + name + '&val=' + $(this).val(),
                    dataType:'text',

                    success:function(msg){
                      ops = msg.split("\n");
                      for (i = 0; i < ops.length; i++) {
                        $("#" + next).append(ops[i]);
                      }
                    },
                    error:function(){
                      alert("请选择.");
                    }
                  });
                });

      });

    </script>
    <script type="text/javascript">
	function check(){
	var timeAll = document.getElementById('timeAll').value;
	   if(timeAll==""){
	          alert('回复时限不能为空');
	       return false;
	        }else{
	      return true;
	      }
		}
	</script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 任务信息</strong></div>
    <div class="body-content">
        <c:choose>
            <c:when test="${not empty requestScope.order }">
                <form method="post" class="form-x" action="${pageContext.request.contextPath }/NpcOrder/insertOrder.action">

                    <div class = "form-group">
                        <div class = "info_block">
                            <div class = "info_title">受理时间:</div>
                            <div class =  "info_content" >
                                <%
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                    String date = sdf.format(new Date());
                                %>
                                <input  type = "text" class = "input" name = "createOrderTime"  value = "<%=date%>">
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
                            <div class = "info_title">回复时限:</div>
                            <div class =  "info_content" >
                                <input  type = "text" class = "input" name = "timeAll" id = "timeAll" value = "24">
                            </div>
                        </div>
                        <hr>
                        <div class = "info_block">
                            <div class = "info_title">事件详情:</div>
                            <div class =  "info_content" style="height: auto" >
                                <textarea  name ="eventDetail" cols="50" rows="7">${requestScope.order.orderMessage1.eventDetail }</textarea>
                            </div>
                        </div>

                    </div>
                    <div class="field">
                        <button class="button bg-main icon-check-square-o" type="submit"  onclick=" return check()"> 提交</button>
                    </div>

                </form>
            </c:when>

            <c:otherwise>
                <form method="post" class="form-x" action="${pageContext.request.contextPath }/NpcOrder/insertOrder.action">

                    <div class = "form-group">
                        <div class = "info_block">
                            <div class = "info_title">受理时间:</div>
                            <div class =  "info_content" >
                                <%
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                    String date = sdf.format(new Date());
                                %>
                                <input  type = "text" class = "input" name = "createOrderTime"  value = "<%= date %>">
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">流转渠道:</div>
                            <div class = "info_content" >
                                <select class="select" name = "orderFrom">
                                    <option value ="回声系统">回声系统</option>
                                    <option value ="公司热线">公司热线</option>
                                    <option value="内部反馈">内部反馈</option>
                                </select>
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">流转类别:</div>
                            <div class = "info_content">
                                <select class="select" name = "orderType">
                                    <option value ="投诉">投诉</option>
                                    <option value ="咨询">咨询</option>
                                </select>
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">高危选项:</div>
                            <div class = "info_content" >
                                <select class="select" name = "danger">
                                    <option value ="是">是</option>
                                    <option value ="否">否</option>
                                    <option value ="媒体选项及其他">媒体选项及其他</option>
                                </select>
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">一级分类:</div>
                            <div class = "info_content" >
                                <!-- <select class="select" name = "yijifenlei">
                                   <option value ="产品问题">产品问题</option>
                                   <option value ="政策问题">政策问题</option>
                                   <option value ="保障计划">保障计划</option>
                                   <option value ="财务问题">财务问题</option>
                                   <option value ="疑似12分">疑似12分</option>
                                   <option value ="12分问题">12分问题</option>
                                   <option value ="服务问题">服务问题</option>
                                 </select>
                                 -->
                                <input type="hidden" id="classify_onet_next" name="one_next" value="two">
                                <select id = "one" name = "classify_onet" class="cascade_drop_down" required>
                                    <option value ="" selected = "selected" disabled="true">===请选择===</option>
                                    <option value ="s_1">产品问题</option>
                                    <option value ="s_2">政策问题</option>
                                    <option value ="s_3">保障计划</option>
                                    <option value ="s_4">财务问题</option>
                                    <option value ="s_5">疑似12分</option>
                                    <option value ="s_6">12分问题</option>
                                    <option value ="s_7">服务问题</option>
                                </select>
                            </div>
                        </div>

                        <div class = "info_block">
                            <div class = "info_title">二级分类:</div>
                            <div class =  "info_content" >
                                <!-- <input  type = "text" class = "input" name ="erjifenlei" > -->
                                <input type="hidden" id="classify_twot_next" name="two_next" value="three">
                                <select id="two" name="classify_twot" class="cascade_drop_down" required>
                                </select>
                            </div>
                        </div>

                        <div class = "info_block">
                            <div class = "info_title">三级分类:</div>
                            <div class =  "info_content" >
                                <!-- <input  type = "text" class = "input" name = "sanjifenlei" > -->
                                <select id="three" name="classify_three" class="cascade_drop_down" required>
                                </select>
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">客户用户名:</div>
                            <div class =  "info_content" >
                                <input  type = "text" class = "input" name = "userName" data-validate="required:客户用户名不能为空">
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">投诉人:</div>
                            <div class =  "info_content" >
                                <input  type = "text" class = "input" name = "tousuren" data-validate="required:投诉人不能为空">
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">联系方式:</div>
                            <div class =  "info_content" >
                                <input  type = "text" class = "input" name = "contact" data-validate="required:联系方式不能为空">
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">父用户:</div>
                            <div class =  "info_content">
                                <input  type = "text" class = "input" name = "fatherUser">
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">首次联系情况:</div>
                            <div class =  "info_content" >
                                <input  type = "text" class = "input" name = "firstContact">
                            </div>
                        </div>

                        <div class = "info_block">
                            <div class = "info_title">大中心:</div>
                            <div class="info_content">
                                <input type="hidden" id="dazhongxin_next" name="dazhongxin_next" value="zhongxin">

                                <select  id="dazhongxin" name="dazhongxin" class="cascade_drop_down" required>
                                    <option value =""  selected = "selected" disabled="true">===请选择===</option>
                                    <option value ="kefu">客服中心</option>
                                    <option value ="shangwuzhongxin">商务中心</option>
                                    <option value ="qudao">渠道</option>
                                    <option value ="qita">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">中心:</div>
                            <div class="info_content">
                                <input type="hidden" id="zhongxin_next" name="zhongxin_next" value="bumen">
                                <select id="zhongxin" name="zhongxin" class="cascade_drop_down" required>
                                </select>
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">部门:</div>
                            <div class="info_content">
                                <select  class =  "select" id="bumen" name="user.dept.deptName" class="cascade_drop_down" required>
                                </select>
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">被投诉人:</div>
                            <div class =  "info_content" >
                                <input  type = "text" class = "input" name = "beitousuren" data-validate="required:被投诉人不能为空">
                            </div>
                        </div>
                        <div class = "info_block">
                            <div class = "info_title">回复时限:</div>
                            <div class =  "info_content" >
                                <input  type = "text" class = "input" name = "timeAll" id = "timeAll" value = "24">
                            </div>
                        </div>
                        <hr>
                        <div class = "info_block">
                            <div class = "info_title">事件详情:</div>
                            <div class =  "info_content" style="height: auto" >
                                <textarea  name ="eventDetail" cols="50" rows="10" ></textarea>
                            </div>
                        </div>

                    </div>


                    <div class="field">
                        <button class="button bg-main icon-check-square-o" type="submit" onclick=" return check()"> 提交</button>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>

    </div>
</div>
</body>
</html>