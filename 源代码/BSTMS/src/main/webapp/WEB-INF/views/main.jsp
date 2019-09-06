<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.BSTMS.pojo.Account" isELIgnored="false"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	//余额查询
	$(function(){
		//按钮添加时间
		$("#main_bt_ba").click(function(){
			getBalanceMoney();
		});
	})
	//余额操作
	function getBalanceMoney(){
		window.location.href="getBalanceMoney";
	}

	//账单查询
	$(function(){
		//按钮添加时间
		$("#main_bt_bill").click(function(){
			getBill();
		});
	})
	//账单操作
	function getBill(){
		window.location.href="getBill";
	}

	//修改密码
	$(function(){
		//按钮添加时间
		$("#main_bt_upsw").click(function(){
			getAlterPassword();
		});
	})
	//修改密码操作
	function getAlterPassword(){
		window.location.href="oldalerpassword";
	}

	//存款
	$(function(){
		//按钮添加时间
		$("#main_bt_intom").click(function(){
			saveMoney();
		});
	})
	//存款操作
	function saveMoney(){
		window.location.href="savem";
	}
	
	//取款
	$(function(){
		//按钮添加时间
		$("#main_bt_gm").click(function(){
			getMoney();
		});
	})
	//取款操作
	function getMoney(){
		window.location.href="getm";
	}

	//转账
	$(function(){
		//按钮添加时间
		$("#main_bt_tm").click(function(){
			moveMoney();
		});
	})
	//转账操作
	function moveMoney(){
		window.location.href="movem";
	}

	//汇率
	$(function(){
		//按钮添加时间
		$("#main_bt_rate").click(function(){
			exchangeMoney();
		});
	})
	//汇率操作
	function exchangeMoney(){
		window.location.href="rate";
	}

	//退出
	$(function(){
		//按钮添加时间
		$("#main_bt_out").click(function(){
			outMain();
		});
	})
	//退出操作
	function outMain(){
		window.location.href="/";
	}

	
</script>
</head>
<body class="text-center">
<div class="container">
 <form class="form-signin">
	<%-- <%
	Account card=(Account)session.getAttribute("account");
	String cardid=card.getCardid();
	%>
	<%=cardid %> --%>
	<div class="form-group row" style="height:100px"></div>
	<div class="form-group row" >
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_ba" value="余额">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_bill" value="账单">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_upsw" value="修改密码">
      </div>
      <div class="col-md-1"></div>
      <div class="col-md-4"> 
      </div>
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_intom" value="存款">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_gm" value="取款">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
     <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_tm" value="转账">
       </div>
       <div class="col-md-1"></div>
       </div>
	   <div class="form-group row" style="height:50px"></div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
     <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_out" value="退出">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row" style="height:50px"></div>
  <!-- <input type="button" id="main_bt_rate" value="汇率"> -->
  </form>
  </div>
</body>
</html>