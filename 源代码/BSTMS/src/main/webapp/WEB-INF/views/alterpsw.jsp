<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.BSTMS.pojo.*"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>修改密码未成功</title>
<style type="text/css">
form{height:500px; width:750px; border:1px;
 margin-top:90px !important; margin-left:220px !important;
 background-color:#fff;opacity:0.8}
button{margin:50px auto !important}
input{margin-top:10px !important;padding-left:20px !important;}
body{ height:100%;
      background:url(../../image/test2.jpg) center no-repeat;
      background-size:100%;}
.row{height:50px;display:flex;} 
[class*="col-"] {
    padding: 0 !important;
    margin:0 !important;
}

.h3{
	margin-top:15px !important;
	}
	
</style>
<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="jquery-3.3.1.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		//获取修改密码，判断是否为空，两次输入是否正确
		$("#alter").click(function(){
			if($("#alterpsw").val()!=null && $("#confirm").val()!=null && $("#alterpsw").val()==$("#confirm").val())
				{
					alterPassword($("#alterpsw").val());
					
				}
			else{
				alert("密码不正确");
				}
			
		});
	})
	
	//取款操作
	function alterPassword(obj){	
		var alter = new Object();
		alter.value= obj;
		$.post({
			url:"getAlterpassword",
			data:alter,
			success:function(data){
				alert("修改成功！！！");
				window.location.reload(); //刷新页面
			}
		})
		
	}
	
	$(function(){
		//返回主页面
		$("#back").click(function(){
			
			window.location.href="backmain";
			
		});
	})
</script>
</head>
<body class="text-center">
<div class="container">
	<form class="form-signin">
	<div class="form-group row" style="height:100px;"></div>
	<div class="form-group row">
      <div class="col-md-2"></div>
      <label class="col-md-3 control-label text-right  h3 font-weight-normal">请输入密码：</label>
      <div class="col-md-3">
      <input class="form-control" type="password" id="alterpsw" />
      </div>
      <div class="col-md-4"></div>
      </div>
      <div class="form-group row">
      <div class="col-md-2"></div>
      <label class="col-md-3 control-label text-right  h3 font-weight-normal">请次确认密码：</label>
      <div class="col-md-3">
      <input class="form-control" type="password" id="confirm"/>
      </div>
      <div class="col-md-2"></div>
      </div>
     <div class="form-group row" style="height:80px;"></div>
	<div class="form-group row">
      <div class="col-md-2"></div>
      <div class="col-md-2">
     <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="alter" value="确认"/>
      </div>
      <div class="col-md-4"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="back" value="返回主页面"/>
       </div>
       <div class="col-md-2"></div>
      </div>
  </form>
  </div>
</body>
</html>