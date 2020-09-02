<div class="row">
	<div class="col-lg-12">
		<h1 class="site-h1" style="background-color:#FFFFFF;">
			项目列表<#if projectListPage??>（${projectListPage.totalElements!''}）</#if>
			<span style="float:right;">
				<button class="layui-btn layui-btn-sm green" href="/admin/project/add" data-toggle="ajax" data-width="1000" data-height="600" data-title="创建新项目">
					创建新项目
				</button>
			</span>
		</h1>


		<#if user?? && user.usertype?? && user.usertype == "0">
		<div class="layui-collapse">
			<div class="layui-colla-item">
				<h2 class="layui-colla-title">筛选器：</h2>
				<div class="layui-colla-content">
					<form id="project_filter_form" method="get" class="layui-form" action="">

						<fieldset class="layui-elem-field">
						<legend>筛选选项：</legend>

							<div class="layui-form-item">

								<div class="layui-inline">
									<label class="layui-form-label">ID：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="id" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">项目名称：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="name" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">项目负责人：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="principal" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">项目比赛：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="match" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">项目进度：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="progress" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">开始时间：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="begin" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">结束时间：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="end" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

							</div>

							<div class="layui-form-item">
								<div class="layui-inline">
									<label class="layui-form-label">模糊搜索：</label>
									<div class="layui-input-inline">
											<input type="text" lay-verType="tips" value="" name="search" lay-verify="" lay-reqText=""
											placeholder="关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-input-inline">
										<button class="layui-btn layui-btn-sm" lay-submit lay-filter="formDemo">筛选</button>
										<button type="reset" class="layui-btn layui-btn-warm layui-btn-sm">重置</button>
										<button type="button" class="layui-btn layui-btn-normal layui-btn-sm" id="export_result">导出结果</button>
									</div>
								</div>
							</div>
						</fieldset>

					</form>
				</div>
			</div>
		</div>
		</#if>

		<div class="row" style="padding:5px;">
			<div class="col-lg-12">
				<#assign projectList=projectListPage.content>
				<#include "/component/list/project.ftl"/>
			</div> 	   
		</div>
		<div class="row" style="padding:5px;">
			<div class="col-lg-12" id="page" style="text-align:center;"></div>
		</div>
	</div>	
</div>
<script>
	layui.use(['laypage', 'layer'], function(){
	  layui.laypage.render({
			elem: 'page',
			count: <#if projectListPage??>${projectListPage.totalElements}<#else>0</#if>,
			limit: <#if projectListPage??>${projectListPage.size}<#else>0</#if>,
			curr: <#if projectListPage??>${projectListPage.number+1}<#else>0</#if>,
			layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
			jump:function(data , first){
				if(!first){
					let params=new URLSearchParams(window.location.search);
					params.set('p',data.curr);
					params.set('ps',data.limit);
					location.href = location.protocol + '//' + location.host + location.pathname+'?'+params.toString();
				}
			}
	   });
		let params=new URLSearchParams(window.location.search);
		['id','name','principal','match','progress','begin','end','search',].forEach(function(e){
			layui.$('[name="'+e+'"]').val(params.get(e));
		});

		layui.$('#export_result').click(function(event){
			let  formData = new FormData(project_filter_form);
			window.open(location.protocol + '//' + location.host + location.pathname+'/../../../api/export/project?'+new URLSearchParams(formData).toString(), '_blank');
		});
	});
</script>