<div class="row">
	<div class="col-lg-12">
		<h1 class="site-h1" style="background-color:#FFFFFF;">
			发帖排行<#if userList??>（${userList.totalElements!''}）</#if>
		</h1>
		<div class="row" style="padding:5px;">
			<div class="col-lg-12">
				<table class="layui-table" lay-skin="line">
				  <colgroup>
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="20%">
						<col width="1%">
					<col>
				  </colgroup>
				  <thead>
					<tr>
					  <th>用户</th>
					  <th>电子邮件</th>
					  <th>手机</th>
					  <th>省份</th>
					  <th>城市</th>
					  <th>管理员</th>
					  <th>注册时间</th>
					  <th style="white-space:nowrap;" nowrap="nowrap">发帖数量</th>
					</tr> 
				  </thead>
				  <tbody>
					<#if defaultTopicList?? && defaultTopicList.content??>
					<#list defaultTopicList.content as topic>
					<tr>
					  <td>
							<a href="/user/index/${topic.user.id!''}" target="_blank">
								<img src="/res/image/${topic.user.id!''}" class="f5704-admin-avatar" onerror="this.src='/images/user/default.png'">
								<div style="margin-left:50px;margin-top:0px;">
									${topic.user.nickname!topic.user.name!topic.user.username!''}
									<div style="color:#aaaaaa;font-size:12px;">
										系统管理员
									</div>
								</div>
							</a>
							
					  </td>
					  <td>${topic.user.email!''}</td>
					  <td>${topic.user.mobile!''}</td>
					  <td>${topic.user.province!''}</td>
					  <td>${topic.user.city!''}</td>
					  <td>
					  	<#if topic.user.usertype?? && topic.user.usertype == "0">
					  		<i class="layui-icon layui-icon-file-b" style="color:#19a55d;"></i>
					  	</#if>
					  </td>
					  <td>${topic.user.createtime!''}</td>
					  <td style="white-space:nowrap;" nowrap="nowrap">
					  	<a href="/user/index/${topic.user.id!''}" target="_blank">
					  	${topic.rowcount!0}
					  	</a>
					  </td>
					</tr>
					</#list>
					</#if>
				  </tbody>
				</table>
			</div> 	   
		</div>
		
	</div>	
</div>
