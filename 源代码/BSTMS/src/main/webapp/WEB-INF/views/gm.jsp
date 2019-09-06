<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.BSTMS.pojo.*" isELIgnored="false"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>存取款</title>
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
		//按钮添加
		$("#gm_bt_h1").click(function(){
			if($("#gm_bt_h1").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h1").val());
				
			}
		else{
			alert("金额不正确");
			}

			
		});
	})
	//取款操作
	function getMoney(obj){	
		var money = new Object();
		money.value= obj;
		$.post({
			url:"getMoney",
			data:money,
			success:function(data){
				alert("操作成功");
			}
		})
	}

	$(function(){
		//取款200
		$("#gm_bt_h2").click(function(){
			if($("#gm_bt_h2").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h2").val());
				
			}
		else{
			alert("金额不正确");
			}

			
		});
	})

	$(function(){
		//取款300
		$("#gm_bt_h3").click(function(){
			if($("#gm_bt_h3").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h3").val());
				
			}
		else{
			alert("金额不正确");
			}

			
		});
	})

	$(function(){
		//取款300
		$("#gm_bt_h4").click(function(){
			if($("#gm_bt_h4").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h4").val());
				
			}
		else{
			alert("金额不正确");
			}

			
		});
	})

	$(function(){
		//取款500
		$("#gm_bt_h5").click(function(){
			if($("#gm_bt_h5").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h5").val());
				
			}
		else{
			alert("金额不正确");
			}

			
		});
	})

	$(function(){
		//取款600
		$("#gm_bt_h6").click(function(){
			if($("#gm_bt_h6").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h6").val());
				
			}
		else{
			alert("金额不正确");
			}

			
		});
	})
	
	$(function(){
		//取款600
		$("#gm_bt_h7").click(function(){
			if($("#gm_bt_h7").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h7").val());
				
			}
		else{
			alert("金额不正确");
			}
			

			
		});
	})
	
	$(function(){
		//取款600
		$("#gm_bt_h8").click(function(){
			if($("#gm_bt_h8").val()<$("#hidemon").val())
			{
				getMoney($("#gm_bt_h8").val());
				
			}
		else{
			alert("金额不正确");
			}

			
		});
	})
	

	$(function(){
		//输入取款金额
		$("#gm_bt_h9").click(function(){
			if($("#into").val()%100==0 && $("#into").val()<$("#hidemon").val())
			{
				getMoney9($("#into").val());
				
			}
		else{
			alert("输入金额不正确");
			window.location.reload(); //刷新页面
			}
		});
	})
	//取款操作
	function getMoney9(obj){	
		var money = new Object();
		money.value= obj;
		$.post({
			url:"getMoney",
			data:money,
			success:function(data){
				alert("操作成功");
				window.location.reload(); //刷新页面
			}
		})
	}

	$(function(){
		//返回主页面操作
		$("#back").click(function(){
			
			window.location.href="backmain";
			
		});
	})
</script>
</head>
<body class="text-center">
<%
	Account card=(Account)session.getAttribute("account");//获取account
	String oldmoney=card.getAccountbalance(); //获取余额
	float olmoney = Float.parseFloat(oldmoney); //余额类型转换
	String limt=card.getCreditlimit(); //获取限额
	float limtmoney = Float.parseFloat(limt)+olmoney; //可取额度
	String limt1 = String.valueOf(limtmoney);
	%>
	<input type="hidden" value="<%=limt1%>" id="hidemon">
 <div class="container">
    <form class="form-signin">
      <div class="form-group row" style="height:80px"></div>
      <div class="form-group row" >
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block"  type="button" id="gm_bt_h1" value="100">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="gm_bt_h2" value="500">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="gm_bt_h3" value="1000">
      </div>
      <div class="col-md-1"></div>
      <div class="col-md-4"> 
      <input class="form-control "  type="text" id="into">
      </div>
      <div class="col-md-1"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="gm_bt_h4" value="2000">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
     <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block"  type="button" id="gm_bt_h5" value="3000">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block"  type="button" id="gm_bt_h6" value="5000">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
     <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block"  type="button" id="gm_bt_h7" value="8000">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block"  type="button" id="gm_bt_h8" value="10000">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="gm_bt_h9" value="确认">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
        <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" value="返回主页面" id="back"/>
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row" style="height:50px"></div>
    </form>
    </div>
</body>
</html>