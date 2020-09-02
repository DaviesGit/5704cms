<div class="f5704-layui-form">
	<form id="add_project_form" method="post" class="layui-form f5704-form" action="/admin/project/save">

    <fieldset class="layui-elem-field">
      <legend>添加项目</legend>
      <div class="layui-field-box">

        <div class="layui-form-item">
          <label class="layui-form-label">ID：</label>
          <div class="layui-input-block">
            <input type="text" disabled lay-verType="tips" value="${projectData.id!''}" name="id" lay-verify="" lay-reqText="此信息不能为空"
              placeholder="该信息不可用" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label required">项目名称：</label>
          <div class="layui-input-block">
            <input type="text" lay-verType="tips" value="${projectData.name!''}" name="name" lay-verify="required" lay-reqText="此信息不能为空"
              placeholder="请输入 项目名称" autocomplete="off" class="layui-input">
          </div>
        </div>


        <#--  <div class="layui-form-item">
          <label class="layui-form-label required">项目负责人：</label>
          <div class="layui-input-block">
            <input type="text" lay-verType="tips" value="${projectData.principal!''}" name="principal" lay-verify="required" lay-reqText="此信息不能为空"
              placeholder="请输入 学号" autocomplete="off" class="layui-input">
          </div>
        </div>  -->


        <div class="layui-form-item" style="padding: 0px 100px;">
            <input type="hidden" name="principal">
            <script type="text/html" id="principal_table_tools">
              <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>
            <div class="demoTable">
              项目负责人：
              <div class="layui-inline">
                <input class="layui-input" id="principal_search_input" autocomplete="off">
              </div>
              <button type='button' class="layui-btn" data-type="reload" id="principal_search">搜索</button>
            </div>
            <table lay-filter="principal_user_list" id="principal_user_list" >
              <#--  <thead>
                <tr>
                  <th lay-data="{field:'name', minWidth:100, sort:false}" >姓名</th>
                  <th lay-data="{field:'sno', minWidth:140, sort:true}" >学号</th>
                  <th lay-data="{field:'grade', minWidth:100, sort:true}" >年级</th>
                  <th lay-data="{field:'major', minWidth:60, sort:true}" >专业</th>
                  <th lay-data="{field:'skill', minWidth:100, sort:true}" >技能</th>
                  <th lay-data="{field:'sign', minWidth:100, sort:true}" >签名</th>
                  <th lay-data="{field:'operation', minWidth:60, sort:false ,toolbar: '#principal_table_tools'}"  style="white-space:nowrap;" nowrap="nowrap">操作</th>
                </tr> 
              </thead>
              <tbody>
                <tr>
                  <td>${user.name!''}</td>
                  <td>${user.sno!''}</td>
                  <td>${user.grade!''}</td>
                  <td>${user.major!''}</td>
                  <td>${user.skill!''}</td>
                  <td>${user.sign!''}</td>
                  <td></td>
                </tr>
              </tbody>  -->
            </table>
        </div>
        <script>
          layui.use(['table','jquery','layer'],function(){
            layui.table.on('tool(principal_user_list)', function(obj){
              var data = obj.data;
              if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
              } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                  obj.del();
                  layer.close(index);
                  for(let i=0,len=principal_user_list.length;i<len;++i)
                    if(principal_user_list[i].id===data.id){
                      principal_user_list.splice(i,1);
                      break;
                    }
                });
              } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
              }
            });
            let principal_user_list=[
              <#if (projectData.principal)??> 
                {
                    id:'${projectData.principal.id!''}',
                    name:'${projectData.principal.name!''}',
                    sno:'${projectData.principal.sno!''}',
                    grade:'${projectData.principal.grade!''}',
                    major:'${projectData.principal.major!''}',
                    skill:'${projectData.principal.skill!''}',
                    sign:'${projectData.principal.sign!''}',
                },
              </#if>
              ];
            layui.table.render({
                elem:'#principal_user_list',
                data:principal_user_list,
                cols:[[
                  {field:'name',title:'姓名', minWidth:80, sort:false},
                  {field:'sno',title:'学号', minWidth:120, sort:true},
                  {field:'grade',title:'年级', minWidth:80, sort:true},
                  {field:'major',title:'专业', minWidth:60, sort:true},
                  {field:'skill',title:'技能', minWidth:100, sort:true},
                  {field:'sign',title:'签名', minWidth:100, sort:true},
                  {field:'operation',title:'操作', minWidth:40, sort:false ,toolbar: '#principal_table_tools'},
                ]],
                limit:99,
                skin: 'row',
                size: 'sm' ,
                even: true,
            });
            layui.$('#principal_search').click(function(){
              let keyword=$('#principal_search_input').val();
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
                    layui.table.reload('principal_user_list',{
                      data:(principal_user_list=[obj.data]),
                    });
                    $('#principal_search_input').val('');
                    layui.layer.close(index);
                  });
                },
                error:function(data){
                  layui.layer.msg('系统接口错误！');
                }
              })
            });
            
            layui.$('#add_project_form').submit( function(data){
              $('[name="principal"]').val(principal_user_list[0].id);
            });
          });
        </script>




        <div class="layui-form-item">

        </div>

        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">项目比赛：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${projectData.match!''}" name="match" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 项目比赛" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">项目进度：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${projectData.progress!''}" name="progress" lay-verify="" lay-reqText="此信息不能为空"
                placeholder="请输入 项目进度" autocomplete="off" class="layui-input">
            </div>
          </div>
        </div>

        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">开始时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${projectData.begin!''}" name="begin" lay-verify="date_null" lay-reqText="此信息不能为空" placeholder="yyyy-MM-dd" autocomplete="off"
                class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">结束时间：</label>
            <div class="layui-input-block">
              <input type="text" lay-verType="tips" value="${projectData.end!''}" name="end" lay-verify="date_null" lay-reqText="此信息不能为空" placeholder="yyyy-MM-dd" autocomplete="off"
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
              <#--  <thead>
                <tr>
                  <th lay-data="{field:'name', minWidth:100, sort:false}" >姓名</th>
                  <th lay-data="{field:'sno', minWidth:140, sort:true}" >学号</th>
                  <th lay-data="{field:'grade', minWidth:100, sort:true}" >年级</th>
                  <th lay-data="{field:'major', minWidth:60, sort:true}" >专业</th>
                  <th lay-data="{field:'skill', minWidth:100, sort:true}" >技能</th>
                  <th lay-data="{field:'sign', minWidth:100, sort:true}" >签名</th>
                  <th lay-data="{field:'operation', minWidth:60, sort:false ,toolbar: '#users_table_tools'}"  style="white-space:nowrap;" nowrap="nowrap">操作</th>
                </tr> 
              </thead>
              <tbody>
                <tr>
                  <td>${user.name!''}</td>
                  <td>${user.sno!''}</td>
                  <td>${user.grade!''}</td>
                  <td>${user.major!''}</td>
                  <td>${user.skill!''}</td>
                  <td>${user.sign!''}</td>
                  <td></td>
                </tr>
              </tbody>  -->
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
                <#if projectData.users??>
                <#list projectData.users as user>
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
            layui.$('#add_project_form').submit(function(data){
              let user_sno=[];
              for (let user of users_user_list){
                user_sno.push(user.id);
              }
              $('[name="users"]').val(JSON.stringify(user_sno));
            });
          });
        </script>

        <div class="layui-form-item">
          <label class="layui-form-label">描述：</label>
          <div class="layui-input-block">
            <textarea lay-verType="tips" placeholder="请输入 描述" class="layui-textarea" name="description">${projectData.description!''}</textarea>
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">备注：</label>
          <div class="layui-input-block">
            <textarea lay-verType="tips" placeholder="请输入 备注" class="layui-textarea" name="remark">${projectData.remark!''}</textarea>
          </div>
        </div>

        <script type="text/html" id="search_table_tools">
          <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="select">选择</a>
        </script>

      </div>
    </fieldset>


	  <div class="layui-form-button">
	    <div class="layui-button-block">
	      <button class="layui-btn" lay-submit lay-filter="add_project">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
</div>
 
<script>
      layui.use(['laydate','form','jquery'], function () {
        layui.form.render();
        [
          'input[name="begin"]',
          'input[name="end"]',
        ].forEach(function (ele) {
          layui.laydate.render({
            elem: ele
            , format: 'yyyy-MM-dd'
          });
        });
      });
</script>