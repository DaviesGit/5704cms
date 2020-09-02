<ul class="layui-tab-title">
	<li <#if typename?? && typename == 'center'> class="layui-this"</#if>><a href="/user/center">我发表的贴子</a></li>
	<li <#if typename?? && typename == 'answer'> class="layui-this"</#if>><a href="/user/center/answer">我回答的贴子</a></li>
	<li <#if typename?? && typename == 'fans'> class="layui-this"</#if>><a href="/user/center/fans">我的粉丝</a></li>
	<li <#if typename?? && typename == 'follows'> class="layui-this"</#if>><a href="/user/center/follows">我关注的用户</a></li>
</ul>