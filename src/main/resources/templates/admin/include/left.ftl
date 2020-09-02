<#assign is_super_user= user?? && user.usertype?? && user.usertype == "0">

<ul class="layui-nav layui-nav-tree" lay-filter="demo">

	<#if is_super_user>
	<li class="layui-nav-item <#if subtype?? && subtype == 'content'>layui-this</#if>">
		<a class="layui-nav-default" href="/admin/content">系统概况</a>
	</li>
	</#if>
	<#--  <#if is_super_user>
	<li class="layui-nav-item layui-nav-itemed">
		<a class="layui-nav-title" 
			href="javascript:;">成员管理</a>
		<dl class="layui-nav-child">
			<dd  <#if subtype?? && subtype == 'adminuser'>class="layui-this"</#if>>
				<a href="/admin/user/index">系统管理员</a>
			</dd>
			<dd  <#if subtype?? && subtype == 'user'>class="layui-this"</#if>>
				<a href="/admin/user/list">注册用户</a>
			</dd>
		</dl>
	</li>
	</#if>  -->
	<li class="layui-nav-item <#if subtype?? && subtype == 'user'>layui-this</#if>">
		<a class="layui-nav-default" href="/admin/user/index">成员管理</a>
	</li>
	<li class="layui-nav-item <#if subtype?? && subtype == 'project'>layui-this</#if>">
		<a class="layui-nav-default" href="/admin/project/index">项目管理</a>
	</li>
	<li class="layui-nav-item <#if subtype?? && subtype == 'achievement'>layui-this</#if>">
		<a class="layui-nav-default" href="/admin/achievement/index">成果管理</a>
	</li>
	<#if is_super_user>
	<li class="layui-nav-item layui-nav-itemed">
		<a class="layui-nav-title" href="javascript:;">内容管理</a>
		<dl class="layui-nav-child">
			<dd <#if subtype?? && subtype == 'topic'>class="layui-this"</#if>>
				<a href="/admin/topic">贴子主题</a>
			</dd>
			<dd <#if subtype?? && subtype == 'comment'>class="layui-this"</#if>>
				<a href="/admin/comment">用户回答</a>
			</dd>
			<dd <#if subtype?? && subtype == 'topictop'>class="layui-this"</#if>>
				<a href="/admin/topic/top">发帖排行</a>
			</dd>
			<dd <#if subtype?? && subtype == 'commenttop'>class="layui-this"</#if>>
				<a href="/admin/comment/top">回复排行</a>
			</dd>
		</dl>
	</li>
	</#if>
	<!-- 
	<li class="layui-nav-item layui-nav-itemed">
		<a class="layui-nav-title" href="javascript:;">统计报表</a>
		<dl class="layui-nav-child">
			
			<dd>
				<a href="javascript:;">访问统计</a>
			</dd><dd>
				<a href="javascript:;">回复统计</a>
			</dd>
			<dd>
				<a href="javascript:;">主题统计</a>
			</dd>
		</dl>
	</li>
	 -->
</ul>