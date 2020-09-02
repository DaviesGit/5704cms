<div class="fly-home">
	<#include '/apps/user/dashboard.ftl'>
</div>

<div class="main layui-clear">
	<div class="fly-main layui-clear">
		<div class="home-left">
			<#include "/apps/user/userinfo.ftl">
		</div>
		<div class="home-right">
			<div class="layui-tab layui-tab-brief" lay-filter="user_info_table">
				<ul class="layui-tab-title">
					<li lay-id="question" class="layui-this">最近发表的贴子</li>
					<li lay-id="answer">最近的回答</li>
					<li lay-id="user">个人信息</li>
					<li lay-id="project">项目展示</li>
					<li lay-id="achievement">成果展示</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
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
					<div class="layui-tab-item" id="commentpages">
						<ul class="home-jieda" id="commenttopic">
							<#include "/apps/user/comment.ftl">
						</ul>
					</div>
					<div class="layui-tab-item" >
						<#include "component/detail/user.ftl">
					</div>
					<div class="layui-tab-item" >
						<#include "component/detail/project.ftl">
					</div>
					<div class="layui-tab-item" >
						<#include "component/detail/achievement.ftl">
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
<script>
	layui.use(['element' , 'laypage' , 'flow','table'], function(){
		layui.flow.load({
				elem: '#commentpages' //指定列表容器
				,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
					//以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
					layui.$.get('/user/comment/${userData.id!''}.ftl?p='+page, function(res){
						//假设你的列表返回在data集合中
						
						//执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
						//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
						next($('#commenttopic').append(res) , $(res).length > 0);    
					});
				}
		});
		layui.element.on('tab(user_info_table)', function(){
			[
				window.user_achievement_list,
				window.user_project_list,
				window.project_achievement_list,
				window.project_user_list,
				window.achievement_project_list,
				window.achievement_user_list
			].forEach(function(ele){
				layui.table.resize(ele.id);
			});
		});
		layui.element.tabChange('user_info_table', '${tab!''}');
  });
</script>
