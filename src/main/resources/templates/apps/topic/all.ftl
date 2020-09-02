<div class="main layui-clear">
	<div class="wrap">
	    <div class="content" style="margin-right:0px;">
	      <div class="fly-tab">
	        <span>
	          <a href="/info" <#if subtype?? && subtype == "info">class="tab-this"</#if>>消息发布</a>
	          <a href="/all">全部</a>
	          <a href="/chat" <#if subtype?? && subtype == "chat">class="tab-this"</#if>>闲聊区</a>
	          <a href="/essence" <#if subtype?? && subtype == "essence">class="tab-this"</#if>>精帖</a>
	          <#if user??>
	          	<a href="/my" <#if subtype?? && subtype == "my">class="tab-this"</#if>>我的帖</a>
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
	          <a href="/user/index" class="fly-list-avatar">
	            <img src="/res/image/${topic.creater!''}" onerror="this.src='/images/user/default.png'">
	          </a>
	          <h2 class="fly-tip">
	            <a href="/topic/detail/${topic.id!''}">${topic.title!''}</a>
	            <#if topic.top>
	            <span class="fly-tip-stick">置顶</span>
	            </#if>
	            <#if topic.essence>
	            <span class="fly-tip-jing">精帖</span>
	            </#if>
	          </h2>
	          <p>
	            <span><a href="/user/index">${topic.nickname!topic.name!topic.username!''}</a></span>
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
