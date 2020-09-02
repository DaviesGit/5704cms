<div class="main layui-clear"
	style="min-height: 600px;    position: relative;">
	<div class="f5704-profile-menu">
		<#include "/apps/user/usermenu.ftl">
	</div>
	<div class="f5704-profile">
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title">
				<li <#if !(t??)>class="layui-this"</#if>>我的资料</li>
				<li <#if t?? && t == 'avator'>class="layui-this"</#if>>头像</li>
				<li>密码修改</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item <#if !(t??)>layui-show</#if>">
					<form method="post" action="/user/profile/save" class="layui-form">



    <fieldset class="layui-elem-field">
      <legend>用户基本信息</legend>
      <div class="layui-field-box">

        <div class="layui-form-item">
          <label class="layui-form-label required">昵称：</label>
          <div class="layui-input-block">
            <input type="text" lay-verType="tips" value="${userData.nickname!userData.name!userData.username!''}" name="nickname" lay-verify="required" lay-reqText="此信息不能为空"
              placeholder="请输入 昵称" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">firstname：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.firstname!''}" name="firstname" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 firstname" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">midname：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.midname!''}" name="midname" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 midname" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">lastname：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.lastname!''}" name="lastname" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 lastname" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">语言：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.language!''}" name="language" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 语言" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">工作名称：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.jobtitle!''}" name="jobtitle" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 工作名称" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">头衔：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.title!''}" name="title" lay-verify="" lay-reqText="此信息不能为空" placeholder="请输入 头衔"
                autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">生日：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.birthday!''}"  name="birthday" lay-verify="required|date" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">部门：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.department!''}" name="department" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 部门" autocomplete="off" class="layui-input">
            </div>
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label required">性别：</label>
          <div class="layui-input-block">
            <input type="radio" <#if userData.gender?? && userData.gender == "男">checked</#if>  name="gender" value="男" title="男">
            <input type="radio" <#if userData.gender?? && userData.gender == "女">checked</#if>  name="gender" value="女" title="女">
            <input type="radio" <#if userData.gender?? && userData.gender != "女"&& userData.gender != "男">checked</#if>  name="gender" value="保密" title="保密" disabled>
          </div>
        </div>

        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label required">姓名：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.name!''}" name="name" lay-verify="required" lay-reqText="此信息不能为空"
                placeholder="请输入 姓名" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">邮箱：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.email!''}" name="email" lay-verify="required|email" lay-reqText="此信息不能为空"
                placeholder="请输入 邮箱" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">电话1：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.mobile!''}" name="mobile" lay-verify="required|phone" lay-reqText="此信息不能为空"
                placeholder="请输入 电话1" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">身份证：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.phone!''}" name="phone" lay-verify="required|identity" lay-reqText="此信息不能为空"
                placeholder="请输入 身份证" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">父母联系方式：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.parent_phone!''}" name="parent_phone" lay-verify="required|phone" lay-reqText="此信息不能为空"
                placeholder="请输入 父母联系方式" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">组织：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.organ!''}" name="organ" lay-verify="" lay-reqText="此信息不能为空" placeholder="请输入 组织"
                autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">技能：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.skill!''}" name="skill" lay-verify="" lay-reqText="此信息不能为空" placeholder="请输入 技能"
                autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">城市：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.city!''}" name="city" lay-verify="" lay-reqText="此信息不能为空" placeholder="请输入 城市"
                autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">省份：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.province!''}" name="province" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 省份" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">学号：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.sno!''}" name="sno" lay-verify="required|number" lay-reqText="此信息不能为空"
                placeholder="请输入 学号" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">年级：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.grade!''}" name="grade" lay-verify="required" lay-reqText="此信息不能为空"
                placeholder="请输入 年级" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">专业：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.major!''}" name="major" lay-verify="required" lay-reqText="此信息不能为空"
                placeholder="请输入 专业" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">寝室号：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.room_id!''}" name="room_id" lay-verify="required" lay-reqText="此信息不能为空"
                placeholder="请输入 寝室号" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">加入时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.join_time!''}" name="join_time" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input">
            </div>
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">签名：</label>
          <div class="layui-input-block">
            <textarea lay-verType="tips" placeholder="请输入 签名" class="layui-textarea" name="sign">${userData.sign!''}</textarea>
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">描述：</label>
          <div class="layui-input-block">
            <textarea lay-verType="tips" placeholder="请输入 描述" class="layui-textarea" name="description">${userData.description!''}</textarea>
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">备注：</label>
          <div class="layui-input-block">
            <textarea lay-verType="tips" placeholder="请输入 备注" class="layui-textarea" name="remark">${userData.remark!''}</textarea>
          </div>
        </div>
      </div>
    </fieldset>

<#--  
    <fieldset class="layui-elem-field">
      <legend>用户高级信息</legend>
      <div class="layui-field-box">

        <div class="layui-form-item">


          <div class="layui-inline">
            <label class="layui-form-label">ID：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.id!''}" name="id" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="该信息不可用" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">sessionid （临时）：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.sessionid!''}" name="sessionid" lay-verify=""
                lay-reqText="此信息不能为空" placeholder="该信息不可用 （临时）" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">用户名：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.username!''}" name="username" lay-verify="required" lay-reqText="此信息不能为空"
                placeholder="请输入 用户名" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="" name="password" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 新密码" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">安全配置：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.secureconf!''}" name="secureconf" lay-verify="required" lay-reqText="此信息不能为空"
                placeholder="请输入 安全配置" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
                  <label class="layui-form-label required">用户类型：</label>
                  <div class="layui-input-block">
                    <input type="checkbox" <#if 0==userData.usertype>checked</#if> name="usertype" lay-skin="switch"  lay-filter="" lay-verify="required"  lay-text="系统管理员|普通用户">
                  </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">创建者：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.creater!''}" name="creater" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 创建者" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">创建时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="<#if (userData.createtime)??>${userData.createtime?string['yyyy-MM-dd']!''}</#if>" name="createtime" lay-verify="" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input" disabled>
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">密码更新时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="<#if (userData.passupdatetime)??>${userData.passupdatetime?string['yyyy-MM-dd']!''}</#if>" name="passupdatetime" lay-verify="" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input" disabled>
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">更新时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="<#if (userData.updatetime)??>${userData.updatetime?string['yyyy-MM-dd']!''}</#if>" name="updatetime" lay-verify="" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input" disabled>
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">最后一次登录时间：</label>
            <div class="layui-input-block">
              <input type="text" name="lastlogintime" lay-verType="tips" value="<#if (userData.crealastlogintimetetime)??>${userData.lastlogintime?string['yyyy-MM-dd']!''}</#if>"  lay-verify="" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input" disabled>
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">登录状态：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.login!''}" name="login" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="该信息不可用" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">粉丝数量：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.fans!''}" name="fans" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="该信息不可用" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">关注数量：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.follows!''}" name="follows" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="该信息不可用" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">积分：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.integral!''}" name="integral" lay-verify="required|number" lay-reqText="此信息不能为空"
                placeholder="请输入 积分" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">行计数 （临时）：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.rowcount!''}" name="rowcount" lay-verify=""
                lay-reqText="此信息不能为空" placeholder="该信息不可用 （临时）" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">代理 （临时）：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.agent!''}" name="agent" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="该信息不可用 （临时）" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">key （临时）：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.key!''}" name="key" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="该信息不可用 （临时）" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">orgi：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="${userData.orgi!''}" name="orgi" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="该信息不可用" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.status!''}" name="status" lay-verify="" lay-reqText="此信息不能为空" placeholder="请输入 状态"
                autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">停用时间：</label>
            <div class="layui-input-block">
              <input type="text" disabled lay-verType="tips" value="<#if (userData.deactivetime)??>${userData.deactivetime?string['yyyy-MM-dd']!''}</#if>" name="deactivetime" lay-verify=""
                lay-reqText="此信息不能为空" placeholder="该信息不可用" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label required">成员等级：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${userData.rank!''}" name="rank" lay-verify="required" lay-reqText="此信息不能为空"
                placeholder="请输入 成员等级" autocomplete="off" class="layui-input">
            </div>
          </div>
        </div>
      </div>
    </fieldset>
  -->





						<#--  <div class="layui-form-item" style="margin-bottom:0px;">
							<label for="L_email" class="layui-form-label">昵称</label>
							<div class="layui-input-inline">
								<div class="layui-form-mid">
								${userData.email!''}
							</div>
							</div>
							
						</div>
						<div class="layui-form-item">
							<label for="L_email" class="layui-form-label"></label>
							<div class="layui-form-mid layui-word-aux" style="padding-top:0px;">
								注册邮箱如需要修改，请联系系统管理员。
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_city" class="layui-form-label">昵称</label>
							<div class="layui-input-inline">
								<input type="text" id="L_username" name="username" autocomplete="off"
									value="${userData.username!''}" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_username" class="layui-form-label required">性别</label>
							
							<div class="layui-input-block">
								<input type="radio" name="gender" value="0" <#if userData.gender?? && userData.gender == "0">checked</#if> title="男">
								<input type="radio" name="gender" value="1" <#if userData.gender?? && userData.gender == "1">checked</#if> title="女">
								<input type="radio" name="gender" value="2" <#if !(userData.gender??) || userData.gender == "2">checked</#if> title="保密">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_city" class="layui-form-label">手机号码</label>
							<div class="layui-input-inline">
								<input type="text" id="L_mobile" name="mobile" autocomplete="off"
									value="${userData.mobile!''}" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_city" class="layui-form-label">省份</label>
							<div class="layui-input-inline">
								<input type="text" id="L_province" name=province autocomplete="off"
									value="${userData.province!''}" class="layui-input">
							</div>
							<div class="layui-inline">
							    <label class="layui-form-label">城市</label>
							    <div class="layui-input-inline" >
							      <input type="text" name="city" autocomplete="off" value="${userData.city!''}" class="layui-input">
							    </div>
							  </div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label for="L_sign" class="layui-form-label">签名</label>
							<div class="layui-input-block">
								<textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="memo"
									autocomplete="off" class="layui-textarea" style="height: 80px;">${userData.memo!''}</textarea>
							</div>
						</div>  -->


						<div class="layui-form-item">
							<label for="L_sign" class="layui-form-label"></label>
							<div class="layui-input-block">
								<button class="layui-btn" key="set-mine" lay-filter="update_user_info"
									lay-submit>确认修改</button>
							</div>
						</div>
					</form>
				</div>

				<div class="layui-tab-item <#if t?? && t == 'avator'>layui-show</#if>">
					<form method="post" action="/user/profile/avator" name="avatorForm" class="layui-form" enctype="multipart/form-data">
					<div class="layui-form layui-form-pane mine-view"
						style="display: block;">
						<div class="layui-form-item">
							<div class="avatar-add">
								<p>建议尺寸168*168，支持jpg、png、gif，最大不能超过1024KB</p>
								<div class="upload-img">
									<div class="layui-box layui-upload-button">
										<form method="post" target="layui-upload-iframe"
											key="set-mine" enctype="multipart/form-data"
											action="/user/upload/">
											<input type="file" name="avator" id="LAY-avator" lay-title="上传头像" onchange="avatorForm.submit()">
										</form>
										<span class="layui-upload-icon"><i class="layui-icon"></i>上传头像</span>
									</div>
								</div>
								<img src="/res/image/${userData.id!''}">
								<span class="loading"></span>
							</div>
						</div>
					</div>
					</form>
				</div>

				<div class="layui-tab-item">
					<form method="post" action="/user/profile/changepasswd" name="passwdForm" class="layui-form">
				    <div class="layui-form-item">
              <label class="layui-form-label required">当前密码</label>
              <div class="layui-input-inline">
                <input type="password" lay-verType="tips" value="" name="oldpasswd" lay-verify="required" lay-reqText="此信息不能为空"
                  placeholder="请输入 当前密码" autocomplete="off" class="layui-input">
              </div>
            </div>
				    <div class="layui-form-item">
              <label class="layui-form-label required">新密码</label>
              <div class="layui-input-inline">
                <input type="password" lay-verType="tips" value="" id="passwd" name="passwd" lay-verify="required|passwd" lay-reqText="此信息不能为空"
                  placeholder="请输入 新密码 至少8位" autocomplete="off" class="layui-input">
              </div>
            </div>
				    <div class="layui-form-item">
              <label class="layui-form-label required">确认密码</label>
              <div class="layui-input-inline">
                <input type="password" lay-verType="tips" value="" name="" lay-verify="required|confirmpasswd" lay-reqText="此信息不能为空"
                  placeholder="请输入 确认密码" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" key="set-mine" lay-filter="changepasswd" lay-submit="">确认修改</button>
            </div>
					</form>
				</div>


			</div>
		</div>
	</div>
</div>
<script>
	layui.use(['element','form'], function(){
	  var element = layui.element , form = layui.form;
	});
	layui.use('layer', function(){
	  var layer = layui.layer;
	  <#if msg?? && msg == '0'>
		layer.alert('用户名已经存在，请重新填写', {icon: 2});
	  <#elseif msg?? && msg == '1'>
		layer.alert('用户信息修改成功！', {icon: 1}); 
	  <#elseif msg?? && msg == '2'>
		layer.alert('原始密码错误！', {icon: 2}); 
	  </#if>
	});  

      layui.use(['laydate','form','jquery'], function () {
        layui.form.render();
        [
          //'input[name="createtime"]',
          //'input[name="passupdatetime"]',
          //'input[name="updatetime"]',
          //'input[name="lastlogintime"]',
          'input[name="birthday"]',
          'input[name="join_time"]',
        ].forEach(function (ele) {
          layui.laydate.render({
            elem: ele
            , format: 'yyyy-MM-dd'
          });
        });
        layui.form.on('submit(update_user_info)', function(data){
          let  usertype=layui.$('input[name="usertype"]', data.form)[0];
          usertype.value=usertype.checked?0:1;
          usertype.checked=true;
        });
        layui.form.verify({
            passwd : function(value, item){
                if(value.length < 8){
                    return "密码长度不能小于8位";
                }
            },
            confirmpasswd : function(value, item){
                if(layui.$("#passwd").val()!==value){
                    return "两次输入密码不一致，请重新输入！";
                }
            }
        })

      });



</script>