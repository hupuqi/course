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
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<style type="text/css">
		#dialog-add,#dialog-message,#dialog-comment{width:100%; height:100%; position:fixed; top:0px; z-index:10000; display:none;}
		.commitopacity{position:absolute; width:100%; height:500px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
		.commitbox{width:79%; padding-left:81px; padding-top:69px; position:absolute; top:0px; z-index:99999;}
		.commitbox_inner{width:96%; height:235px;  margin:6px auto; background:#efefef; border-radius:5px;}
		.commitbox_top{width:100%; height:230px; margin-bottom:10px; padding-top:10px; background:#FFF; border-radius:5px; box-shadow:1px 1px 3px #e8e8e8;}
		.commitbox_top textarea{width:95%; height:165px; display:block; margin:0px auto; border:0px;}
		.commitbox_cen{width:95%; height:40px; padding-top:10px;}
		.commitbox_cen div.left{float:left;background-size:15px; background-position:0px 3px; padding-left:18px; color:#f77500; font-size:16px; line-height:27px;}
		.commitbox_cen div.left img{width:30px;}
		.commitbox_cen div.right{float:right; margin-top:7px;}
		.commitbox_cen div.right span{cursor:pointer;}
		.commitbox_cen div.right span.save{border:solid 1px #c7c7c7; background:#6FB3E0; border-radius:3px; color:#FFF; padding:5px 10px;}
		.commitbox_cen div.right span.quxiao{border:solid 1px #f77400; background:#f77400; border-radius:3px; color:#FFF; padding:4px 9px;}
		</style>
		
	</head>
	<script type="application/javascript">

		function createAll(){
		$("#FormAll").submit();
		$("#productcAll").tips({
		     side:3,
		     msg:'提交成功,等待下载',
		     bg:'#AE81FF',
		     time:9
		});
		}

	
		function searchTableByName() {
			var tableName=$("#tabletop").val();
			if(tableName.length==0){
			    return;
			}
            $.ajax({
                type: "POST",
                url: '<%=basePath%>head/searchTableByName.do',
                data: {tableName:tableName},
                dataType:'json',
                cache: false,
                success: function(data){
                    if(data.length==0){
                        return;
					}
                    $("#zindex").val(data.length);
                    $("#fields").html("");
					for(var i=0;i<data.length;i++){
                        $("#fields").append(
                            '<tr>'+
                            '<td class="center">'+data[i].paramName+'<input type="hidden" name="column_name'+i+'" value="'+data[i].column_name+'"><input type="hidden" name="column_key'+i+'" value="'+data[i].column_key+'"><input type="hidden" name="paramName'+i+'" value="'+data[i].paramName+'"></td>'+
                            '<td class="center">'+data[i].data_type+'<input type="hidden" name="data_type'+i+'" value="'+data[i].data_type+'"></td>'+
                            '<td class="center">'+data[i].type+'<input type="hidden" name="type'+i+'" value="'+data[i].type+'"></td>'+
                            '<td class="center">'+data[i].column_comment+'<input type="hidden" name="column_comment'+i+'" value="'+data[i].column_comment+'"></td>'+
                            '</tr>'
                        ); 
					}
                }
            });
        }
	</script>
<body>
		
	<!-- 添加属性  -->
	<input type="hidden" name="hcdname" id="hcdname" value="" />
	<input type="hidden" name="msgIndex" id="msgIndex" value="" />
	<input type="hidden" name="dtype" id="dtype" value="String" />
	<input type="hidden" name="isQian" id="isQian" value="是" />
	<form action="createCode/proCodeAll.do" name="FormAll" id="FormAll" method="post"></form>

	<form action="createCode/proCode.do" name="Form" id="Form" method="post">
		<input type="hidden" name="zindex" id="zindex" value="0">
		<div id="zhongxin">
		<table style="margin-top: 10px;" border="0">
			<tr>
				<td style="width:76px;text-align: right;">上级包名：</td>
				<td colspan="1"><input type="text" name="packageName" id="packageName" value="" placeholder="这里输入包名  (请不要输入特殊字符,请用纯字母)" style="width:370px" title="包名称"/></td>
				<td>&nbsp;&nbsp;例如:com.fh.controller.<font color="red" style="font-weight: bold;">system</font>&nbsp;&nbsp;红色部分</td>
			</tr>
		</table>
		<table border="0">
			<tr>
				<td style="width:76px;text-align: right;">处理类名：</td>
				<td><input type="text" name="objectName" id="objectName" value="" placeholder="这里输入处理类名称" style="width:200px" title="类名称"/></td>
				<td>&nbsp;&nbsp;<font color="red" style="font-weight: bold;">类名首字母必须为大写字母或下划线</font></td>
				<td style="width:76px;text-align: right;">表名：</td>
				<td><input type="text" name="tabletop" id="tabletop" value="" placeholder="这里输入表名" style="width:60px" title="表前缀"/></td>
				<td><input type="button" value="查询" onclick="searchTableByName()"></td>
			</tr>
		</table>
		
		
		<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">属性名</th>
						<th class="center">类型</th>
						<th class="center">实体属性</th>
						<th class="center">备注</th>
					</tr>
				</thead>
										
				<tbody id="fields"></tbody>
				
		</table>
		
		
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="text-align: center;" colspan="100">
					<a class="btn btn-app btn-success btn-mini" onclick="createAll();" id="productcAll"><i class="icon-ok"></i>生成所有</a>
					<a class="btn btn-app btn-success btn-mini" onclick="save();" id="productc"><i class="icon-print"></i>生成</a>
					<a class="btn btn-app btn-danger btn-mini" onclick="top.Dialog.close();"><i class="icon-share-alt"></i>取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script src="static/js/myjs/productCode.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		</script>
	
</body>
</html>