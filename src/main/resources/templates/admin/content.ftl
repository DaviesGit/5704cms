<script language="javascript" src="/js/echarts.common.min.js"></script>
<script language="javascript" src="/js/theme/wonderland.js"></script>

<div class="f5704-main-content"></div>
<div class="row" style="width: 100%;">
	<div class="col-lg-8">
		<div class="box">
			<div class="box-title">
				<h1 class="site-h1" style="background-color:#EEEEEE;">系统概况</h1>
			</div>
			<div class="box-body">
				
				<div class="row">
					<div class="col-lg-3">
						<div class="f5704-measure">
							<a href="/admin/user/list" class="f5704-bt"> 
								<i class="layui-icon f5704-btn f5704-measure-btn">&#xe612;</i>
								<div class="f5704-bt-text">
									<div class="f5704-bt-text-title" style="font-weight:400;font-size:23px;">${newUserList.totalElements!''}</div>
									<div class="f5704-bt-text-content" style="">用户总数</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="f5704-measure">
							<a href="/admin/topic" class="f5704-bt"> 
								<i class="layui-icon f5704-btn f5704-measure-btn f5704-bg-color-yellow">&#xe63a;</i>
								<div class="f5704-bt-text">
									<div class="f5704-bt-text-title" style="font-weight:400;font-size:23px;">${countTopic!0}</div>
									<div class="f5704-bt-text-content" style="">帖子总数</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="f5704-measure">
							<a href="/admin/comment/top" class="f5704-bt"> 
								<i class="layui-icon f5704-btn f5704-measure-btn">&#xe63c;</i>
								<div class="f5704-bt-text">
									<div class="f5704-bt-text-title" style="font-weight:400;font-size:23px;">${topicCommentList.totalElements!0}</div>
									<div class="f5704-bt-text-content" style="">回答数量</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="f5704-measure">
							<a href="/admin/topic" class="f5704-bt"> 
								<i class="layui-icon f5704-btn f5704-measure-btn f5704-bg-color-yellow">&#xe63a;</i>
								<div class="f5704-bt-text">
									<div class="f5704-bt-text-title" style="font-weight:400;font-size:23px;">${todayTopics!0}</div>
									<div class="f5704-bt-text-content" style="">今日新增帖子</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="box">
					<div class="box-title">
						<h1 class="site-h1" style="background-color:#EEEEEE;">新帖数据概况</h1>
					</div>
					<div class="box-body" style="padding:5px;">
						<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
					    <div id="main" style="width: 100%;height:300px;"></div>
					    <script type="text/javascript">
					        // 基于准备好的dom，初始化echarts实例
					        var myChart = echarts.init(document.getElementById('main') , 'wonderland');
					
					        // 指定图表的配置项和数据
					        var option = {
					            title: {
					                text: ''
					            },
					            tooltip: {},
					            legend: {
					                data:['发帖量']
					            },
					            grid: {
					                x: 30,
					                y: 10,
					                x2: 30,
					                y2: 40,
					                // width: {totalWidth} - x - x2,
					                // height: {totalHeight} - y - y2,
					                backgroundColor: 'rgba(0,0,0,0)',
					                borderWidth: 1,
					                borderColor: '#ccc'
					            },					            
					            xAxis: {
					                data: [<#if countTopicList??><#list countTopicList as topickey><#if topickey_index gt 0>,</#if>"${topickey.key!''}"</#list></#if>]
					            },
					            yAxis: {},
					            series: [{
					                name: '新帖数量',
					                type: 'bar',
					                data: [<#if countTopicList??><#list countTopicList as topickey><#if topickey_index gt 0>,</#if>"${topickey.rowcount!''}"</#list></#if>]
					            }]
					        };
					
					        // 使用刚指定的配置项和数据显示图表。
					        myChart.setOption(option);
					    </script>
					</div>
				</div>
				
				<div class="box">
					<div class="box-title">
						<h1 class="site-h1" style="background-color:#EEEEEE;">最新用户</h1>
					</div>
					<div class="box-body" style="padding:5px;">
						<table class="layui-table" lay-skin="line">
						  <colgroup>
								<col width="40%">
								<col width="25%">
								<col width="15%">
								<col width="20%">
							<col>
						  </colgroup>
						  <thead>
							<tr>
							  <th>用户</th>
							  <th>电子邮件</th>
							  <th>手机</th>
							  <th>城市</th>
							</tr> 
						  </thead>
						  <tbody>
							<#if newUserList?? && newUserList.content??>
							<#list newUserList.content as user>
							<tr>
							  <td>
									<a href="/user/index/${user.id!''}" target="_blank">
										<img src="/res/image/${user.id!''}" class="f5704-admin-avatar" onerror="this.src='/images/user/default.png'">
										<div style="margin-left:50px;margin-top:0px;">
											${user.nickname!user.name!user.username!''}
											<div style="color:#aaaaaa;font-size:12px;">
												注册时间：${user.createtime!''}
											</div>
										</div>
									</a>
									
							  </td>
							  <td>${user.email!''}</td>
							  <td>${user.mobile!''}</td>
							  <td>${user.province!''}${user.city!''}</td>
							</tr>
							</#list>
							</#if>
						  </tbody>
						</table>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-4" style="padding-left:0px;">

		
		<div class="box">
			<div class="box-title">
				<h1 class="site-h1" style="background-color:#EEEEEE;">最新贴子</h1>
			</div>
			<div class="box-body" style="padding:0px 10px;">
				<ol class="fly-list-one f5704-ask-li">
				<#if newTopicList?? && newTopicList.content??> 
					<#list newTopicList.content as topic>
				      <li>
					<a href="/topic/detail/${topic.id!''}" target="_blank">${topic.title!''}</a>
					
					<div class="f5704-ask-rela">
						<span title="发表时间"><i class="iconfont">&#xe60b;</i> ${topic.updatetime?string('yyyy-MM-dd HH:mm:ss')}</span>
						<span title="回复数"><i class="iconfont"></i> ${topic.answers!0}</span>
						<span title="关注数"><i class="iconfont">&#xe60b;</i> ${topic.views!0}</span>
					</div>
				      </li>
				    </#list>
				    </#if>
			    </ol>
			</div>
		</div>
	</div>
</div>