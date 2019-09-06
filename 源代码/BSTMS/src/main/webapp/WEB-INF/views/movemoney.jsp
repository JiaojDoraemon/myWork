<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.BSTMS.pojo.*"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>转账页面未成功</title>
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
<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		//转账
		$("#sure").click(function(){
			if($("#moveid").val()==null && $("#psw").val()==null && $("#psw").val()!=$("#pass").val())
				{
				alert("密码或卡号不正确");
				window.location.reload(); //刷新页面
					
				}
			else{
				if($("#money").val() < $("#oldmoney").val() && $("#money").val()!="0")
					{
					moveMoney($("#money").val());
					}
				else
					{
					alert("金额不正确");
					window.location.reload(); //刷新页面
					}	
				}
			
		});
	})
	
	//转账操作
	function moveMoney(obj){	
		var move = new Object();
		move.value= obj;
		$.post({
			url:"moveMoney",
			data:move,
			success:function(data){
				alert("转账成功！！！");
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
	<div class="test">
	<%
	Account card=(Account)session.getAttribute("account");
	String pass=card.getPassword();
	String oldmoney=card.getAccountbalance();
	float olmoney = Float.parseFloat(oldmoney);
	String limt=card.getCreditlimit();
	float limtmoney = Float.parseFloat(limt)+olmoney;
	String limt1 = String.valueOf(limtmoney);
	%>
	<input type="hidden" value="<%=pass %>" id="pass" />
	<input type="hidden" value="<%=limt1 %>" id="oldmoney" />
	<div class="form-group row" style="height:80px;"></div>
	<div class="form-group row">
      <div class="col-md-3"></div>
      <label class="col-md-2 control-label text-right  h3 font-weight-normal">  转账卡号：</label>
      <div class="col-md-3">
      <input class="form-control" type="text" id="moveid"/>
      </div>
      <div class="col-md-4"></div>
      </div>
      <div class="form-group row">
      <div class="col-md-2"></div>
      <label class="col-md-3 control-label text-right  h3 font-weight-normal">转账金额：</label>
      <div class="col-md-3">
      <input class="form-control" type="text" id="money"/>
      </div>
      <div class="col-md-2"></div>
      </div>
       <div class="form-group row">
      <div class="col-md-2"></div>
      <label class="col-md-3 control-label text-right  h3 font-weight-normal">密码：</label>
      <div class="col-md-3">
      <input class="form-control" type="password" id="psw"/>
      </div>
      <div class="col-md-2"></div>
      </div>
     <div class="form-group row" style="height:50px;"></div>
	<div class="form-group row">
      <div class="col-md-2"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" value="确认" id="sure"/>
      </div>
      <div class="col-md-4"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" value="返回主页面" id="back"/>
       </div>
       <div class="col-md-2"></div>
      </div>
  </div>
  </div>
</body>		
</html>