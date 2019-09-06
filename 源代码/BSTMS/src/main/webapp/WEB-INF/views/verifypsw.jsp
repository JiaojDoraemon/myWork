<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.BSTMS.pojo.*"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>验证密码</title>
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
<script type="text/javascript" src="jquery-3.3.1.js">
<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function getVerify(){
		//获取旧密码，判断是否输入正确，验证密码
		if(document.getElementById("verify").value==document.getElementById("hidepas").value)
			{
			   
				window.location.href="alerpassword";
			}
		else{
			alert("密码不正确,请重新输入");
			window.location.reload(); //刷新页面
			}
		}
</script>
</head>
<body class="text-center">
<div class="container">
	<div class="test">
	<%
	/*获取密码  */
	Account card=(Account)session.getAttribute("account");
	String password=card.getPassword();
	%>
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
      <label class="col-md-3 control-label text-right  h3 font-weight-normal">请输入旧密码：</label>
      <div class="col-md-3">
      <!-- 隐藏获取到的密码 -->
	 <input type="hidden" value="<%=password%>" id="hidepas">
      	<input class="form-control" type="password" id="verify"/>
      </div>
      <div class="col-md-2"></div>
      </div>
     <div class="form-group row" style="height:80px;"></div>
	<div class="form-group row">
      <div class="col-md-2"></div>
      <div class="col-md-2">
      </div>
      <div class="col-md-4"></div>
      <div class="col-md-2">
      <button class="btn btn-lg btn-primary btn-default  btn-lg btn-block" onclick="getVerify()">确认</button>
       </div>
       <div class="col-md-2"></div>
      </div>
  </div>
  </div>
</body>
</html>