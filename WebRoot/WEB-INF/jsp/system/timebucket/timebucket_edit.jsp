<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="timebucket/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="timeId" id="timeId" value="${pd.time_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">时间段id:</td>
				<td><input type="text" name="timeId" id="timeId" value="${pd.time_id}" maxlength="32" placeholder="这里输入时间段id" title="时间段id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">起始周次:</td>
				<td><input type="text" name="timeBeginWeek" id="timeBeginWeek" value="${pd.time_begin_week}" maxlength="32" placeholder="这里输入起始周次" title="起始周次"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">结束周次:</td>
				<td><input type="text" name="timeEndWeek" id="timeEndWeek" value="${pd.time_end_week}" maxlength="32" placeholder="这里输入结束周次" title="结束周次"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">上课时间，周几:</td>
				<td><input type="text" name="timeWeek" id="timeWeek" value="${pd.time_week}" maxlength="32" placeholder="这里输入上课时间，周几" title="上课时间，周几"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">起始上课时间（第几节）:</td>
				<td><input type="text" name="timeBeginSection" id="timeBeginSection" value="${pd.time_begin_section}" maxlength="32" placeholder="这里输入起始上课时间（第几节）" title="起始上课时间（第几节）"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">结束上课时间（第几节）:</td>
				<td><input type="text" name="timeEndSection" id="timeEndSection" value="${pd.time_end_section}" maxlength="32" placeholder="这里输入结束上课时间（第几节）" title="结束上课时间（第几节）"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">任课老师:</td>
				<td><input type="text" name="teacherId" id="teacherId" value="${pd.teacher_id}" maxlength="32" placeholder="这里输入任课老师" title="任课老师"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">教学楼id:</td>
				<td><input type="text" name="teachBuildId" id="teachBuildId" value="${pd.teach_build_id}" maxlength="32" placeholder="这里输入教学楼id" title="教学楼id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">教室id:</td>
				<td><input type="text" name="teachRoomId" id="teachRoomId" value="${pd.teach_room_id}" maxlength="32" placeholder="这里输入教室id" title="教室id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">最大人数:</td>
				<td><input type="text" name="count" id="count" value="${pd.count}" maxlength="32" placeholder="这里输入最大人数" title="最大人数"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input type="text" name="createTime" id="createTime" value="${pd.create_time}" maxlength="32" placeholder="这里输入创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input type="text" name="timeCreatetime" id="timeCreatetime" value="${pd.time_createtime}" maxlength="32" placeholder="这里输入创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>