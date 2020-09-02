<#if msgList??> 
<#list msgList as msg>
<li class="f5704-user-fans f5704-message">
	<div class="fly-list-avatar">
		<a href="/user/index/${msg.target.id!''}">
			<img src="/res/image/${msg.target.id!''}">
		</a>
		<div class="f5704-users-sns">
			<div class="item">
				<#if msg.msgtype?? && msg.msgtype=="send">
					发送给
				<#elseif msg.msgtype?? && msg.msgtype=="recive">
					收到 
				</#if>
				<a href="/user/index/${msg.target.id!''}">
				@${msg.target.nickname!msg.target.name!msg.target.username!''} :
				</a>
				
				${msg.content!''}
			</div>
			
			<div class="item">
				${msg.createtime?string('yyyy-MM-dd HH:mm:ss')}
			</div>
		</div>
		<div class="f5704-message-op">
			<a href="/user/message/${msg.target.id!''}" data-toggle="ajax" data-title="" data-width="550" data-height="270">回复</a>  
			 <a <#--href="/user/message/list/${msg.target.id!''}"--> >共有 ${msg.rowcount!0}条私信</a> 
			<a href="/user/message/delete/${msg.target.id!''}" data-toggle="tip" data-title="请确认是否删除消息？">删除</a>
		</div>
	</div>
</li>
</#list> 
</#if>	