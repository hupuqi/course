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
	<form action="student/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="studentId" id="studentId" value="${pd.student_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学号:</td>
				<td>
				<c:if test="${empty pd}" >
				<input type="text" name="studentNo" id="studentNo" value="${pd.student_no}" maxlength="32" placeholder="这里输入学号" title="学号"/>
				</c:if>
				<c:if test="${not empty pd}" >
				<input type="hidden" name="studentNo" id="studentNo" value="${pd.student_no}" maxlength="32" placeholder="这里输入学号" title="学号"/>
				${pd.student_no}
				</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生姓名:</td>
				<td><input type="text" name="studentName" id="studentName" value="${pd.student_name}" maxlength="32" placeholder="这里输入学生姓名" title="学生姓名"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生账号的密码:</td>
				<td><input type="password" name="studentPassword" id="studentPassword" value="" maxlength="32" placeholder="这里输入学生账号的密码" title="学生账号的密码"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生所属班级:</td>
				<td><input type="text" name="studentClass" id="studentClass" value="${pd.student_class}" maxlength="32" placeholder="这里输入学生所属班级" title="学生所属班级"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生就读专业:</td>
				<td><input type="text" name="studentMajor" id="studentMajor" value="${pd.student_major}" maxlength="32" placeholder="这里输入学生就读专业" title="学生就读专业"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生所属学院:</td>
				<td><input type="text" name="studentAcademy" id="studentAcademy" value="${pd.student_academy}" maxlength="32" placeholder="这里输入学生所属学院" title="学生所属学院"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生所属学校:</td>
				<td><input type="text" name="studentSchool" id="studentSchool" value="${pd.student_school}" maxlength="32" placeholder="这里输入学生所属学校" title="学生所属学校"/></td>
			</tr>
			
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生性别0女1男:</td>
				<td>
				<c:if test="${empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="studentGender" type="radio" value="1" checked><span class="lbl">&nbsp;男</span></label>
					<label style="float:left;padding-left: 50px;"><input name="studentGender" type="radio" value="0" ><span class="lbl">&nbsp;女</span></label>
				</c:if>
				<c:if test="${not empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="studentGender" type="radio" value="1"  <c:if test="${pd.student_gender==1}">checked</c:if>><span class="lbl">&nbsp;男</span></label>
					<label style="float:left;padding-left: 50px;"><input name="studentGender" type="radio" value="0" <c:if test="${pd.student_gender==0}">checked</c:if>><span class="lbl">&nbsp;女</span></label>
				</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生出生日期:</td>
				<td>
				<input class="span10 date-picker" name="studentDatetime" id="studentDatetime" value="${pd.student_datetime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="出生日期"/>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生电话:</td>
				<td><input type="number" name="studentPhone" id="studentPhone" value="${pd.student_phone}" maxlength="32" placeholder="这里输入学生电话" title="学生电话"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生邮箱:</td>
				<td><input type="text" name="studentEmail" id="studentEmail" value="${pd.student_email}" maxlength="32" placeholder="这里输入学生邮箱" title="学生邮箱"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">学生家庭地址:</td>
				<td><input type="text" name="studentAddress" id="studentAddress" value="${pd.student_address}" maxlength="32" placeholder="这里输入学生家庭地址" title="学生家庭地址"/></td>
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