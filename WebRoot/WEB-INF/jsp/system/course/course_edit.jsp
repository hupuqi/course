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
	<form action="course/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="courseId" id="courseId" value="${pd.course_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">课程学分:</td>
				<td><input type="number" name="courseCredit" id="courseCredit" value="${pd.course_credit}" maxlength="32" placeholder="这里输入课程学分" title="课程学分"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">课程名称:</td>
				<td><input type="text" name="courseName" id="courseName" value="${pd.course_name}" maxlength="32" placeholder="这里输入课程名称" title="课程名称"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">是否有教科书:</td>
				<td>
				<c:if test="${empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="courseBook" type="radio" value="1" checked><span class="lbl">&nbsp;有</span></label>
					<label style="float:left;padding-left: 50px;"><input name="courseBook" type="radio" value="0" ><span class="lbl">&nbsp;没有</span></label>
				</c:if>
				<c:if test="${not empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="courseBook" type="radio" value="1"  <c:if test="${pd.course_book==1}">checked</c:if>><span class="lbl">&nbsp;有</span></label>
					<label style="float:left;padding-left: 50px;"><input name="courseBook" type="radio" value="0" <c:if test="${pd.course_book==0}">checked</c:if>><span class="lbl">&nbsp;没有</span></label>
				</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">课程类型:</td>
				<td>
				<c:if test="${empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="courseType" type="radio" value="0" checked><span class="lbl">&nbsp;选修</span></label>
					<label style="float:left;padding-left: 50px;"><input name="courseType" type="radio" value="1" ><span class="lbl">&nbsp;必修</span></label>
				</c:if>
				<c:if test="${not empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="courseType" type="radio" value="0"  <c:if test="${pd.course_type==0}">checked</c:if>><span class="lbl">&nbsp;选修</span></label>
					<label style="float:left;padding-left: 50px;"><input name="courseType" type="radio" value="1" <c:if test="${pd.course_type==1}">checked</c:if>><span class="lbl">&nbsp;必修</span></label>
				</c:if>
				</td>
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