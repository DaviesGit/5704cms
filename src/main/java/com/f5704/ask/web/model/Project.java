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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.beans.factory.annotation.Autowired;

import com.f5704.ask.service.repository.UserRepository;

@Entity
@Table(name = "project")
@org.hibernate.annotations.Proxy(lazy = false)
public class Project {

	
	@Autowired
	@Transient
	private UserRepository userRepository;
	
	
	@Id
	private String id;
	private String name;
	private User principal;
	private String match;
	private String progress;
	private String begin;
	private String end;
	private String description;
	private String remark;

	

    private Set<Achievement> achievements;

    private Set<User> users;
    
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "user_project",
    	inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
    	joinColumns = @JoinColumn(name = "project_id", referencedColumnName = "id"))
    public Set<User> getUsers(){return users;}
    public void setUsers(Set<User> users){
    	this.users=users;
    }

    @ManyToMany(mappedBy = "projects")
    public Set<Achievement> getAchievements(){return achievements;}
    public void setAchievements(Set<Achievement> achievements){this.achievements=achievements;}
    
    

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="principal")
	public User getPrincipal() {
		return principal;
	}
	public void setPrincipal(User principal) {
		this.principal = principal;
	}

    
    
    
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
	
	@Column(name="`match`")
	public String getMatch() {
		return match;
	}

	public void setMatch(String match) {
		this.match = match;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}


	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}


	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
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
