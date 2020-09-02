<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
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
  	
	<link rel="stylesheet" href="/css/flexboxgrid.min.css">
	<link rel="stylesheet" href="/css/layui.css">
	<link rel="stylesheet" href="/css/global.css">
	<link rel="stylesheet" href="/css/5704.css">
	<link rel="stylesheet" href="/css/flexboxgrid.min.css">
	<script src="/js/jquery-1.10.2.min.js"></script>
	<script src="/js/jquery.form.js"></script>
	
	<script src="/layui.js"></script>
	<script src="/js/5704.js"></script>
	<script src="/js/helper.js"></script>
</head>

<body>
	<div class="layui-layout layui-layout-content">
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
			<#include "/admin/include/left.ftl"/></div>
		</div>
		<div class="layui-body">
			<div class="layui-side-scroll" style=""><#include "${data.page}.ftl"/>
			</div>
		</div>
	</div>
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
			//监听导航点击
			element.on('nav(layui)', function(elem) {
				
			});
		});
	</script>
</body>

</html>