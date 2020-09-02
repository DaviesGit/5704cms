package com.f5704.ask.web.handler.converter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Controller;

import com.f5704.ask.service.repository.ProjectRepository;
import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.Project;
import com.f5704.ask.web.model.User;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class StringToProjects implements Converter<String, Set<Project>> {


	@Autowired
	private ProjectRepository projectRepository;
	

	private static ObjectMapper objectMapper=new ObjectMapper();

//	@Override
//	public Set<Project> convert(String nameStr) {
//		Set<Project> projects = new HashSet<Project>();
//		String[] names;
//		try {
//			names = objectMapper.readValue(nameStr, String[].class);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return projects;
//		}
//		for (String name : names) {
//			Project project = projectRepository.findByName(name);
//			if (null == project)
//				continue;
//			projects.add(project);
//		}
//		return projects;
//	}
	@Override
	public Set<Project> convert(String diStr) {
		Set<Project> projects = new HashSet<Project>();
		String[] ids;
		try {
			ids = objectMapper.readValue(diStr, String[].class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return projects;
		}
		for (String id : ids) {
			Project project = projectRepository.findById(id);
			if (null == project)
				continue;
			projects.add(project);
		}
		return projects;
	}
}
