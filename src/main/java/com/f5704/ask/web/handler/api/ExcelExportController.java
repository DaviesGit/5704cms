package com.f5704.ask.web.handler.api;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.f5704.ask.service.repository.AchievementRepository;
import com.f5704.ask.service.repository.ProjectRepository;
import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.Achievement;
import com.f5704.ask.web.model.Project;
import com.f5704.ask.web.model.User;
import com.f5704.util.Menu;

@RestController
@RequestMapping("/api")
public class ExcelExportController {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ProjectRepository projectRepository;
	@Autowired
	private AchievementRepository achievementRepository;

	private class UserExcelView extends AbstractXlsView {

		@Override
		protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			@SuppressWarnings("unchecked")
			Page<User> users = (Page<User>) model.get("data");
			String filename = (String) model.get("filename");
			response.setContentType("application/ms-excel; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition",
					"attachment;filename=\"" + URLEncoder.encode(filename, "UTF-8") + ".xls\"");
			Sheet sheet = workbook.createSheet(filename);

			int rowNum = 0;
			Row header = sheet.createRow(rowNum);
			++rowNum;

			header.createCell(0).setCellValue("ID");
			header.createCell(1).setCellValue("sessionid（临时）");
			header.createCell(2).setCellValue("用户名");
			header.createCell(3).setCellValue("密码");
			header.createCell(4).setCellValue("安全配置");
			header.createCell(5).setCellValue("用户类型");
			header.createCell(6).setCellValue("创建者");
			header.createCell(7).setCellValue("创建时间");
			header.createCell(8).setCellValue("密码更新时间");
			header.createCell(9).setCellValue("更新时间");
			header.createCell(10).setCellValue("最后一次登录时间");
			header.createCell(11).setCellValue("登录状态");
			header.createCell(12).setCellValue("粉丝数量");
			header.createCell(13).setCellValue("关注数量");
			header.createCell(14).setCellValue("积分");
			header.createCell(15).setCellValue("行计数（临时）");
			header.createCell(16).setCellValue("代理（临时）");
			header.createCell(17).setCellValue("key（临时）");
			header.createCell(18).setCellValue("orgi");
			header.createCell(19).setCellValue("状态");
			header.createCell(20).setCellValue("停用时间");
			header.createCell(21).setCellValue("成员等级");
			header.createCell(22).setCellValue("昵称");
			header.createCell(23).setCellValue("firstname");
			header.createCell(24).setCellValue("midname");
			header.createCell(25).setCellValue("lastname");
			header.createCell(26).setCellValue("语言");
			header.createCell(27).setCellValue("工作名称");
			header.createCell(28).setCellValue("头衔");
			header.createCell(29).setCellValue("生日");
			header.createCell(30).setCellValue("部门");
			header.createCell(31).setCellValue("性别");
			header.createCell(32).setCellValue("姓名");
			header.createCell(33).setCellValue("邮箱");
			header.createCell(34).setCellValue("电话");
			header.createCell(35).setCellValue("身份证");
			header.createCell(36).setCellValue("父母联系方式");
			header.createCell(37).setCellValue("组织");
			header.createCell(38).setCellValue("技能");
			header.createCell(39).setCellValue("城市");
			header.createCell(40).setCellValue("省份");
			header.createCell(41).setCellValue("学号");
			header.createCell(42).setCellValue("年级");
			header.createCell(43).setCellValue("专业");
			header.createCell(44).setCellValue("寝室号");
			header.createCell(45).setCellValue("加入时间");
			header.createCell(46).setCellValue("签名");
			header.createCell(47).setCellValue("描述");
			header.createCell(48).setCellValue("备注");

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for (User user : users) {
				Row row = sheet.createRow(rowNum++);
				if (null != user.getId())
					row.createCell(0).setCellValue(user.getId());
				if (null != user.getSessionid())
					row.createCell(1).setCellValue(user.getSessionid());
				if (null != user.getUsername())
					row.createCell(2).setCellValue(user.getUsername());
				if (null != user.getPassword())
					row.createCell(3).setCellValue(user.getPassword());
				if (null != user.getSecureconf())
					row.createCell(4).setCellValue(user.getSecureconf());
				if (null != user.getUsertype())
					row.createCell(5).setCellValue(user.getUsertype());
				if (null != user.getCreater())
					row.createCell(6).setCellValue(user.getCreater());
				if (null != user.getCreatetime())
					row.createCell(7).setCellValue(formatter.format(user.getCreatetime()));
				if (null != user.getPassupdatetime())
					row.createCell(8).setCellValue(formatter.format(user.getPassupdatetime()));
				if (null != user.getUpdatetime())
					row.createCell(9).setCellValue(formatter.format(user.getUpdatetime()));
				if (null != user.getLastlogintime())
					row.createCell(10).setCellValue(formatter.format(user.getLastlogintime()));
				if (true)
					row.createCell(11).setCellValue(user.isLogin());
				if (true)
					row.createCell(12).setCellValue(user.getFans());
				if (true)
					row.createCell(13).setCellValue(user.getFollows());
				if (true)
					row.createCell(14).setCellValue(user.getIntegral());
				if (true)
					row.createCell(15).setCellValue(user.getRowcount());
				if (true)
					row.createCell(16).setCellValue(user.isAgent());
				if (null != user.getKey())
					row.createCell(17).setCellValue(user.getKey());
				if (null != user.getOrgi())
					row.createCell(18).setCellValue(user.getOrgi());
				if (null != user.getStatus())
					row.createCell(19).setCellValue(user.getStatus());
				if (null != user.getDeactivetime())
					row.createCell(20).setCellValue(user.getDeactivetime());
				if (null != user.getRank())
					row.createCell(21).setCellValue(user.getRank());
				if (null != user.getNickname())
					row.createCell(22).setCellValue(user.getNickname());
				if (null != user.getFirstname())
					row.createCell(23).setCellValue(user.getFirstname());
				if (null != user.getMidname())
					row.createCell(24).setCellValue(user.getMidname());
				if (null != user.getLastname())
					row.createCell(25).setCellValue(user.getLastname());
				if (null != user.getLanguage())
					row.createCell(26).setCellValue(user.getLanguage());
				if (null != user.getJobtitle())
					row.createCell(27).setCellValue(user.getJobtitle());
				if (null != user.getTitle())
					row.createCell(28).setCellValue(user.getTitle());
				if (null != user.getBirthday())
					row.createCell(29).setCellValue(user.getBirthday());
				if (null != user.getDepartment())
					row.createCell(30).setCellValue(user.getDepartment());
				if (null != user.getGender())
					row.createCell(31).setCellValue(user.getGender());
				if (null != user.getName())
					row.createCell(32).setCellValue(user.getName());
				if (null != user.getEmail())
					row.createCell(33).setCellValue(user.getEmail());
				if (null != user.getMobile())
					row.createCell(34).setCellValue(user.getMobile());
				if (null != user.getPhone())
					row.createCell(35).setCellValue(user.getPhone());
				if (null != user.getParent_phone())
					row.createCell(36).setCellValue(user.getParent_phone());
				if (null != user.getOrgan())
					row.createCell(37).setCellValue(user.getOrgan());
				if (null != user.getSkill())
					row.createCell(38).setCellValue(user.getSkill());
				if (null != user.getCity())
					row.createCell(39).setCellValue(user.getCity());
				if (null != user.getProvince())
					row.createCell(40).setCellValue(user.getProvince());
				if (null != user.getSno())
					row.createCell(41).setCellValue(user.getSno());
				if (null != user.getGrade())
					row.createCell(42).setCellValue(user.getGrade());
				if (null != user.getMajor())
					row.createCell(43).setCellValue(user.getMajor());
				if (null != user.getRoom_id())
					row.createCell(44).setCellValue(user.getRoom_id());
				if (null != user.getJoin_time())
					row.createCell(45).setCellValue(user.getJoin_time());
				if (null != user.getSign())
					row.createCell(46).setCellValue(user.getSign());
				if (null != user.getDescription())
					row.createCell(47).setCellValue(user.getDescription());
				if (null != user.getRemark())
					row.createCell(48).setCellValue(user.getRemark());
			}
			for (int i = 0; i < 49; i++) {
				sheet.autoSizeColumn(i);
			}
		}
	}

	private class ProjectExcelView extends AbstractXlsView {

		@Override
		protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			@SuppressWarnings("unchecked")
			Page<Project> projects = (Page<Project>) model.get("data");
			String filename = (String) model.get("filename");
			response.setContentType("application/ms-excel; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition",
					"attachment;filename=\"" + URLEncoder.encode(filename, "UTF-8") + ".xls\"");
			Sheet sheet = workbook.createSheet(filename);

			int rowNum = 0;
			Row header = sheet.createRow(rowNum);
			++rowNum;

			header.createCell(0).setCellValue("ID");
			header.createCell(1).setCellValue("项目名称");
			header.createCell(2).setCellValue("项目负责人");
			header.createCell(3).setCellValue("项目比赛");
			header.createCell(4).setCellValue("项目进度");
			header.createCell(5).setCellValue("开始时间");
			header.createCell(6).setCellValue("结束时间");
			header.createCell(7).setCellValue("描述");
			header.createCell(8).setCellValue("备注");

			for (Project project : projects) {
				Row row = sheet.createRow(rowNum++);
				if (null != project.getId())
					row.createCell(0).setCellValue(project.getId());
				if (null != project.getName())
					row.createCell(1).setCellValue(project.getName());
				if (null != project.getPrincipal())
					row.createCell(2).setCellValue(project.getPrincipal().getName());
				if (null != project.getMatch())
					row.createCell(3).setCellValue(project.getMatch());
				if (null != project.getProgress())
					row.createCell(4).setCellValue(project.getProgress());
				if (null != project.getBegin())
					row.createCell(5).setCellValue(project.getBegin());
				if (null != project.getEnd())
					row.createCell(6).setCellValue(project.getEnd());
				if (null != project.getDescription())
					row.createCell(7).setCellValue(project.getDescription());
				if (null != project.getRemark())
					row.createCell(8).setCellValue(project.getRemark());
			}
			for (int i = 0; i < 9; i++) {
				sheet.autoSizeColumn(i);
			}
		}
	}

	private class AchievementExcelView extends AbstractXlsView {

		@Override
		protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			@SuppressWarnings("unchecked")
			Page<Achievement> achievements = (Page<Achievement>) model.get("data");
			String filename = (String) model.get("filename");
			response.setContentType("application/ms-excel; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition",
					"attachment;filename=\"" + URLEncoder.encode(filename, "UTF-8") + ".xls\"");
			Sheet sheet = workbook.createSheet(filename);

			int rowNum = 0;
			Row header = sheet.createRow(rowNum);
			++rowNum;

			header.createCell(0).setCellValue("ID");
			header.createCell(1).setCellValue("成果名称");
			header.createCell(2).setCellValue("成果类型");
			header.createCell(3).setCellValue("成果编号");
			header.createCell(4).setCellValue("成果进度");
			header.createCell(5).setCellValue("申请时间");
			header.createCell(6).setCellValue("受理时间");
			header.createCell(7).setCellValue("授权时间");
			header.createCell(8).setCellValue("描述");
			header.createCell(9).setCellValue("备注");

			for (Achievement achievement : achievements) {
				Row row = sheet.createRow(rowNum++);
				if (null != achievement.getId())
					row.createCell(0).setCellValue(achievement.getId());
				if (null != achievement.getName())
					row.createCell(1).setCellValue(achievement.getName());
				if (null != achievement.getType())
					row.createCell(2).setCellValue(achievement.getType());
				if (null != achievement.getNumber())
					row.createCell(3).setCellValue(achievement.getNumber());
				if (null != achievement.getProgress())
					row.createCell(4).setCellValue(achievement.getProgress());
				if (null != achievement.getApply_time())
					row.createCell(5).setCellValue(achievement.getApply_time());
				if (null != achievement.getAccept_time())
					row.createCell(6).setCellValue(achievement.getAccept_time());
				if (null != achievement.getAuthorize_time())
					row.createCell(7).setCellValue(achievement.getAuthorize_time());
				if (null != achievement.getDescription())
					row.createCell(8).setCellValue(achievement.getDescription());
				if (null != achievement.getRemark())
					row.createCell(9).setCellValue(achievement.getRemark());
			}
			for (int i = 0; i < 10; i++) {
				sheet.autoSizeColumn(i);
			}
		}
	}

	@RequestMapping(value = "/export/user")
	@Menu(type = "admin", access = false)
	public ModelAndView export_user(HttpServletRequest request, String id, String username, String usertype,
			String lastlogintime, String rank, String nickname, String firstname, String midname, String lastname,
			String language, String jobtitle, String title, String birthday, String department, String gender,
			String name, String email, String mobile, String phone, String parent_phone, String organ, String skill,
			String city, String province, String sno, String grade, String major, String room_id, String join_time,
			String search) {
		Page<User> users = userRepository.search("" == id ? null : id, "" == username ? null : username,
				"" == usertype ? null : usertype, "" == lastlogintime ? null : lastlogintime, "" == rank ? null : rank,
				"" == nickname ? null : nickname, "" == firstname ? null : firstname, "" == midname ? null : midname,
				"" == lastname ? null : lastname, "" == language ? null : language, "" == jobtitle ? null : jobtitle,
				"" == title ? null : title, "" == birthday ? null : birthday, "" == department ? null : department,
				"" == gender ? null : gender, "" == name ? null : name, "" == email ? null : email,
				"" == mobile ? null : mobile, "" == phone ? null : phone, "" == parent_phone ? null : parent_phone,
				"" == organ ? null : organ, "" == skill ? null : skill, "" == city ? null : city,
				"" == province ? null : province, "" == sno ? null : sno, "" == grade ? null : grade,
				"" == major ? null : major, "" == room_id ? null : room_id, "" == join_time ? null : join_time,
				"" == search ? null : search, new PageRequest(0, Integer.MAX_VALUE));

		String filename = "成员_" + (null != id && "" != id ? "ID：" + id + "，" : "")
				+ (null != username && "" != username ? "用户名：" + username + "，" : "")
				+ (null != usertype && "" != usertype ? "用户类型：" + usertype + "，" : "")
				+ (null != lastlogintime && "" != lastlogintime ? "最后一次登录时间：" + lastlogintime + "，" : "")
				+ (null != rank && "" != rank ? "成员等级：" + rank + "，" : "")
				+ (null != nickname && "" != nickname ? "昵称：" + nickname + "，" : "")
				+ (null != firstname && "" != firstname ? "firstname：" + firstname + "，" : "")
				+ (null != midname && "" != midname ? "midname：" + midname + "，" : "")
				+ (null != lastname && "" != lastname ? "lastname：" + lastname + "，" : "")
				+ (null != language && "" != language ? "语言：" + language + "，" : "")
				+ (null != jobtitle && "" != jobtitle ? "工作名称：" + jobtitle + "，" : "")
				+ (null != title && "" != title ? "头衔：" + title + "，" : "")
				+ (null != birthday && "" != birthday ? "生日：" + birthday + "，" : "")
				+ (null != department && "" != department ? "部门：" + department + "，" : "")
				+ (null != gender && "" != gender ? "性别：" + gender + "，" : "")
				+ (null != name && "" != name ? "姓名：" + name + "，" : "")
				+ (null != email && "" != email ? "邮箱：" + email + "，" : "")
				+ (null != mobile && "" != mobile ? "电话：" + mobile + "，" : "")
				+ (null != phone && "" != phone ? "身份证：" + phone + "，" : "")
				+ (null != parent_phone && "" != parent_phone ? "父母联系方式：" + parent_phone + "，" : "")
				+ (null != organ && "" != organ ? "组织：" + organ + "，" : "")
				+ (null != skill && "" != skill ? "技能：" + skill + "，" : "")
				+ (null != city && "" != city ? "城市：" + city + "，" : "")
				+ (null != province && "" != province ? "省份：" + province + "，" : "")
				+ (null != sno && "" != sno ? "学号：" + sno + "，" : "")
				+ (null != grade && "" != grade ? "年级：" + grade + "，" : "")
				+ (null != major && "" != major ? "专业：" + major + "，" : "")
				+ (null != room_id && "" != room_id ? "寝室号：" + room_id + "，" : "")
				+ (null != join_time && "" != join_time ? "加入时间：" + join_time + "，" : "")
				+ (null != search && "" != search ? "模糊搜索：" + search + "，" : "");
		filename = filename.substring(0, filename.length() - 1);

		HashMap<String, Object> model = new HashMap<String, Object>();
		model.put("data", users);
		model.put("filename", filename);

		return new ModelAndView(new UserExcelView(), model);
	}

	@RequestMapping(value = "/export/project")
	@Menu(type = "admin", access = false)
	public ModelAndView export_project(HttpServletRequest request, String id, String name, String principal,
			String match, String progress, String begin, String end, String search) {
		Page<Project> projects = projectRepository.search("" == id ? null : id, "" == name ? null : name,
				"" == principal ? null : principal, "" == match ? null : match, "" == progress ? null : progress,
				"" == begin ? null : begin, "" == end ? null : end, "" == search ? null : search,
				new PageRequest(0, Integer.MAX_VALUE));

		String filename = "项目_" + (null != id && "" != id ? "ID：" + id + "，" : "")
				+ (null != name && "" != name ? "项目名称：" + name + "，" : "")
				+ (null != principal && "" != principal ? "项目负责人：" + principal + "，" : "")
				+ (null != match && "" != match ? "项目比赛：" + match + "，" : "")
				+ (null != progress && "" != progress ? "项目进度：" + progress + "，" : "")
				+ (null != begin && "" != begin ? "开始时间：" + begin + "，" : "")
				+ (null != end && "" != end ? "结束时间：" + end + "，" : "")
				+ (null != search && "" != search ? "模糊搜索：" + search + "，" : "");
		filename = filename.substring(0, filename.length() - 1);

		HashMap<String, Object> model = new HashMap<String, Object>();
		model.put("data", projects);
		model.put("filename", filename);

		return new ModelAndView(new ProjectExcelView(), model);
	}

	@RequestMapping(value = "/export/achievement")
	@Menu(type = "admin", access = false)
	public ModelAndView export_achievement(HttpServletRequest request, String id, String name, String type,
			String number, String progress, String apply_time, String accept_time, String authorize_time,
			String search) {
		Page<Achievement> achievements = achievementRepository.search("" == id ? null : id, "" == name ? null : name,
				"" == type ? null : type, "" == number ? null : number, "" == progress ? null : progress,
				"" == apply_time ? null : apply_time, "" == accept_time ? null : accept_time,
				"" == authorize_time ? null : authorize_time, "" == search ? null : search,
				new PageRequest(0, Integer.MAX_VALUE));

		String filename = "成果_" 
				+ (null != id && "" != id ? "ID：" + id + "，" : "")
				+ (null != name && "" != name ? "成果名称：" + name + "，" : "")
				+ (null != type && "" != type ? "成果类型：" + type + "，" : "")
				+ (null != number && "" != number ? "成果编号：" + number + "，" : "")
				+ (null != progress && "" != progress ? "成果进度：" + progress + "，" : "")
				+ (null != apply_time && "" != apply_time ? "申请时间：" + apply_time + "，" : "")
				+ (null != accept_time && "" != accept_time ? "受理时间：" + accept_time + "，" : "")
				+ (null != authorize_time && "" != authorize_time ? "授权时间：" + authorize_time + "，" : "")
				+ (null != search && "" != search ? "模糊搜索：" + search + "，" : "");
		filename = filename.substring(0, filename.length() - 1);

		HashMap<String, Object> model = new HashMap<String, Object>();
		model.put("data", achievements);
		model.put("filename", filename);

		return new ModelAndView(new AchievementExcelView(), model);
	}

}
