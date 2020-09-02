<div class="main layui-clear"
	style="min-height: 600px;    position: relative;">
	<div class="f5704-profile-menu">
		<#include "/apps/user/usermenu.ftl">
	</div>
	<div class="f5704-profile">
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<#include "/apps/user/centermenu.ftl">
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show" style="padding-top:20px;">
					<ul class="jie-row">
						<#if topicList?? && topicList.content??>
						<#list topicList.content as topic>
						
						<li>
							<#if topic.essence>
								<span class="fly-jing">精帖</span> 
							</#if>
							<#if topic.accept>
								<span class="jie-status jie-status-ok">已解决</span>
							<#else>
								<span class="jie-status">求解中</span>
							</#if> 
							<a href="/topic/detail/${topic.id!''}" target="_blank">${topic.title!''}</a> <i>${topic.createtime?string('yyyy-MM-dd HH:mm:ss')}</i> <em>${topic.views!0}阅/${topic.answers!0}答</em>
						</li>
						</#list>
						<#else>
							<li class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></li>
						</#if>
					</ul>
					<div style="text-align: center">
						<div class="laypage-main" id="topicpages"></div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	layui.use(['laypage', 'layer'], function(){
	  layui.laypage.render({
			elem: 'topicpages',
			count: <#if topicList??>${topicList.totalElements}<#else>0</#if>,
			limit: <#if topicList??>${topicList.size}<#else>0</#if>,
			curr: <#if topicList??>${topicList.number+1}<#else>0</#if>,
			layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
			jump:function(data , first){
				if(!first){
					location.href = location.protocol + '//' + location.host + location.pathname+'?p='+data.curr+'&ps='+data.limit;
				}
			}
	   });
	});
</script>