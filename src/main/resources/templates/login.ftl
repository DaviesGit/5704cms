<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, initial-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
	<title>5704工作室</title>
	<meta name="referrer" content="no-referrer" />
  	<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico?t=${.now?long}"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<meta name="keywords" content="5704,工作室,管理平台">
  	<meta name="description" content="5704工作室是一个人才培养的地方">
<link rel="stylesheet" href="/css/layui.css">
<link rel="stylesheet" href="/css/login.css">
<script src="/layui.js"></script>
<script src="/js/helper.js"></script>
<script language="javascript">
	if((window.frameElement && window.frameElement.id || '') != ""){
		top.location.href = "/login" ;
	}
	layui.use('layer', function(){
	  var layer = layui.layer;
	  <#if msg?? && msg == '0'>
		layer.alert('用户名或密码错误，请重新填写', {icon: 2});
	  <#elseif msg?? && msg == '1'>
		layer.alert('用户注册成功，请使用用户名和密码登陆', {icon: 1}); 
	  </#if>
	}); 
	layui.use('form', function(){
	  var form = layui.form;
	});
</script>
</head>

<body>
	<div class="login-box">
		<div class="login-logo">
			<a> <img src="/images/logo.png" style="height:60px;">
			</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">账号密码登陆</p>
			<div class="login-reg">
				<a href="/reg">注册新用户</a>
			</div>
			<form method="post" id="loginForm" action="/login"
				class="loginFormWrapper">
				<#if referer??>
				<input type="hidden" name="referer" value="${referer!''}"/>
				</#if>
				<div class="form-group has-feedback">
					<span class="layui-icon form-control-feedback">&#xe612;</span> 
					<input name="username" id="username"
						class="form-control required" required lay-verify="required"   placeholder="用户名/邮件/手机号" autofocus>
				</div>
				<div class="form-group has-feedback" style="margin-bottom:10px;">
					<span class="kfont form-control-feedback icon-password"></span>
					<input type="password" name="password"
						class="form-control required" required lay-verify="required"   placeholder="密码">
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="checkbox">
							<label> <input type="checkbox" name="sla" value="1"
								checked="checked">七天内自动登录
							</label>
						</div>
					</div>
					<!--
						<div class="col-md-6" style="text-align:right;">
							<div class="checkbox">
								<a href="/user/forget">忘记密码？</a>	
							</div>
						</div>
						-->
				</div>

				<div class="row" style="margin-bottom:20px;">
					<div class="col-md-6"></div>
				</div>
				<div class="row">

					<!-- /.col -->
					<div class="col-xs-12">
						<button class="btn btn-block btn-primary btn-lg">立即登陆</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<div class="social-auth-links text-center">
				<div class="networks"></div>
			</div>
		</div>
		<!-- /.login-box-body -->
	</div>
</body>

</html>