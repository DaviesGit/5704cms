package com.f5704.ask.web.handler.admin.project;

import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.f5704.ask.service.repository.ProjectRepository;
import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.handler.Handler;
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
@RequestMapping("/admin/project")
public class ProjectController extends Handler {

	@Autowired
	private ProjectRepository projectRepository;
	@Autowired
	private UserRepository userRepository;

	@RequestMapping("/index")
	@Menu(type = "admin", subtype = "project", access = false, admin = false)
	public ModelAndView index(ModelMap map, HttpServletRequest request, String id, String name, String principal,
			String match, String progress, String begin, String end, String search) {
		User user = (User) request.getSession(true).getAttribute(FDataContext.USER_SESSION_NAME);
		user = userRepository.findById(user.getId());
		if ("0".equals(user.getUsertype())) {
			Page<Project> projects = projectRepository.search("" == id ? null : id, "" == name ? null : name,
					"" == principal ? null : principal, "" == match ? null : match, "" == progress ? null : progress,
					"" == begin ? null : begin, "" == end ? null : end, "" == search ? null : search,
					new PageRequest(super.getP(request), super.getPs(request)));
			map.addAttribute("projectListPage", projects);
		} else {
			Set<Project> projectsSet = user.getProjects();
			int size = projectsSet.size();
			Pageable pageable = new PageRequest(0, size > 0 ? size : 10);
			Page<Project> projects = new PageImpl<Project>(
					size > 0 ? new ArrayList<Project>(projectsSet) : new ArrayList<Project>(), pageable, size);
			map.addAttribute("projectListPage", projects);
		}
		return request(super.createAdminTempletResponse("/admin/project/index"));
	}

	@RequestMapping("/add")
	@Menu(type = "admin", subtype = "project", access = false, admin = false)
	public ModelAndView add(ModelMap map, HttpServletRequest request) {
		ModelAndView view = request(super.createRequestPageTempletResponse("/admin/project/add"));
//    	view.addObject("projectData", new Project()) ;
		return view;
	}

	@RequestMapping(value = "/save", produces = "application/json")
	@ResponseBody
	@Menu(type = "admin", subtype = "project", access = false, admin = false)
	public ModelAndView save(HttpServletRequest request, @Valid Project project) {
		Project tempProject = projectRepository.findByName(project.getName());
		String msg;
		if (tempProject == null) {
			User principal = project.getPrincipal();
			if (null != principal)
				project.getUsers().add(principal);
			projectRepository.save(project);
			msg = "admin_project_save_success";
		} else {
			msg = "admin_project_save_exist";
		}
		return request(super.createRequestPageTempletResponse("redirect:/admin/project/index?msg=" + msg));
	}

	@RequestMapping("/edit")
	@Menu(type = "admin", subtype = "project", access = false, admin = false)
	public ModelAndView edit(ModelMap map, @Valid String id) {
		ModelAndView view = request(super.createRequestPageTempletResponse("/admin/project/edit"));
		view.addObject("projectData", projectRepository.findById(id));
		return view;
	}

	@RequestMapping("/update")
	@Menu(type = "admin", subtype = "project", access = false, admin = false)
	public ModelAndView update(HttpServletRequest request, @Valid Project project) {
		Project tempProject = projectRepository.findById(project.getId());
		String msg = "admin_project_update_success";
		if (null != tempProject) {
			String name = project.getName();
			String match = project.getMatch();
			String progress = project.getProgress();
			String begin = project.getBegin();
			String end = project.getEnd();
			String description = project.getDescription();
			String remark = project.getRemark();
			User principal = project.getPrincipal();
			Set<User> users = project.getUsers();
			if (null != principal)
				users.add(principal);

			if (null != name && !name.isEmpty())
				tempProject.setName(name);
			if (null != match && !match.isEmpty())
				tempProject.setMatch(match);
			if (null != progress && !progress.isEmpty())
				tempProject.setProgress(progress);
			if (null != begin && !begin.isEmpty())
				tempProject.setBegin(begin);
			if (null != end && !end.isEmpty())
				tempProject.setEnd(end);
			if (null != description && !description.isEmpty())
				tempProject.setDescription(description);
			if (null != remark && !remark.isEmpty())
				tempProject.setRemark(remark);
			if (null != principal)
				tempProject.setPrincipal(principal);
			if (null != users)
				tempProject.setUsers(users);

			projectRepository.save(tempProject);
		} else {
			msg = "admin_project_update_not_exist";
		}
		return request(super.createRequestPageTempletResponse("redirect:/admin/project/index?msg=" + msg));
	}

	@RequestMapping("/delete")
	@Menu(type = "admin", subtype = "project", access = false, admin = false)
	public ModelAndView delete(HttpServletRequest request, @Valid Project project) {
		String msg = "admin_project_delete";
		if (project != null) {
			projectRepository.delete(project);
		} else {
			msg = "admin_project_not_exist";
		}
		return request(super.createRequestPageTempletResponse("redirect:/admin/project/index?msg=" + msg));
	}
}