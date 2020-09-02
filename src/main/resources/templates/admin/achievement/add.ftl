<div class="f5704-layui-form">
	<form id="add_achievement_form" method="post" class="layui-form f5704-form" action="/admin/achievement/save">

    <fieldset class="layui-elem-field">
      <legend>添加成果</legend>
      <div class="layui-field-box">

        <div class="layui-form-item">
          <label class="layui-form-label">ID：</label>
          <div class="layui-input-block">
            <input type="text" disabled lay-verType="tips" value="${achievementData.id!''}" name="id" lay-verify="" lay-reqText="此信息不能为空"
              placeholder="该信息不可用" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label required">成果名称：</label>
          <div class="layui-input-block">
            <input type="text" lay-verType="tips" value="${achievementData.name!''}" name="name" lay-verify="required" lay-reqText="此信息不能为空"
              placeholder="请输入 成果名称" autocomplete="off" class="layui-input">
          </div>
        </div>



        <div class="layui-form-item">

        </div>

        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">成果类型：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${achievementData.type!''}" name="type" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 成果类型" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">成果编号：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${achievementData.number!''}" name="number" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 成果编号" autocomplete="off" class="layui-input">
            </div>
          </div>
        </div>


        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">成果进度：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${achievementData.progress!''}" name="progress" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 成果进度" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">申请时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${achievementData.apply_time!''}" name="apply_time" lay-verify="date_null" lay-reqText="此信息不能为空" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input">
            </div>
          </div>
        </div>

        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">受理时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${achievementData.accept_time!''}" name="accept_time" lay-verify="date_null" lay-reqText="此信息不能为空" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">授权时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${achievementData.authorize_time!''}" name="authorize_time" lay-verify="date_null" lay-reqText="此信息不能为空" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input">
            </div>
          </div>
        </div>


        <div class="layui-form-item" style="padding: 0px 100px;">
            <input type="hidden" name="users">
            <script type="text/html" id="users_table_tools">
              <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>
            <div class="demoTable">
              添加成员：
              <div class="layui-inline">
                <input class="layui-input" id="users_search_input" autocomplete="off">
              </div>
              <button type='button' class="layui-btn" data-type="reload" id="users_search">搜索</button>
            </div>
            <table lay-filter="users_user_list" id="users_user_list" >
            </table>
        </div>
        <script>
          layui.use(['table','jquery','layer'],function(){
            layui.table.on('tool(users_user_list)', function(obj){
              var data = obj.data;
              if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
              } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                  obj.del();
                  layer.close(index);
                  for(let i=0,len=users_user_list.length;i<len;++i)
                    if(users_user_list[i].id===data.id){
                      users_user_list.splice(i,1);
                      break;
                    }
                });
              } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
              }
            });
            let users_user_list=[
                <#if achievementData.users??>
                <#list achievementData.users as user>
                  {
                      id:'${user.id!''}',
                      name:'${user.name!''}',
                      sno:'${user.sno!''}',
                      grade:'${user.grade!''}',
                      major:'${user.major!''}',
                      skill:'${user.skill!''}',
                      sign:'${user.sign!''}',
                  },
                </#list>
                </#if>
              ];
            layui.table.render({
                elem:'#users_user_list',
                data:users_user_list,
                cols:[[
                  {field:'name',title:'姓名', minWidth:80, sort:false},
                  {field:'sno',title:'学号', minWidth:120, sort:true},
                  {field:'grade',title:'年级', minWidth:80, sort:true},
                  {field:'major',title:'专业', minWidth:60, sort:true},
                  {field:'skill',title:'技能', minWidth:100, sort:true},
                  {field:'sign',title:'签名', minWidth:100, sort:true},
                  {field:'operation',title:'操作', minWidth:40, sort:false ,toolbar: '#users_table_tools'},
                ]],
                limit:99,
                skin: 'row',
                size: 'sm' ,
                even: true,
            });
            layui.$('#users_search').click(function(){
              let keyword=$('#users_search_input').val();
              layui.$.ajax({url:'/api/searchuser',method:'post',data:{keyword:keyword},
                success:function(data){
                  if(!data||data.status)
                    return layui.layer.msg('未找到指定成员！');

                  let index=layui.layer.open({
                    type: 1,
                    skin: "layui-layer-rim",
                    area: ["900px", "500px"],
                    content:
                      '\
                      <fieldset class="layui-elem-field">\
                          <legend>选择成员</legend>\
                          <div class="layui-field-box">\
                              <table lay-filter="search_user_list" id="search_user_list"></table>\
                          </div>\
                      </fieldset>'
                  });
                  layui.table.render({
                    elem: "#search_user_list",
                    data: data.data,
                    cols: [
                      [
                        { field: "name", title: "姓名", minWidth: 80, sort: false },
                        { field: "sno", title: "学号", minWidth: 120, sort: true },
                        { field: "grade", title: "年级", minWidth: 80, sort: true },
                        { field: "major", title: "专业", minWidth: 60, sort: true },
                        { field: "skill", title: "技能", minWidth: 100, sort: true },
                        { field: "sign", title: "签名", minWidth: 100, sort: true },
                        {
                          field: "operation",
                          title: "操作",
                          minWidth: 40,
                          sort: false,
                          toolbar: "#search_table_tools"
                        }
                      ]
                    ],
                    limit: 99,
                    skin: "row",
                    size: "sm",
                    even: true
                  });
                  layui.table.on("tool(search_user_list)", function(obj) {
                    if (obj.event !== "select") {
                      return;
                    }
                    users_user_list.push(obj.data);
                    layui.table.reload('users_user_list',{
                      data:users_user_list,
                    });
                    $('#users_search_input').val('');
                    layui.layer.close(index);
                  });
                },
                error:function(data){
                  layui.layer.msg('系统接口错误！');
                }
              })
            });
            layui.$('#add_achievement_form').submit(function(data){
              let user_sno=[];
              for (let user of users_user_list){
                user_sno.push(user.id);
              }
              $('[name="users"]').val(JSON.stringify(user_sno));
            });
          });
        </script>


        <div class="layui-form-item" style="padding: 0px 100px;">
            <input type="hidden" name="projects">
            <script type="text/html" id="projects_table_tools">
              <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>
            <div class="demoTable">
              添加项目：
              <div class="layui-inline">
                <input class="layui-input" id="projects_search_input" autocomplete="off">
              </div>
              <button type='button' class="layui-btn" data-type="reload" id="projects_name_search">搜索</button>
            </div>
            <table lay-filter="projects_project_list" id="projects_project_list" >
            </table>
        </div>
        <script>
          layui.use(['table','jquery','layer'],function(){
            layui.table.on('tool(projects_project_list)', function(obj){
              var data = obj.data;
              if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
              } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                  obj.del();
                  layer.close(index);
                  for(let i=0,len=projects_project_list.length;i<len;++i)
                    if(projects_project_list[i].id===data.id){
                      projects_project_list.splice(i,1);
                      break;
                    }
                });
              } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
              }
            });
            let projects_project_list=[
                <#if achievementData.projects??>
                <#list achievementData.projects as project>
                  {
                      id:'${project.id!''}',
                      name:'${project.name!''}',
                      principal_name:'${project.principal.name!''}',
                      match:'${project.match!''}',
                      progress:'${project.progress!''}',
                  },
                </#list>
                </#if>
              ];
            layui.table.render({
                elem:'#projects_project_list',
                data:projects_project_list,
                cols:[[
                  {field:'name',title:'项目名称', minWidth:120, sort:true},
                  {field:'principal_name',title:'项目负责人', minWidth:80, sort:true},
                  {field:'match',title:'项目比赛', minWidth:60, sort:true},
                  {field:'progress',title:'项目进度', minWidth:100, sort:true},
                  {field:'operation',title:'操作', minWidth:40, sort:false ,toolbar: '#projects_table_tools'},
                ]],
                limit:99,
                skin: 'row',
                size: 'sm' ,
                even: true,
            });
            layui.$('#projects_name_search').click(function(){
              let keyword=$('#projects_search_input').val();
              layui.$.ajax({url:'/api/searchproject',method:'post',data:{keyword:keyword},
                success:function(data){
                  if(!data||data.status)
                    return layui.layer.msg('未找到指定项目！');

                  let index=layui.layer.open({
                    type: 1,
                    skin: "layui-layer-rim",
                    area: ["900px", "500px"],
                    content:
                      '\
                      <fieldset class="layui-elem-field">\
                          <legend>选择项目</legend>\
                          <div class="layui-field-box">\
                              <table lay-filter="search_project_list" id="search_project_list"></table>\
                          </div>\
                      </fieldset>'
                  });
                  layui.table.render({
                      elem:'#search_project_list',
                      data:data.data,
                      cols:[[
                        {field:'name',title:'项目名称', minWidth:120, sort:true},
                        {field:'principal_name',title:'项目负责人', minWidth:80, sort:true},
                        {field:'match',title:'项目比赛', minWidth:60, sort:true},
                        {field:'progress',title:'项目进度', minWidth:100, sort:true},
                        {field:'operation',title:'操作', minWidth:40, sort:false ,toolbar: '#search_table_tools'},
                      ]],
                      limit:99,
                      skin: 'row',
                      size: 'sm' ,
                      even: true,
                  });
                  layui.table.on("tool(search_project_list)", function(obj) {
                    if (obj.event !== "select") {
                      return;
                    }
                    projects_project_list.push(obj.data);
                    layui.table.reload('projects_project_list',{
                      data:projects_project_list,
                    });
                    $('#projects_search_input').val('');
                    layui.layer.close(index);
                  });
                },
                error:function(data){
                  layui.layer.msg('系统接口错误！');
                }
              })
            });
            layui.$('#add_achievement_form').submit(function(data){
              let project_id=[];
              for (let project of projects_project_list){
                project_id.push(project.id);
              }
              $('[name="projects"]').val(JSON.stringify(project_id));
            });
          });
        </script>


        <div class="layui-form-item">
          <label class="layui-form-label">描述：</label>
          <div class="layui-input-block">
            <textarea lay-verType="tips" placeholder="请输入 描述" class="layui-textarea" name="description">${achievementData.description!''}</textarea>
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">备注：</label>
          <div class="layui-input-block">
            <textarea lay-verType="tips" placeholder="请输入 备注" class="layui-textarea" name="remark">${achievementData.remark!''}</textarea>
          </div>
        </div>

        <script type="text/html" id="search_table_tools">
          <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="select">选择</a>
        </script>

      </div>
    </fieldset>


	  <div class="layui-form-button">
	    <div class="layui-button-block">
	      <button class="layui-btn" lay-submit lay-filter="add_achievement">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
</div>
 
<script>
      layui.use(['laydate','form','jquery'], function () {
        layui.form.render();
        [
          'input[name="apply_time"]',
          'input[name="accept_time"]',
          'input[name="authorize_time"]',
        ].forEach(function (ele) {
          layui.laydate.render({
            elem: ele
            , format: 'yyyy-MM-dd'
          });
        });
      });
</script>