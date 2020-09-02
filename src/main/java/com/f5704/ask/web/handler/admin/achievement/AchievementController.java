package com.f5704.ask.web.handler.admin.achievement;

import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f5704.ask.service.repository.AchievementRepository;
import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.handler.Handler;
import com.f5704.ask.web.model.Achievement;
import com.f5704.ask.web.model.Project;
import com.f5704.ask.web.model.User;
import com.f5704.core.FDataContext;
import com.f5704.util.Menu;

/**
 *
 * @author Davies
 * @version 1.0.0
 * @blog http://blog.didispace.com
 *
 */
@Controller
@RequestMapping("/admin/achievement")
public class AchievementController extends Handler {

	@Autowired
	private AchievementRepository achievementRepository;
	@Autowired
	private UserRepository userRepository;

	@RequestMapping("/index")
	@Menu(type = "admin", subtype = "achievement", access = false, admin = false)
	public ModelAndView index(ModelMap map, HttpServletRequest request, String id, String name, String type,
			String number, String progress, String apply_time, String accept_time, String authorize_time,
			String search) {
		User user = (User) request.getSession(true).getAttribute(FDataContext.USER_SESSION_NAME);
		user = userRepository.findById(user.getId());
		if ("0".equals(user.getUsertype())) {
			Page<Achievement> achievements = achievementRepository.search("" == id ? null : id,
					"" == name ? null : name, "" == type ? null : type, "" == number ? null : number,
					"" == progress ? null : progress, "" == apply_time ? null : apply_time,
					"" == accept_time ? null : accept_time, "" == authorize_time ? null : authorize_time,
					"" == search ? null : search, new PageRequest(super.getP(request), super.getPs(request)));
			map.addAttribute("achievementListPage", achievements);
		} else {
			Set<Achievement> achievementSet = user.getAchievements();
			int size = achievementSet.size();
			Pageable pageable = new PageRequest(0, size > 0 ? size : 10);
			Page<Achievement> achievement = new PageImpl<Achievement>(
					size > 0 ? new ArrayList<Achievement>(achievementSet) : new ArrayList<Achievement>(), pageable,
					size);
			map.addAttribute("achievementListPage", achievement);
		}
		return request(super.createAdminTempletResponse("/admin/achievement/index"));
	}

	@RequestMapping("/add")
	@Menu(type = "admin", subtype = "achievement", access = false, admin = false)
	public ModelAndView add(ModelMap map, HttpServletRequest request) {
		ModelAndView view = request(super.createRequestPageTempletResponse("/admin/achievement/add"));
//    	view.addObject("achievementData", new Achievement()) ;
		return view;
	}

	@RequestMapping("/save")
	@Menu(type = "admin", subtype = "achievement", access = false, admin = false)
	public ModelAndView save(HttpServletRequest request, @Valid Achievement achievement) {
		Achievement tempAchievement = achievementRepository.findByName(achievement.getName());
		String msg;
		if (tempAchievement == null) {
			achievementRepository.save(achievement);
			msg = "admin_achievement_save_success";
		} else {
			msg = "admin_achievement_save_exist";
		}
		return request(super.createRequestPageTempletResponse("redirect:/admin/achievement/index?msg=" + msg));
	}

	@RequestMapping("/edit")
	@Menu(type = "admin", subtype = "achievement", access = false, admin = false)
	public ModelAndView edit(ModelMap map, @Valid String id) {
		ModelAndView view = request(super.createRequestPageTempletResponse("/admin/achievement/edit"));
		view.addObject("achievementData", achievementRepository.findById(id));
		return view;
	}

	@RequestMapping("/update")
	@Menu(type = "admin", subtype = "achievement", access = false, admin = false)
	public ModelAndView update(HttpServletRequest request, @Valid Achievement achievement) {
		Achievement tempAchievement = achievementRepository.findById(achievement.getId());
		String msg = "admin_achievement_update_success";
		if (null != tempAchievement) {
			String name = achievement.getName();
			String type = achievement.getType();
			String number = achievement.getNumber();
			String progress = achievement.getProgress();
			String apply_time = achievement.getApply_time();
			String accept_time = achievement.getAccept_time();
			String authorize_time = achievement.getAuthorize_time();
			String description = achievement.getDescription();
			String remark = achievement.getRemark();
			Set<User> users = achievement.getUsers();
			Set<Project> projects = achievement.getProjects();

			if (null != name && !name.isEmpty())
				tempAchievement.setName(name);
			if (null != type && !type.isEmpty())
				tempAchievement.setType(type);
			if (null != number && !number.isEmpty())
				tempAchievement.setNumber(number);
			if (null != progress && !progress.isEmpty())
				tempAchievement.setProgress(progress);
			if (null != apply_time && !apply_time.isEmpty())
				tempAchievement.setApply_time(apply_time);
			if (null != accept_time && !accept_time.isEmpty())
				tempAchievement.setAccept_time(accept_time);
			if (null != authorize_time && !authorize_time.isEmpty())
				tempAchievement.setAuthorize_time(authorize_time);
			if (null != description && !description.isEmpty())
				tempAchievement.setDescription(description);
			if (null != remark && !remark.isEmpty())
				tempAchievement.setRemark(remark);
			if (null != users)
				tempAchievement.setUsers(users);
			if (null != projects)
				tempAchievement.setProjects(projects);

			achievementRepository.save(tempAchievement);
		} else {
			msg = "admin_achievement_update_not_exist";
		}
		return request(super.createRequestPageTempletResponse("redirect:/admin/achievement/index?msg=" + msg));
	}

	@RequestMapping("/delete")
	@Menu(type = "admin", subtype = "achievement", access = false, admin = false)
	public ModelAndView delete(HttpServletRequest request, @Valid Achievement achievement) {
		String msg = "admin_achievement_delete";
		if (achievement != null) {
			achievementRepository.delete(achievement);
		} else {
			msg = "admin_achievement_not_exist";
		}
		return request(super.createRequestPageTempletResponse("redirect:/admin/achievement/index?msg=" + msg));
	}

}