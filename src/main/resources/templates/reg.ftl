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
		layer.alert('用户名已存在，请重新填写', {icon: 2}); 
	  <#elseif msg?? && msg == '1'>
		layer.alert('邮件已存在，请重新填写', {icon: 2}); 
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
			<p class="login-box-msg">注册新用户</p>
			<div class="login-reg">
				<a href="/login">使用已有账号登陆？</a>
			</div>
			<form method="post" id="loginForm" action="/reg"
				class="loginFormWrapper layui-form">
				<#if referer??>
				<input type="hidden"  lay-verType="tips"  name="referer" value="${referer!''}"/>
				</#if>
        <div class="form-group has-feedback layui-form-item">
					<span class="layui-icon form-control-feedback">&#xe612;</span>
					<input type="input"  lay-verType="tips"  name="username" id="username"  lay-verify="required"   maxlength="50" class="form-control required" placeholder="用户名">                        
				</div>
				<div class="form-group has-feedback layui-form-item">
					<span class="kfont form-control-feedback">&#xe61c;</span>
					<input type="email"  lay-verType="tips"  name="email" id="email" maxlength="50"  lay-verify="required|email"  class="form-control required" placeholder="电子邮箱">                        
				</div>
				<div class="form-group has-feedback layui-form-item">
					<span class="kfont form-control-feedback">&#xe613;</span>
					<input type="text"  lay-verType="tips"  name="mobile" id="mobile" maxlength="20" lay-verify="required|phone"  class="form-control isMobile" placeholder="手机号">                        
				</div>
				<div class="form-group has-feedback layui-form-item">
					<span class="kfont form-control-feedback icon-password"></span>
					<input type="password"  lay-verType="tips"  name="password" id="password"  lay-verify="required|passwd"  class="form-control required" maxlength="20" minlenght="8" placeholder="密码">                        
				</div>
				<div class="form-group has-feedback layui-form-item">
					<span class="kfont form-control-feedback icon-password"></span>
					<input type="password"  lay-verType="tips"  name="repassword" id="repassword"  lay-verify="required|confirmpasswd" maxlength="20" minlength="8" class="form-control required" placeholder="确认密码">                        
				</div>
				
				<div class="row" style="margin-top:40px;">
					
					<!-- /.col -->
					<div class="col-xs-12">
						<button class="btn btn-block btn-primary btn-lg" lay-submit>注册新用户</button>
					</div>
					<!-- /.col -->
				</div>

			</form>
		</div>
		<!-- /.login-box-body -->
	</div>
	<script>
      layui.use(['laydate','form','jquery'], function () {
        layui.form.render();
        layui.form.verify({
            passwd : function(value, item){
                if(value.length < 8){
                    return "密码长度不能小于8位";
                }
            },
            confirmpasswd : function(value, item){
                if(layui.$("#password").val()!==value){
                    return "两次输入密码不一致，请重新输入！";
                }
            }
        })

      });
	</script>
</body>

</html>