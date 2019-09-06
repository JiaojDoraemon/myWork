<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.BSTMS.pojo.*"%>
<!DOCTYPE html >
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>余额</title>
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
    <%
	Account card=(Account)session.getAttribute("account");
	String balance=card.getAccountbalance();
	String lim=card.getCreditlimit(); 
	%>
      <div class="form-group row" style="height:80px"></div>
       <div class="form-group row"></div>
        <div class="form-group row">
        <div class="col-md-2" style="width:200px" ></div>
		<label class="col-md-3 control-label text-right  h3 font-weight-normal">余额：</label>
        <div class="col-md-3 text-left h3 font-weight-normal">
     	 ￥<%=balance %>
      </div>
        <div class="col-md-2"></div>
        <div class="col-md-2"></div>
       </div>
       <div class="form-group row">
        <div class="col-md-2 " style="width:200px"></div>
		<label class="col-md-3 control-label text-right  h3 font-weight-normal">信用额度：</label>
        <div class="col-md-3 text-left h3 font-weight-normal">
      	￥<%=lim %>
      </div>
        <div class="col-md-2"></div>
        <div class="col-md-2"></div>
       </div>
        <div class="form-group row" style="height:80px">
       </div>
        <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="back" value="返回主页面"/>
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row" style="height:50px"></div>
    </form>
    </div>
</body>
</html>