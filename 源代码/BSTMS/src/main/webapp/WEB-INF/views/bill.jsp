<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>账单查询</title>
<style type="text/css">
.test{height:500px; width:750px; border:1px;
 margin-top:90px !important; margin-left:300px !important;
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
		//返回主页面
		$("#back").click(function(){
			
			window.location.href="backmain";
			
		});
	})
</script><script type="text/javascript" src="/jquery-3.3.1.js"></script>
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
 <div class="test">
      <div class="form-group row" style="height:10px"></div>
       <div class="form-group row">
       <div class="col-md-2"></div>
       <table class="table table-bordered col-md-8">
	<thead>
		<tr>
		<td>交易时间</td>
		<td>交易类型</td>
		<td>交易金额</td>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${showbill}" var="bill"  begin="0" end="9">
		<tr>
		<td>${bill.tradetime}</td>
		<td>${bill.affairtype}</td>	
		<td>${bill.tradebalance}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="col-md-2"></div>
       </div>
        <div class="form-group row" style="height:330px">
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
    </div>
  </body>
</html>