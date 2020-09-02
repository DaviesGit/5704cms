<h2 class="page-title">
	基本信息
</h2>
<ul class="home-info" style="padding-top:0px;">

	<#if userData.join_time??><li><i class="iconfont icon-shijian"></i>加入时间：<span>${userData.join_time}</span></li></#if>
	<li><i class="iconfont icon-biaoqing"></i>昵称：<span>${userData.nickname!userData.name!userData.username!''}</span></li>
	<li><i class="iconfont icon-jiazaizhong"></i>姓名：<span>${userData.name!''}</span></li>
	<li><i class="iconfont <#switch userData.gender><#case '男'>icon-nan<#break><#case '女'>icon-nv<#break><#default>icon-guanbi</#switch>"></i>性别：<span>${userData.gender!''}</span></li>
	<li><i class="iconfont icon-top"></i>年级：<span>${userData.grade!''}</span></li>
	<li><i class="iconfont icon-shui"></i>专业：<span>${userData.major!''}</span></li>
	<#--  <li><i class="iconfont icon-logo"></i>学号：<span>${userData.sno!''}</span></li>  -->
	<#--  <li><i class="iconfont icon-shouye"></i>寝室号：<span>${userData.room_id!''}</span></li>  -->
	<#--  <li><i class="iconfont icon-svgmoban53"></i>邮箱：<span>${userData.email!''}</span></li>  -->
	<#--  <li><i class="iconfont icon-charushuipingxian"></i>成员等级：<span>${userData.rank!''}</span></li>  -->
	<li><i class="iconfont icon-daima"></i>技能：<span>${userData.skill!''}</span></li>
	<li><i class="iconfont icon-renshu"></i>头衔：<span>${userData.title!''}</span></li>
	<li><i class="iconfont icon-yulan"></i>项目：<span>${(userData.projects?size)!'0'}</span></li>
	<li><i class="iconfont icon-zan1"></i>成果：<span>${(userData.achievement?size)!'0'}</span></li>
	<#--  <li><i class="iconfont icon-404"></i>生日：<span>${userData.birthday!''}</span></li>  -->
	<li><i class="iconfont icon-shichang"></i>部门：<span>${userData.department!''}</span></li>
	<#--  <li><i class="iconfont icon-quitquanping"></i>组织：<span>${userData.organ!''}</span></li>  -->
	<#--  <li><i class="iconfont icon-ui"></i>工作名称：<span>${userData.jobtitle!''}</span></li>  -->
	<li><i class="iconfont icon-fabu"></i>签名：<span>${(userData.sign!'')?truncate(12,'...')}</span></li>
	<li><i class="iconfont icon-pinglun"></i>描述：<span>${(userData.description!'')?truncate(12,'...')}</span></li>
	<#--  <li><i class="iconfont icon-huizongzuoyoutuodong"></i>备注：<span>${(userData.remark!'')?truncate(12,'...')}</span></li>  -->

<#--  <i class="iconfont icon-zan"></i>
<i class="iconfont icon-jiazaizhong"></i>
<i class="iconfont icon-sousuo"></i>
<i class="iconfont icon-quanpingpad"></i>
<i class="iconfont icon-shezhi"></i>
<i class="iconfont icon-shijian"></i>
<i class="iconfont icon-guanbi"></i>
<i class="iconfont icon-tianjia"></i>
<i class="iconfont icon-tuichu"></i>
<i class="iconfont icon-shui"></i>
<i class="iconfont icon-qq"></i>
<i class="iconfont icon-weibo"></i>
<i class="iconfont icon-tupian"></i>
<i class="iconfont icon-logo"></i>
<i class="iconfont icon-daima"></i>
<i class="iconfont icon-biaoqing"></i>
<i class="iconfont icon-nan"></i>
<i class="iconfont icon-nv"></i>
<i class="iconfont icon-quitquanping"></i>
<i class="iconfont icon-zuichun"></i>
<i class="iconfont icon-charushuipingxian"></i>
<i class="iconfont icon-yulan"></i>
<i class="iconfont icon-liulanyanjing"></i>
<i class="iconfont icon-touxiang"></i>
<i class="iconfont icon-caina"></i>
<i class="iconfont icon-room"></i>
<i class="iconfont icon-svgmoban53"></i>
<i class="iconfont icon-shichang"></i>
<i class="iconfont icon-shouye"></i>
<i class="iconfont icon-tishilian"></i>
<i class="iconfont icon-fabu"></i>
<i class="iconfont icon-pinglun"></i>
<i class="iconfont icon-zan1"></i>
<i class="iconfont icon-chengshi"></i>
<i class="iconfont icon-lianjie"></i>
<i class="iconfont icon-renshu"></i>
<i class="iconfont icon-huizongzuoyoutuodong"></i>
<i class="iconfont icon-404"></i>
<i class="iconfont icon-wenda"></i>
<i class="iconfont icon-top"></i>
<i class="iconfont icon-ui"></i>  -->

</ul>	