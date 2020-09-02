<div class="main layui-clear"
	style="min-height: 600px;    position: relative;">
	<div class="f5704-profile-menu">
		<#include "/apps/user/usermenu.ftl">
	</div>
	<div class="f5704-profile">
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<#include "/apps/user/centermenu.ftl">
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show" style="padding-top:20px;"  id="commentpages">
					<ul class="jie-row">
						<#if fansList?? && fansList.content??>
						<#list fansList.content as fanUser>
						
						<li class="f5704-user-fans">
							
							<a href="/user/index/${fanUser.id!''}" target="_blank" class="fly-list-avatar">
								<img src="/res/image/${fanUser.id!''}">
								<div class="f5704-users-sns">
									<div class="item">
										${fanUser.nickname!fanUser.name!fanUser.username!''}
									</div>
									<div class="item">
										积分：${fanUser.integral!0} | 粉丝 ：${fanUser.fans!0} | 关注：${fanUser.follows!0}
									</div>
									<div class="f5704-users-location item">
										<i class="iconfont icon-chengshi"></i>
										位置：${fanUser.province!''} ${fanUser.city!''}
										<label style="margin-left:20px;">
										签名：${fanUser.memo!''}
									</div>
								</div>
							</a> 
							<div class="f5704-user-operator">
								<div>
									<a href="/user/message/${fanUser.id!''}" data-toggle="ajax" data-width="550" data-height="270" data-title="">
									<button class="layui-btn layui-btn-normal layui-btn-small f5704-btn-sns">
										私信
									</button>
									</a>
								</div>
							</div>
						</li>
						</#list>
						<#else>
							<li class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">还没有粉丝</i></li>
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
			count: <#if fansList??>${fansList.totalElements}<#else>0</#if>,
			limit: <#if fansList??>${fansList.size}<#else>0</#if>,
			curr: <#if fansList??>${fansList.number+1}<#else>0</#if>,
			layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
			jump:function(data , first){
				if(!first){
					location.href = location.protocol + '//' + location.host + location.pathname+'?p='+data.curr+'&ps='+data.limit;
				}
			}
	   });
	});
</script>