<div class="row">
	<div class="col-lg-12">
		<h1 class="site-h1" style="background-color:#FFFFFF;">
			用户列表<#if userListPage??>（${userListPage.totalElements!''}）</#if>
			<span style="float:right;">
				<button class="layui-btn layui-btn-sm green" href="/admin/user/add" data-toggle="ajax" data-width="1000" data-height="600" data-title="创建新用户">
					创建新用户
				</button>
			</span>
		</h1>

		<#if user?? && user.usertype?? && user.usertype == "0">
		<div class="layui-collapse">
			<div class="layui-colla-item">
				<h2 class="layui-colla-title">筛选器：</h2>
				<div class="layui-colla-content">
					<form id="user_filter_form" method="get" class="layui-form" action="">

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
									<label class="layui-form-label">用户名：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="username" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">用户类型：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="usertype" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">最后一次登录时间：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="lastlogintime" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">成员等级：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="rank" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">昵称：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="nickname" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">firstname：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="firstname" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">midname：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="midname" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">lastname：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="lastname" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">语言：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="language" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">工作名称：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="jobtitle" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">头衔：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="title" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">生日：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="birthday" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">部门：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="department" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">性别：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="gender" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">姓名：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="name" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">邮箱：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="email" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">电话：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="mobile" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">身份证：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="phone" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">父母联系方式：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="parent_phone" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">组织：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="organ" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">技能：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="skill" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">城市：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="city" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">省份：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="province" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">学号：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="sno" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">年级：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="grade" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">专业：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="major" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">寝室号：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="room_id" lay-verify="" lay-reqText=""
										placeholder="包含关键字：" autocomplete="on" class="layui-input">
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">加入时：</label>
									<div class="layui-input-inline">
										<input type="text" lay-verType="tips" value="" name="join_time" lay-verify="" lay-reqText=""
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
				<#assign userList=userListPage.content>
				<#include "/component/list/user.ftl"/>
			</div> 	   
		</div>
		<div class="row" style="padding:5px;">
			<div class="col-lg-12" id="page" style="text-align:center;"></div>
		</div>
	</div>	
</div>
<script>
	layui.use(['laypage', 'layer','element','jquery'], function(){
	  layui.laypage.render({
			elem: 'page',
			count: <#if userListPage??>${userListPage.totalElements}<#else>0</#if>,
			limit: <#if userListPage??>${userListPage.size}<#else>0</#if>,
			curr: <#if userListPage??>${userListPage.number+1}<#else>0</#if>,
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
		['id','username','usertype','lastlogintime','rank','nickname','firstname','midname','lastname','language','jobtitle','title','birthday','department','gender','name','email','mobile','phone','parent_phone','organ','skill','city','province','sno','grade','major','room_id','join_time','search',].forEach(function(e){
			layui.$('[name="'+e+'"]').val(params.get(e));
		});

		layui.$('#export_result').click(function(event){
			let  formData = new FormData(user_filter_form);
			window.open(location.protocol + '//' + location.host + location.pathname+'/../../../api/export/user?'+new URLSearchParams(formData).toString(), '_blank');
		});
	});
</script>