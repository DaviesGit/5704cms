<ul class="layui-nav layui-nav-tree">
	<li class="layui-nav-item"><a href="/user/index"> <i
			class="kfont f5704-icon">&#xe717;</i> 我的主页
	</a></li>
	<li class="layui-nav-item <#if typename?? && (typename == 'center' || typename == 'answer' || typename == 'fans'  || typename == 'follows')>layui-this</#if>"><a href="/user/center"> <i
			class="layui-icon f5704-icon">&#xe612;</i> 用户中心
	</a></li>
	<li class="layui-nav-item <#if typename?? && typename == 'profile'>layui-this</#if>"><a href="/user/profile"> <i
			class="layui-icon f5704-icon">&#xe631;</i> 基本设置
	</a></li>
	<li class="layui-nav-item <#if typename?? && typename == 'messages'>layui-this</#if>"><a href="/user/messages"> <i
			class="layui-icon f5704-icon">&#xe63a;</i> 我的消息
	</a></li>
	<!-- 
	<li class="layui-nav-item <#if typename?? && typename == 'license'>layui-this</#if>"><a href=""> <i
			class="kfont f5704-icon">&#xe658;</i> 产品授权
	</a></li>
	 -->
</ul>