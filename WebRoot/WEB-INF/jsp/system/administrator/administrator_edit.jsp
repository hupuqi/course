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
	<form action="administrator/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="administratorId" id="administratorId" value="${pd.administrator_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:130px;text-align: right;padding-top: 13px;">管理员账号:</td>
				<td>
				<c:if test="${empty pd}" >
				<input type="text" name="administratorNo" id="administratorNo" value="${pd.administrator_no}" maxlength="32" placeholder="这里输入管理员账号" title="管理员账号"/>
				</c:if>
				<c:if test="${not empty pd}" >
				<input type="hidden" name="administratorNo" id="administratorNo" value="${pd.administrator_no}" maxlength="32" placeholder="这里输入管理员账号" title="管理员账号"/>
				${pd.administrator_no}
				</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:130px;text-align: right;padding-top: 13px;">管理员姓名:</td>
				<td><input type="text" name="administratorName" id="administratorName" value="${pd.administrator_name}" maxlength="32" placeholder="这里输入管理员姓名" title="管理员姓名"/></td>
			</tr>
			<tr>
				<td style="width:130px;text-align: right;padding-top: 13px;">密码:</td>
				<td><input type="password" name="administratorPassword" id="administratorPassword" value="" maxlength="32" placeholder="这里输入密码" title="管路员密码"/></td>
			</tr>
			<tr>
				<td style="width:130px;text-align: right;padding-top: 13px;">管理员联系电话:</td>
				<td><input type="text" name="administratorPhone" id="administratorPhone" value="${pd.administrator_phone}" maxlength="32" placeholder="这里输入管理员联系电话" title="管理员联系电话"/></td>
			</tr>
			<tr>
				<td style="width:130px;text-align: right;padding-top: 13px;">管理员邮箱:</td>
				<td><input type="text" name="administratorEmail" id="administratorEmail" value="${pd.administrator_email}" maxlength="32" placeholder="这里输入管理员邮箱" title="管理员邮箱"/></td>
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