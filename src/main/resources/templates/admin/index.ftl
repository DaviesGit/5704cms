<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, initial-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<title>5704工作室</title>
	<meta name="referrer" content="no-referrer" />
	<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico?t=${.now?long}"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="keywords" content="5704,工作室,管理平台">
	<meta name="description" content="5704工作室是一个人才培养的地方">

<link rel="stylesheet" href="/css/flexboxgrid.min.css">
<link rel="stylesheet" href="/css/layui.css">
<link rel="stylesheet" href="/css/global.css">
<link rel="stylesheet" href="/css/5704.css">
<script src="/js/jquery-1.10.2.min.js"></script>
<script src="/layui.js"></script>
<script src="/js/5704.js"></script>
	<script src="/js/helper.js"></script>
<script language="javascript">
	var hostname = "${hostname!''}" , port = "${webimport!''}" , userid = "${user.id!''}" , session = "${sessionid!''}" , orgi = "${orgi!''}";
</script>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header header header-f5704">
			<div class="layui-main">
				<a class="logo" href="/"><img src="/images/logo.png"></a>
				<ul class="layui-nav">
					<li class="layui-nav-item">
						<a href="/">
							<i class="kfont" style="position: relative;">&#xe717;</i>
							首页
						</a>
					</li>
					<li class="layui-nav-item layui-this">
						<#if user?? && user.usertype?? && user.usertype == "0">
						<a href="/admin"><i class="layui-icon" style="position: relative;">&#xe631;</i>上帝模式</a>
						<#else>
						<a href="/admin/projectandachievement"><i class="layui-icon" style="position: relative;">&#xe631;</i>项目成果管理</a>
						</#if>
					</li>
					<li class="layui-nav-item"><a href="javascript:void(0)"
						target="_blank">
						<i class="layui-icon" style="position: relative;">&#xe612;</i>
						<#if user??>${user.email!''}</#if></a>
						<dl class="layui-nav-child">
					      <dd><a href="/logout" data-toggle="tip" data-title="请确认是否退出系统？">退出系统</a></dd>
					    </dl>
					</li>
				</ul>
			</div>
		</div>

		<div class="layui-body" style="left:0px;">
			<div class="layui-tab product-tab" lay-filter="f5704tab" lay-allowClose="true">
				<ul class="layui-tab-title">
					<li class="layui-this"><i class="kfont"
						style="position: relative;">&#xe717;</i> 首页</li>
				</ul>
				<div class="layui-tab-content product-content">
					<div class="layui-tab-item layui-show" style="height:100%;">
						<iframe frameborder="0" src="${data.page}" id="maicontent" name="maicontent" width="100%" height="100%"></iframe>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
			layui.use('element', function(){
			  var $ = layui.jquery
			  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
			  
			  //触发事件
			  var active = {
				tabAdd: function(){
				  //新增一个Tab项
				  element.tabAdd('f5704tab', {
					title: '新选项'+ (Math.random()*1000|0) //用于演示
					,content: '内容'+ (Math.random()*1000|0)
				  })
				}
			  };
			  
			  $('.iframe_btn').on('click', function(){
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			  });
			});
		</script>
</body>

</html>