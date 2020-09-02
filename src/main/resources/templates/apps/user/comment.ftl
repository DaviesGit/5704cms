<#if topicCommentList??> 
	<#list topicCommentList as topicComment>
	<li>
		<p>
			<span>${topicComment.updatetime?string('yyyy-MM-dd HH:mm:ss')}</span>
			在<a href="/topic/detail/${topicComment.dataid!''}#${topicComment.id!''}" target="_blank"><#if
				topicComment.topic??>${topicComment.topic.title!''}</#if></a>中回答：
		</p>
		<div class="home-dacontent">${topicComment.content!''}</div>
	</li>
	</#list> 
</#if>