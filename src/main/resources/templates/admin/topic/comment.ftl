<div class="row">
	<div class="col-lg-12">
		<h1 class="site-h1" style="background-color:#FFFFFF;">
			主题列表<#if defaultTopicList??>（${defaultTopicList.totalElements!''}）</#if>
			<span style="float:right;">
				<form  method="post" action="/admin/topic/comment" class="fly-search">
		          <i class="iconfont icon-sousuo"></i>
		          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q" value="${RequestParameters['q']!''}">
		        </form>
			</span>
		</h1>
		<div class="row" style="padding:5px;">
			<div class="col-lg-12">
				<table class="layui-table" lay-skin="line">
				  <colgroup>
						<col width="15%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
						<col width="1%">
					<col>
				  </colgroup>
				  <thead>
					<tr>
					  <th>用户</th>
					  <th>贴子主题</th>
					  <th>回复时间</th>
					  <th>回复内容</th>
					  <th style="white-space:nowrap;" nowrap="nowrap">操作</th>
					</tr> 
				  </thead>
				  <tbody>
				  	<#if topicCommentList?? && topicCommentList.content??> 
					<#list topicCommentList.content as topicComment>
					<tr>
					  <td>
							<a href="/user/index/${topicComment.user.id!''}" target="_blank">
								<img src="/res/image/${topicComment.user.id!''}" class="f5704-admin-avatar" onerror="this.src='/images/user/default.png'">
								<div style="margin-left:50px;margin-top:0px;">
									${topicComment.user.nickname!topicComment.user.name!topicComment.user.username!''}
									<div style="color:#aaaaaa;font-size:12px;">
										<#if topicComment.user.usertype?? && topicComment.user.usertype == '0'>
											系统管理员
										<#else>
											普通用户
										</#if>
									</div>
								</div>
							</a>
							
					  </td>
					  <td>
					  	<a href="/topic/detail/${topicComment.topic.id!''}" target="_blank">
					  		${topicComment.topic.title!''}
					  	</a>
					  </td>
					  <td><#if topicComment.updatetime??>${topicComment.updatetime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
					  <td class="f5704-hl-ttile">${topicComment.content!''}</td>
					  <td style="white-space:nowrap;" nowrap="nowrap">
					  		<a href="/admin/comment/delete/${topicComment.id!''}" data-toggle="tip" data-title="请确认是否删除回复？">
					  			<i class="layui-icon" style="color:red;">&#x1006;</i>
					  			删除
					  		</a>
					  </td>
					</tr>
					</#list>
					</#if>
				  </tbody>
				</table>
			      
			    <div style="text-align: center">
			        <div class="laypage-main" id="pages"></div>
			    </div>
			</div>
		</div>
	</div>
</div>

<script>
	layui.use(['laypage', 'layer'], function(){
	  layui.laypage.render({
			elem: 'pages',
			count: <#if topicCommentList??>${topicCommentList.totalElements}<#else>0</#if>,
			limit: <#if topicCommentList??>${topicCommentList.size}<#else>0</#if>,
			curr: <#if topicCommentList??>${topicCommentList.number+1}<#else>0</#if>,
			layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
			jump:function(data , first){
				if(!first){
					location.href = location.protocol + '//' + location.host + location.pathname+'?p='+data.curr+'&ps='+data.limit;
				}
			}
	   });
	});
</script>