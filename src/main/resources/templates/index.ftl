<div class="main layui-clear">
	<div class="wrap">
	    <div class="content">
	      <div class="fly-tab">
	        <span>
	          <a href="/info">消息发布</a>
	          <a href="/all" class="tab-this">全部</a>
	          <a href="/chat">闲聊区</a>
	          <a href="/essence">精帖</a>
	          <#if user??>
	          	<a href="/my">我的帖</a>
	          </#if>
	        </span>
	        <form method="post" action="/" class="fly-search">
	          <i class="iconfont icon-sousuo"></i>
	          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q" value="${RequestParameters['q']!''}">
	        </form>
	        <a href="/topic/add" class="layui-btn jie-add">发布贴子</a>
	      </div>
	      
	      
	      <ul class="fly-list">
	      	<#if defaultTopicList??>
	      	<#list defaultTopicList.content as topic>
	        <li class="fly-list-li">
	          <a href="/user/index/${topic.creater!''}" class="fly-list-avatar">
	            <img src="/res/image/${topic.creater!''}" onerror="this.src='/images/user/default.png'">
	          </a>
	          <h2 class="fly-tip">
	            <a href="/topic/detail/${topic.id!''}" class="f5704-hl-ttile">${(topic.title!'')?no_esc}</a>
	            <#if topic.top>
	            <span class="fly-tip-stick">置顶</span>
	            </#if>
	            <#if topic.essence>
	            <span class="fly-tip-jing">精帖</span>
	            </#if>
	          </h2>
	          <p>
	            <span><a href="/user/index/${topic.creater!''}"><#if topic.user??>${topic.user.nickname!topic.user.name!topic.user.username!''}<#else>${topic.username!''}</#if></a></span>
	            <span>${topic.updatetime?string('yyyy-MM-dd HH:mm:ss')}</span>
	            <span class="fly-list-hint"> 
	              <i class="iconfont" title="回答">&#xe60c;</i> ${topic.answers!0}
	              <i class="iconfont" title="人气">&#xe60b;</i> ${topic.views!0}
	            </span>
	          </p>
	        </li>
	        </#list>
	        </#if>
	        
	      </ul>
	      
	      <div style="text-align: center">
	        <div class="laypage-main" id="pages"></div>
	      </div>
	      
	    </div>
	  </div>
	  <div class="edge">
	    
	  
	    <h3 class="page-title">活跃用户 - TOP 12</h3>
	    <div class="user-looklog leifeng-rank">
	      <span>
	      	<#if topUserCommentList??>
	      	<#list topUserCommentList as topUserComment>
	        <a href="/user/index/${topUserComment.creater!''}">
	          <img src="/res/image/${topUserComment.creater}.png" onerror="this.src='/images/user/default.png'">
	          <cite><#if topUserComment.user??>${topUserComment.user.nickname!topUserComment.user.name!topUserComment.user.username!''}</#if></cite>
	          <i>${topUserComment.rowcount!0}次回答</i>
	        </a>
	        </#list>
	        </#if>
	      </span> 
	    </div>

	    
	    <h3 class="page-title">最近热帖</h3>
	    <ol class="fly-list-one f5704-ask-li">
	    	<#if relaAnswersList??>
	    	<#list relaAnswersList.content as relaViewsTopic>
		      <li>
		        <a href="/topic/detail/${relaViewsTopic.id!''}">${relaViewsTopic.title!''}</a>
		        
		        <div class="f5704-ask-rela">
		        	<span title="发表时间"><i class="iconfont">&#xe60b;</i> ${relaViewsTopic.updatetime?string('yyyy-MM-dd HH:mm:ss')}</span>
		        	<span title="回复数"><i class="iconfont"></i> ${relaViewsTopic.answers!0}</span>
		        	<span title="关注数"><i class="iconfont">&#xe60b;</i> ${relaViewsTopic.views!0}</span>
		        </div>
		      </li>
		    </#list>
		    </#if>
	    </ol>
	    
	    <h3 class="page-title">近期热议</h3>
	    <ol class="fly-list-one">
	    	<#if relaViewsList??>
	    	<#list relaViewsList.content as relaAnswerTopic>
		      <li>
		        <a href="/topic/detail/${relaAnswerTopic.id!''}">${relaAnswerTopic.title!''}</a>
		        
		        <div class="f5704-ask-rela">
		        	<span title="发表时间"><i class="iconfont">&#xe60b;</i> ${relaAnswerTopic.updatetime?string('yyyy-MM-dd HH:mm:ss')}</span>
		        	<span title="回复数"><i class="iconfont"></i> ${relaAnswerTopic.answers!0}</span>
		        	<span title="关注数"><i class="iconfont">&#xe60b;</i> ${relaAnswerTopic.views!0}</span>
		        </div>
		      </li>
		    </#list>
		    </#if>
	    </ol>
	    
	    <div class="fly-link">
	    </div>
	    
	
	  </div>
  </div>
<script>
	layui.use(['laypage', 'layer'], function(){
	  layui.laypage.render({
			elem: 'pages',
			count: <#if defaultTopicList??>${defaultTopicList.totalElements}<#else>0</#if>,
			limit: <#if defaultTopicList??>${defaultTopicList.size}<#else>0</#if>,
			curr: <#if defaultTopicList??>${defaultTopicList.number+1}<#else>0</#if>,
			layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
			jump:function(data , first){
				if(!first){
					location.href = location.protocol + '//' + location.host + location.pathname+'?p='+data.curr+'&ps='+data.limit;
				}
			}
	   });
	});
</script>