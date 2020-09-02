<div class="main" style="min-height:140px;position: relative;">
		<img src="/res/image/${userData.id!''}"
			alt="${userData.nickname!userData.name!userData.username!''}">
		<div class="f5704-user-index">
			<h1>
				${userData.nickname!userData.name!userData.username!''}
				<#if userData.gender?? && userData.gender == '0'>
					<i class="iconfont icon-nan"></i>
				<#elseif userData.gender?? && userData.gender == '1'>
					<i class="iconfont icon-nv"></i>
				</#if>
				<#if userData.title?? && userData.title != ''>
				<#list userData.title?split(',') as title>
					<#if title == '1'>
						<span style="color:#c00;">（超级码农）</span>
					</#if>
					<#if title == '2'>
				  		<span style="color:#5FB878;">（活雷锋）</span>
				  	</#if>
				</#list>
				</#if>
			  	<#if userData.status?? && userData.status == '0'>
			  	<span>（该号已被封）</span>
			  	</#if>
			  	<#if userData.usertype?? && userData.usertype == '0'>
			  	<span style="color:#c00;">（管理员）</span>
			  	</#if>
			</h1>
			<div class="layui-main">
				<p
					style="display: inline-block; max-width: 800px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: #999; margin-top: 10px;">
					${userData.memo!''}</p>
			</div>
			<div class="f5704-sns">
				<#if userData?? && user?? && userData.id == user.id>
					<span lay-event="" class="f5704-btn-group">
						<a href="/user/profile"
						<button class="layui-btn layui-btn-normal layui-btn-small f5704-btn-sns">
							<i class="layui-icon">&#xe63a;</i>
							编辑个人信息
						</button>
						</a>
					</span>
				<#else>
					<#if fan??>
					<span lay-event="" class="f5704-btn-group">
						<a href="/user/unfans/${userData.id!''}"
						<button class="layui-btn layui-btn-normal layui-btn-small f5704-btn-fans">
							<i class="layui-icon">&#xe60c;</i>
							取消关注
						</button>
						</a>
					</span>
					<#else>
						<span lay-event="" class="f5704-btn-group">
							<a href="/user/fans/${userData.id!''}"
							<button class="layui-btn layui-btn-normal layui-btn-small f5704-btn-fans">
								<i class="layui-icon">&#xe60c;</i>
								关注
							</button>
							</a>
						</span>
					</#if>
					<span lay-event="" class="f5704-btn-group">
						<a href="/user/message/${userData.id!''}" data-toggle="ajax" data-width="550" data-height="270" data-title="">
						<button class="layui-btn layui-btn-normal layui-btn-small f5704-btn-sns">
							<i class="layui-icon">&#xe63a;</i>
							私信
						</button>
						</a>
					</span>
					<!-- 
					<span lay-event="" class="f5704-btn-group">
						<button class="layui-btn layui-btn-normal layui-btn-small f5704-btn-sns">
							<i class="layui-icon">&#xe607;</i>
							提问
						</button>
					</span>
					 -->
				</#if>
				
			</div>
		</div>
		<div class="f5704-relation">
			<span lay-event="" class="f5704-relation-item">
				积分
				<a href="/user/index/${userData.id!''}" class="measure">
					${userData.integral!0}
				</a>
			</span>
			<span lay-event="" class="f5704-relation-item">
				粉丝
				<a href="/user/fans/list/${userData.id}" class="measure">
					${fans!0}
				</a>
			</span>
			<span lay-event="" class="f5704-relation-item">
				关注
				<a href="/user/follows/list/${userData.id}" class="measure">
					${follows!0}
				</a>
			</span>
			<div class="f5704-join-time f5704-text-muted">
				
                     	<#if userData.createtime??>加入于${userData.createtime?string('yyyy-MM-dd')}</#if>  <#if userData.lastlogintime??>最近登录：${userData.lastlogintime?string('yyyy-MM-dd HH:mm:ss')}</#if>
                 
			</div>
		</div>
	</div>