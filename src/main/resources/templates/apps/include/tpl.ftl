
<!DOCTYPE ftl>
<head>
  <meta charset="utf-8">
	<title>5704工作室</title>
	<meta name="referrer" content="no-referrer" />
	<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico?t=${.now?long}"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="keywords" content="5704,工作室,管理平台">
	<meta name="description" content="5704工作室是一个人才培养的地方">
  <link rel="stylesheet" href="/css/layui.css">
  <link rel="stylesheet" href="/css/global.css">
  <script src="/layui.js"></script>
  <script src="/js/jquery-1.10.2.min.js"></script>
  <script src="/js/5704.js"></script>
	<script src="/js/helper.js"></script>
</head>
<body>
<div class="header">
  <div class="main">
    <a class="logo" href="/" title="5704工作室">5704工作室</a> <a style="padding-left: 50px;font-size: 18px;line-height: 35px;" href="/" title="5704工作室">5704工作室</a>
    <div class="nav">
      <a class="nav-this" href="/">
        <i class="layui-icon layui-icon-survey"></i>论坛
      </a>
    </div>
    <#if user??>
	    <div class="nav-user">      
	      <!-- 登入后的状态 -->
	      
	      <a class="avatar" href="/user/index">
	        <img src="/res/image/${user.id!''}" onerror="this.src='/images/user/default.png'">
	        <cite>${user.nickname!user.name!user.username!''}</cite>
	        <!-- （<i class="f5704-user-level"><i class="kfont icon-vip"></i>VIP2</i>） -->
	      </a>
	      <div class="nav">
	        <a href="/user/profile"><i class="iconfont icon-shezhi"></i>设置</a>
	        <#if user?? && user.usertype?? && user.usertype == "0">
	        <a href="/admin"><i class="layui-icon">&#xe631;</i>上帝模式</a>
	        <#else>
	        <a href="/admin/projectandachievement"><i class="layui-icon">&#xe631;</i>项目成果管理</a>
	        </#if>
	        <a href="/logout"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
	      </div>
	      
	    </div>
    <#else>
	    <div class="nav-user">
	      <!-- 未登入状态 -->
	      <a class="unlogin" href="/login"><i class="iconfont icon-touxiang"></i></a>
	      <span><a href="/login">登入</a><a href="/reg">注册</a></span>
	      <p class="out-login">
	        <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
	        <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
	      </p>   
	    </div>
    </#if>
  </div>
</div>

<#include "${data.page}.ftl"/> 

<div class="footer">
  <p><a href="javascript:void(0);" target="_blank">5704管理平台</a> 2019 &copy; <a href="javascript:void(0);">5704@5704.com</a></p>
  <p>
    	<#--  5704工作室源于2008年“大学生创新创业项目”的开展。通过团队成员的共同努力，团队开发经费从最初老师资助，发展到团队自有开发经费达17万人民币。  -->
  </p>
  <p>
    	Powered by <a href="https://github.com/DaviesGit" style="color:red;" target="_blank">Davies</a>
  </p>
</div>
<script language="javascript">
	layui.use('layer', function(){
	  var layer = layui.layer;
	  <#if msg?? && msg == 'sendmsg'>
		layer.alert('消息发送成功', {icon: 1});
	  </#if>
	});    
</script>
</body>
</ftl>
