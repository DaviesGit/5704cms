package com.f5704.ask.web.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "achievement")
@org.hibernate.annotations.Proxy(lazy = false)
public class Achievement {

	@Id
	private String id;
	private String name;
	private String type;
	private String number;
	private String progress;
	private String apply_time;
	private String accept_time;
	private String authorize_time;
	private String description;
	private String remark;

    private Set<Project> projects;
    private Set<User> users;
	
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "user_achievement",
    	inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
    	joinColumns = @JoinColumn(name = "achievement_id", referencedColumnName = "id"))
    public Set<User> getUsers(){return users;}
    public void setUsers(Set<User> users){this.users=users;}

    
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "project_achievement",
        inverseJoinColumns = @JoinColumn(name = "project_id", referencedColumnName = "id"),
        joinColumns = @JoinColumn(name = "achievement_id", referencedColumnName = "id"))
    public Set<Project> getProjects(){return projects;}
    public void setProjects(Set<Project> projects){this.projects=projects;}
    
    
	
	/**
	 * @return the id
	 */
	@Id
	@Column(length = 32)
//	@GeneratedValue
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNumber() {
		return number;
	}

	public String getProgress(){ return progress;}
	public void setProgress(String progress){this.progress=progress;}
	public String getApply_time(){ return apply_time;}
	public void setApply_time(String apply_time){this.apply_time=apply_time;}
	public String getAccept_time(){ return accept_time;}
	public void setAccept_time(String accept_time){this.accept_time=accept_time;}
	public String getAuthorize_time(){ return authorize_time;}
	public void setAuthorize_time(String authorize_time){this.authorize_time=authorize_time;}
	
	public void setNumber(String number) {
		this.number = number;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public boolean isMember(String id) {
		if(null!=users)
			for(User user:users)
				if(id.equals(user.getId()))
					return true;
		return false;
	}

}
