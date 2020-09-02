package com.f5704.ask.web.handler.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.f5704.ask.service.repository.ProjectRepository;
import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.Project;
import com.f5704.ask.web.model.User;
import com.f5704.util.JsonResponse;
import com.f5704.util.Menu;

@RestController
@RequestMapping("/api")
public class UserApiController {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ProjectRepository projectRepository;

	public class SimpleUserInfo {
		public String id;
		public String name;
		public String sno;
		public String grade;
		public String major;
		public String skill;
		public String sign;
	}

	@PostMapping(value = "/finduserbysno", produces = "application/json")
	@Menu(type = "admin", access = false)
	public JsonResponse finduserbysno(HttpServletRequest request, @RequestParam("sno") String sno) {
		User user = userRepository.findBySno(sno);
		if (null == user) {
			return JsonResponse.error("Cannot find specified member!");
		}
		SimpleUserInfo userInfo = new SimpleUserInfo();
		userInfo.id = user.getId();
		userInfo.name = user.getName();
		userInfo.sno = user.getSno();
		userInfo.grade = user.getGrade();
		userInfo.major = user.getMajor();
		userInfo.skill = user.getSkill();
		userInfo.sign = user.getSign();
		return JsonResponse.success(userInfo);
	}

	@PostMapping(value = "/searchuser", produces = "application/json")
	@Menu(type = "admin", access = false)
	public JsonResponse searchuser(HttpServletRequest request, @RequestParam("keyword") String keyword,
			@RequestParam(value = "p", required = false) Integer p,
			@RequestParam(value = "ps", required = false) Integer ps) {
		Page<User> users = userRepository.findByUsernameContainingOrNicknameContainingOrNameContainingOrEmailContainingOrMobileContainingOrPhoneContainingOrSnoContainingIgnoreCase(
				keyword, keyword, keyword, keyword, keyword, keyword, keyword,
				new PageRequest(null == p ? 0 : p - 1, null == ps ? 99 : ps, Sort.Direction.DESC, "name"));
		if (null == users) {
			return JsonResponse.error("Cannot find specified member!");
		}
		List<SimpleUserInfo> userInfos = new ArrayList<SimpleUserInfo>();
		for (User user : users) {
			SimpleUserInfo userInfo = new SimpleUserInfo();
			userInfo.id = user.getId();
			userInfo.name = user.getName();
			userInfo.sno = user.getSno();
			userInfo.grade = user.getGrade();
			userInfo.major = user.getMajor();
			userInfo.skill = user.getSkill();
			userInfo.sign = user.getSign();
			userInfos.add(userInfo);
		}
		return JsonResponse.success(userInfos);
	}
	
	@PostMapping(value = "/searchachievement", produces = "application/json")
	@Menu(type = "admin", access = false)
	public JsonResponse searchachievement(HttpServletRequest request, @RequestParam("keyword") String keyword,
			@RequestParam(value = "p", required = false) Integer p,
			@RequestParam(value = "ps", required = false) Integer ps) {
		return JsonResponse.error("");
	}
	
	@PostMapping(value = "/searchproject", produces = "application/json")
	@Menu(type = "admin", access = false)
	public JsonResponse searchproject(HttpServletRequest request, @RequestParam("keyword") String keyword,
			@RequestParam(value = "p", required = false) Integer p,
			@RequestParam(value = "ps", required = false) Integer ps) {
		Page<Project> projects = projectRepository.findByNameContainingOrMatchContainingIgnoreCase(keyword, keyword,
				new PageRequest(null == p ? 0 : p - 1, null == ps ? 99 : ps, Sort.Direction.DESC, "name"));

		if (null == projects) {
			return JsonResponse.error("Cannot find specified project!");
		}
		List<SimpleProjectInfo> projectInfos = new ArrayList<SimpleProjectInfo>();
		for (Project project : projects) {
			SimpleProjectInfo projectInfo = new SimpleProjectInfo();
			projectInfo.id = project.getId();
			projectInfo.name = project.getName();
			User user = project.getPrincipal();
			if (null != user)
				projectInfo.principal_name = user.getName();
			projectInfo.match = project.getMatch();
			projectInfo.progress = project.getProgress();
			projectInfos.add(projectInfo);
		}
		return JsonResponse.success(projectInfos);
	}

	public class SimpleProjectInfo {
		public String id;
		public String name;
		public String principal_name;
		public String match;
		public String progress;
	}

	@PostMapping(value = "/findprojectbyname", produces = "application/json")
	@Menu(type = "admin", access = false)
	public JsonResponse findprojectbyname(HttpServletRequest request, @RequestParam("name") String name) {
		Project project = projectRepository.findByName(name);
		if (null == project) {
			return JsonResponse.error("Cannot find specified member!");
		}
		SimpleProjectInfo projectInfo = new SimpleProjectInfo();
		projectInfo.id = project.getId();
		projectInfo.name = project.getName();
		User user = project.getPrincipal();
		if (null != user)
			projectInfo.principal_name = user.getName();
		projectInfo.match = project.getMatch();
		projectInfo.progress = project.getProgress();
		return JsonResponse.success(projectInfo);
	}
}
