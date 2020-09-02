

<#assign is_super_user=user.usertype?? && user.usertype == "0">
<table class="layui-table" lay-filter="${parent_id_prifix!''}user_list" id="${parent_id_prifix!''}user_list" lay-skin="line">
    <colgroup>
        <col width="30%">
        <col width="15%">
        <col width="14%">
        <col width="7%">
        <col width="7%">
        <col width="7%">
        <col width="20%">
        <col width="1%">
    <col>
    </colgroup>
    <thead>
    <tr>
        <th lay-data="{field:'username', minWidth:160, sort:false}" >用户</th>
        <th lay-data="{field:'name', minWidth:80, sort:true}" >姓名</th>
        <th lay-data="{field:'email', minWidth:140, sort:true}" >电子邮件</th>
        <#if ! is_in_profile_page >
        <th lay-data="{field:'mobile', minWidth:120, sort:true}" >手机</th>
        </#if>
        <th lay-data="{field:'province', minWidth:80, sort:true}" >省份</th>
        <#if ! is_in_profile_page >
        <th lay-data="{field:'city', minWidth:80, sort:true}" >城市</th>
        </#if>
        <th lay-data="{field:'usertype', minWidth:40, sort:true}" >管理员</th>
        <#if ! is_in_profile_page >
        <th lay-data="{field:'createtime', minWidth:100, sort:true}" >注册时间</th>
        </#if>
            <#if is_super_user>
        <th lay-data="{field:'operation', minWidth:<#if ! is_in_profile_page >150<#else>80</#if>, sort:false}"  style="white-space:nowrap;" nowrap="nowrap">操作</th>
            </#if>
    </tr> 
    </thead>
    <tbody>
        <#if userList??>
        <#list userList as user>
        <tr>
            <td>
                <a href="/user/index/${user.id!''}?tab=user" <#if ! is_in_profile_page > target="_blank" </#if> >
                    <img src="/res/image/${user.id!''}" class="f5704-admin-avatar" onerror="this.src='/images/user/default.png'">
                    <div style="margin-left:50px;margin-top:0px; line-height: normal;">
                        ${user.nickname!user.name!user.username!''}
                        <div style="color:#aaaaaa;font-size:12px;">
                            <#if user.lastlogintime>
                            最近登陆：${user.lastlogintime?string('yyyy-MM-dd HH:mm:ss')}
                            </#if>
                        </div>
                    </div>
                </a>
                
            </td>
            <td>${user.name!''}</td>
            <td>${user.email!''}</td>
        <#if ! is_in_profile_page >
            <td>${user.mobile!''}</td>
        </#if>
            <td>${user.province!''}</td>
        <#if ! is_in_profile_page >
            <td>${user.city!''}</td>
        </#if>
            <td>
            <#if user.usertype?? && user.usertype == "0">
                <i class="layui-icon" style="color:#19a55d;">&#xe679;</i>
            <#else>
                <i class="layui-icon" style="color:red;">&#x1006;</i>
            </#if>
            </td>
        <#if ! is_in_profile_page >
            <td>${(user.createtime?string['yyyy-MM-dd'])!''}</td>
        </#if>
            <#if is_super_user>
            <td style="white-space:nowrap;" nowrap="nowrap">
                <a href="/admin/user/edit?id=${user.id!''}" data-toggle="ajax" data-width="1000" data-height="600" data-title="编辑用户信息">
                    <i class="layui-icon">&#xe642;</i>
                    编辑
                </a>
        <#if ! is_in_profile_page >
                <a href="/admin/user/delete?id=${user.id!''}" style="margin-left:10px;" data-toggle="tip" data-title="请确认是否删除记录？">
                    <i class="layui-icon" style="color:red;">&#x1006;</i>
                    删除
                </a>
        </#if>
            </td>
            </#if>
        </tr>
        </#list>
        </#if>
    </tbody>
</table>
<script>
layui.use('table',function(){
    layui.table.init('${parent_id_prifix!''}user_list',{
        limit: <#if userList??>${userList?size}<#else>0</#if>,
        skin: 'row',
        size: 'lg' ,
        even: true
    });
})
</script>

