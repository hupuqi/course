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
	<form action="teacher/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="teacherId" id="teacherId" value="${pd.teacher_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">教工号:</td>
				<td>
				<c:if test="${empty pd}" >
				<input type="text" name="teacherNo" id="teacherNo" value="${pd.teacher_no}" maxlength="32" placeholder="这里输入教工号" title="教工号"/>
				</c:if>
				<c:if test="${not empty pd}" >
				<input type="hidden" name="teacherNo" id="teacherNo" value="${pd.teacher_no}" maxlength="32" placeholder="这里输入教工号" title="教工号"/>
				${pd.teacher_no}
				</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">就职学校:</td>
				<td><input type="text" name="teacherSchool" id="teacherSchool" value="${pd.teacher_school}" maxlength="32" placeholder="这里输入就职学校" title="就职学校"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">所授专业:</td>
				<td><input type="text" name="teacherMajor" id="teacherMajor" value="${pd.teacher_major}" maxlength="32" placeholder="这里输入所授专业" title="所授专业"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">所属学院:</td>
				<td><input type="text" name="teacherAcademy" id="teacherAcademy" value="${pd.teacher_academy}" maxlength="32" placeholder="这里输入所属学院" title="所属学院"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">教师姓名:</td>
				<td><input type="text" name="teacherName" id="teacherName" value="${pd.teacher_name}" maxlength="32" placeholder="这里输入教师姓名" title="教师姓名"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">教师性别:</td>
				<td>
				<c:if test="${empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="teacherGender" type="radio" value="1" checked><span class="lbl">&nbsp;男</span></label>
					<label style="float:left;padding-left: 50px;"><input name="teacherGender" type="radio" value="0" ><span class="lbl">&nbsp;女</span></label>
				</c:if>
				<c:if test="${not empty pd}">
					<label style="float:left;padding-left: 20px;"><input name="teacherGender" type="radio" value="1"  <c:if test="${pd.teacher_gender==1}">checked</c:if>><span class="lbl">&nbsp;男</span></label>
					<label style="float:left;padding-left: 50px;"><input name="teacherGender" type="radio" value="0" <c:if test="${pd.teacher_gender==0}">checked</c:if>><span class="lbl">&nbsp;女</span></label>
				</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">密码:</td>
				<td><input type="password" name="teacherPassword" id="teacherPassword" value="" maxlength="32" placeholder="这里输入教师账号的密码" title="教师账号的密码"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">教师住址:</td>
				<td><input type="text" name="teacherAddress" id="teacherAddress" value="${pd.teacher_address}" maxlength="32" placeholder="这里输入教师住址" title="教师住址"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">教师联系电话:</td>
				<td><input type="text" name="teacherPhone" id="teacherPhone" value="${pd.teacher_phone}" maxlength="32" placeholder="这里输入教师联系电话" title="教师联系电话"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">教师邮箱:</td>
				<td><input type="text" name="teacherEmail" id="teacherEmail" value="${pd.teacher_email}" maxlength="32" placeholder="这里输入教师邮箱" title="教师邮箱"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">入职日期:</td>
				<td>
				<input class="span10 date-picker" name="teacherEntrydate" id="teacherEntrydate" value="${pd.teacher_entrydate}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="入职日期"/>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">教师出生日期:</td>
				<td>
				<input class="span10 date-picker" name="teacherDatetime" id="teacherDatetime" value="${pd.teacher_datetime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="出生日期"/>
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