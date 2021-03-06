<div class="main layui-clear"
	style="min-height: 600px;    position: relative;">
	<div class="f5704-profile-menu">
		<#include "/apps/user/usermenu.ftl">
	</div>
	<div class="f5704-profile">
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title">
				<li class="layui-this"><a href="/user/center">我的消息</a></li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show" style="padding-top:20px;"  id="commentpages">
					<ul class="jie-row" id="messages">
						<#include "/apps/user/message.ftl">
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	layui.use(['element', 'flow'], function(){
	  	var element = layui.element ;
	  	
	  	var flow = layui.flow;
		flow.load({
		    elem: '#commentpages' //指定列表容器
		    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
		      //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
		      $.get('/user/messages.ftl?op=load&p='+page, function(res){
		        //假设你的列表返回在data集合中
		        
		        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
		        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
		        next($('#messages').append(res) , $(res).length > 0);    
		      });
		    }
		});
	});
</script>