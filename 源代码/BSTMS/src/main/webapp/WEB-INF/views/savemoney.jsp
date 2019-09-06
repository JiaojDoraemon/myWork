<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>存款</title>
<style type="text/css">
.test{height:500px; width:750px; border:1px;
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
	//存款
	$("#sure").click(function(){
		if($("#money").val()%100==0)
			{
				alterPassword($("#money").val());
				
			}
		else{
			alert("输入不正确");
			}
		
	});
})
	
	//存款操作
	function alterPassword(obj){	
		var money = new Object();
		money.value= obj;
		$.post({
			url:"saveMoney",
			data:money,
			success:function(data){
				alert("存款成功！！！");
				window.location.reload(); //刷新页面
			}
		})
		
	}
	
	$(function(){
		//退出操作
		$("#back").click(function(){
			
			window.location.href="backmain";
			
		});
	})
</script>
</head>
<body class="text-center">
<div class="container">
	<div class="test">
	<div class="form-group row" style="height:100px;"></div>
	<div class="form-group row">
      <div class="col-md-3"></div>
      <label class="col-md-2 control-label text-right  h3 font-weight-normal"></label>
      <div class="col-md-3">
      </div>
      <div class="col-md-4"></div>
      </div>
      <div class="form-group row">
      <div class="col-md-2"></div>
      <label class="col-md-3 control-label text-right  h3 font-weight-normal">存款金额：</label>
      <div class="col-md-3">
      <input class="form-control" type="text" id="money"/>
      </div>
      <div class="col-md-2"></div>
      </div>
     <div class="form-group row" style="height:80px;"></div>
	<div class="form-group row">
      <div class="col-md-2"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block"  type="button"  id="sure" value="确认"/>
      </div>
      <div class="col-md-4"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block"  type="button" value="返回主页面" id="back"/>
       </div>
       <div class="col-md-2"></div>
      </div>
  </div>
  </div>
</body>
</html>