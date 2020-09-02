
<table class="layui-table" lay-filter="${parent_id_prifix!''}project_list"  id="${parent_id_prifix!''}project_list"  lay-skin="line">
    <colgroup>
        <col width="12%">
        <col width="15%">
        <col width="15%">
        <col width="15%">
        <col width="8%">
        <col width="15%">
        <col width="15%">
        <col width="1%">
    <col>
    </colgroup>
    <thead>
    <tr>
        <#if ! is_in_profile_page >
        <th lay-data="{field:'id', minWidth:80, sort:false}" >ID</th>
        </#if>
        <th lay-data="{field:'name', minWidth:140, sort:true}" >项目名称</th>
        <th lay-data="{field:'principal', minWidth:120, sort:true}" >项目负责人</th>
        <th lay-data="{field:'match', minWidth:80, sort:true}" >项目比赛</th>
        <th lay-data="{field:'progress', minWidth:80, sort:true}" >项目进度</th>
        <th lay-data="{field:'description', minWidth:40, sort:true}" >描述</th>
        <#if ! is_in_profile_page >
        <th lay-data="{field:'remark', minWidth:100, sort:true}" >备注</th>
        </#if>
        <#if user?? && (user.usertype=='0' || FtlTool.isProjectMember(projectList,user.id))>
        <th lay-data="{field:'operation', minWidth:<#if ! is_in_profile_page >150<#else>80</#if>, sort:false}"  style="white-space:nowrap;" nowrap="nowrap">操作</th>
        </#if>
    </tr> 
    </thead>
    <tbody>
        <#if projectList??>
        <#list projectList as project>
        <tr>
        <#if ! is_in_profile_page >
            <td>${project.id!''}</td>
        </#if>
            <#if is_in_profile_page >
            <td><a href="/user/index/${userData.id!''}?tab=project&project_id=${project.id}" <#if ! is_in_profile_page > target="_blank" </#if> >${project.name!''}</a></td>
            <#else>
            <td><a href="/user/index/${project.principal.id!''}?tab=project&project_id=${project.id}" <#if ! is_in_profile_page > target="_blank" </#if> >${project.name!''}</a></td>
            </#if>
            <td>
                <a href="/user/index/${project.principal.id!''}?tab=user" <#if ! is_in_profile_page > target="_blank" </#if>>${project.principal.name!''}</a>
            </td>
            <td>${project.match!''}</td>
            <td>${project.progress!''}</td>
            <td>${(project.description!'')?truncate(24,'...')}</td>
        <#if ! is_in_profile_page >
            <td>${(project.remark!'')?truncate(24,'...')}</td>
        </#if>
            <#if user?? && ( user.usertype=='0' || project.isMember(user.id))>
            <td style="white-space:nowrap;" nowrap="nowrap">
                <a href="/admin/project/edit?id=${project.id!''}" data-toggle="ajax" data-width="1000" data-height="600" data-title="编辑用户信息">
                    <i class="layui-icon">&#xe642;</i>
                    编辑
                </a>
        <#if ! is_in_profile_page >
                <a href="/admin/project/delete?id=${project.id!''}" style="margin-left:10px;" data-toggle="tip" data-title="请确认是否删除记录？">
                    <i class="layui-icon" style="color:red;">&#x1006;</i>
                    删除
                </a>
        </#if>
            </td>
            <#elseif user?? && FtlTool.isProjectMember(projectList,user.id) >
            <td style="white-space:nowrap;" nowrap="nowrap">
                没有编辑权限
            </td>
            </#if>
        </tr>
        </#list>
        </#if>
    </tbody>
</table>

<script>
layui.use('table',function(){
    layui.table.init('${parent_id_prifix!''}project_list',{
        limit: <#if projectList??>${projectList?size}<#else>0</#if>,
        skin: 'row',
        size: 'lg' ,
        even: true
    });
})
</script>