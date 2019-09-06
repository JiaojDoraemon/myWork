<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>开户页面未成功</title>
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
select{
	margin-top:10px !important;
	}
.h4{
	margin-top:15px !important;
	}

	
</style>
<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="jquery-3.3.1.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	//返回登录页面
	$("#back").click(function(){		
		window.location.href="/";
		
	});
})
</script>
</head>
<body class="text-center">
<div class="container">
<form class="form-signin" method="post" action="getUser">
<div class="form-group row" style="height:50px"></div>
<div class="form-group row">
      <label class="col-md-2 control-label text-right  h4 font-weight-normal">卡号：</label>
      <div class="col-md-3">
     <input class="form-control" type="text" name="cardid" value="<%=session.getAttribute("cardid") %>" readonly/>
     </div>
     <label class="col-md-2 control-label text-right  h4 font-weight-normal">电话：</label>
      <div class="col-md-3">
      <input class="form-control" type="text" name="phone"/>
      </div>
      <div class="col-md-1>"></div>
      </div>
       <div class="form-group row">
      <label class="col-md-2 control-label text-right  h4 font-weight-normal">密码：</label>
      <div class="col-md-3">
      <input class="form-control" type="password" name="psw" data-options="required:true, missingMessage:'请填写密码'"/>
      </div>
       <div class="col-md-1>"></div>
     <label class="col-md-2 control-label text-right  h4 font-weight-normal">地址：</label>
      <div class="col-md-3">
      <input class="form-control" type="text" name="addr"/>
      </div>
      <div class="col-md-1>"></div>
      </div>
       <div class="form-group row">
      <label class="col-md-2 control-label text-right  h4 font-weight-normal"> 重复密码：</label>
      <div class="col-md-3">
     <input class="form-control" type="password" name="rpsw"/>
      </div>
       <div class="col-md-1>"></div>
     <label class="col-md-2 control-label text-right  h4 font-weight-normal">卡类型：</label>
      <div class="col-md-3">
	<select class="form-control" name="type">
		<option value="信用卡" selected>信用卡</option>
		<option value="借记卡">借记卡</option>
	</select>
      </div>
      <div class="col-md-1>"></div>
      </div>
       <div class="form-group row">
      <label class="col-md-2 control-label text-right  h4 font-weight-normal">姓名：</label>
      <div class="col-md-3">
    <input class="form-control "  type="text" name="name"/>
      </div>
       <div class="col-md-1>"></div>
     <label class="col-md-2 control-label text-right  h4 font-weight-normal">信用额度：</label>
      <div class="col-md-3">
      <input class="form-control " type="text" name="limt"/>
      </div>
      <div class="col-md-1>"></div>
      </div>
       <div class="form-group row">
      <label class="col-md-2 control-label text-right  h4 font-weight-normal">身份证：</label>
      <div class="col-md-3">
      <input class="form-control" type="text" name="id"/>
      </div>
       <div class="col-md-1>"></div>
     <label class="col-md-2 control-label text-right  h4 font-weight-normal">有效期：</label>
      <div class="col-md-3">
      <input class="form-control" type="text" name="litime" placeholder="请输入年数" />
      </div>
      <div class="col-md-1>"></div>
      </div>
      <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-3">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="submit" name="sure" value="确认"/>
      </div>
      <div class="col-md-4"></div>
      <div class="col-md-3">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="back" value="退出"/>
       </div>
       <div class="col-md-1"></div>
       </div>

</form>
</div>
</body>
</html>