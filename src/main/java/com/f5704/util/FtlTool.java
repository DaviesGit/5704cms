package com.f5704.util;

import java.util.ArrayList;

import com.f5704.ask.web.model.Achievement;
import com.f5704.ask.web.model.Project;
import com.f5704.ask.web.model.User;

import freemarker.template.SimpleSequence;
import freemarker.template.TemplateModelException;

public class FtlTool {
	public static boolean isProjectMember(ArrayList<Project> projects,String id) {
		for (Project project:projects)
			for(User user:project.getUsers())
				if(id.equals(user.getId()))
					return true;
		return false;
	}
	public static boolean isAchievementMember(ArrayList<Achievement> achievements,String id) {
		for (Achievement achievement:achievements)
			for(User user:achievement.getUsers())
				if(id.equals(user.getId()))
					return true;
		return false;
	}
	public static boolean isAchievementMember(SimpleSequence achievements,String id) throws TemplateModelException {
		if(null==id)
			return false;
		return isAchievementMember((ArrayList<Achievement>) achievements.toList(), id);
	}
	public static boolean isProjectMember(SimpleSequence projects,String id) throws TemplateModelException {
		if(null==id)
			return false;
		return isProjectMember((ArrayList<Project> ) projects.toList(), id);
	}
}
