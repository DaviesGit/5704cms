
<table class="layui-table" lay-filter="${parent_id_prifix!''}achievement_list"  id="${parent_id_prifix!''}achievement_list"  lay-skin="line">
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
        <th lay-data="{field:'name', minWidth:140, sort:true}" >成果名称</th>
        <th lay-data="{field:'type', minWidth:80, sort:true}" >成果类型</th>
        <th lay-data="{field:'number', minWidth:80, sort:true}" >成果编号</th>
        <th lay-data="{field:'progress', minWidth:80, sort:true}" >成果进度</th>
        <th lay-data="{field:'description', minWidth:40, sort:true}" >描述</th>
        <#if ! is_in_profile_page >
        <th lay-data="{field:'remark', minWidth:100, sort:true}" >备注</th>
        </#if>
        <#if user?? && (user.usertype=='0' || FtlTool.isAchievementMember(achievementList,user.id))>
        <th lay-data="{field:'operation', minWidth:<#if ! is_in_profile_page >150<#else>80</#if>, sort:false}"  style="white-space:nowrap;" nowrap="nowrap">操作</th>
        </#if>
    </tr> 
    </thead>
    <tbody>
        <#if achievementList??>
        <#list achievementList as achievement>
        <tr>
        <#if ! is_in_profile_page >
            <td>${achievement.id!''}</td>
        </#if>
            <#if is_in_profile_page >
            <td><a href="/user/index/${userData.id!''}?tab=achievement&achievement_id=${achievement.id}" <#if ! is_in_profile_page > target="_blank" </#if> >${achievement.name!''}</a></td>
            <#else>
                <#if (achievement.users[0])??>
                <td><a href="/user/index/${(achievement.users[0].id)!''}?tab=achievement&achievement_id=${achievement.id}" <#if ! is_in_profile_page > target="_blank" </#if> >${achievement.name!''}</a></td>
                <#else>
                <td><a href="javascript:void(0);" <#if ! is_in_profile_page > target="_blank" </#if> >${achievement.name!''}</a></td>
                </#if>
            </#if>
            <td>${achievement.type!''}</td>
            <td>${achievement.number!''}</td>
            <td>${achievement.progress!''}</td>
            <td>${(achievement.description!'')?truncate(24,'...')}</td>
        <#if ! is_in_profile_page >
            <td>${(achievement.remark!'')?truncate(24,'...')}</td>
        </#if>
            <#if user?? && (user.usertype=='0' || achievement.isMember(user.id))>
            <td style="white-space:nowrap;" nowrap="nowrap">
                <a href="/admin/achievement/edit?id=${achievement.id!''}" data-toggle="ajax" data-width="1000" data-height="600" data-title="编辑用户信息">
                    <i class="layui-icon">&#xe642;</i>
                    编辑
                </a>
        <#if ! is_in_profile_page >
                <a href="/admin/achievement/delete?id=${achievement.id!''}" style="margin-left:10px;" data-toggle="tip" data-title="请确认是否删除记录？">
                    <i class="layui-icon" style="color:red;">&#x1006;</i>
                    删除
                </a>
        </#if>
            </td>
            <#elseif user?? && FtlTool.isAchievementMember(achievementList,user.id) >
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
    layui.table.init('${parent_id_prifix!''}achievement_list',{
        limit: <#if achievementList??>${achievementList?size}<#else>0</#if>,
        skin: 'row',
        size: 'lg' ,
        even: true
    });
})
</script>