package com.f5704.ask.web.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


/**
 * @author jaddy0302 Rivulet User.java 2010-3-17
 * 
 */
@Entity
@Table(name = "user")
@org.hibernate.annotations.Proxy(lazy = false)
public class User implements FAgg{
	
	private static final long serialVersionUID = 1L;
	
	private String id ;
	
	private String sessionid ;
	
	private String username ;
	private String password ;
	private String email ;
//	private String uname ;
	private String firstname ;
	private String midname ;
	private String lastname ;
	private String language ;
	private String jobtitle ;
	private String title ;		//获得称号
	private String department ;
	private String gender;
	private String mobile ;
	private String birthday ;
	private String nickname ;
	private String secureconf = "5";
	private String usertype = "1"; // 0 Admin User  : !0  Other User 
	private String orgi; 
	private String creater;
	private Date createtime = new Date();
	private Date passupdatetime = new Date();
	private Date updatetime = new Date();
	private String sign;
	private String organ;
	private boolean agent ;	//是否开通坐席功能
	private String skill ;
	private String city ;	//城市
	private String province ;//省份
	private boolean login ;		//是否登录
	
	private int rowcount ;		//统计 回复次数
	private String key ;
	
	private Date lastlogintime = new Date();	//最后登录时间
	
	private int fans ;			//粉丝
	private int follows ;		//关注
	private int integral ;		//积分
	
	private String status ;		//状态  ， == 0 表示账号被封停用
	private Date deactivetime ;	//停用时间
	
	private String name;
	private String sno;
	private String grade;
	private String major;
	private String room_id;
	private String phone;
	private String parent_phone;
	private String join_time;
	private String rank="普通成员";
	private String description;
	private String remark;
	
    private Set<Project> projects;
    private Set<Achievement> achievements;

    
    @ManyToMany(mappedBy = "users")
    public Set<Project> getProjects(){return projects;}
    public void setProjects(Set<Project> projects){this.projects=projects;}
    

    @ManyToMany(mappedBy = "users")
    public Set<Achievement> getAchievements(){return achievements;}
    public void setAchievements(Set<Achievement> achievements){this.achievements=achievements;}
    
    
	/**
	 * @return the id
	 */
	@Id
	@Column(length = 32)
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")	
//	@GeneratedValue
	
	public String getId() {
		return id;
	}

	@Transient
	public String getSessionid() {
		return sessionid;
	}


	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

//
//	public String getUname() {
//		return uname;
//	}
//
//
//	public void setUname(String uname) {
//		this.uname = uname;
//	}


	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getMidname() {
		return midname;
	}


	public void setMidname(String midname) {
		this.midname = midname;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getLanguage() {
		return language;
	}


	public void setLanguage(String language) {
		this.language = language;
	}


	public String getJobtitle() {
		return jobtitle;
	}


	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getSecureconf() {
		return secureconf;
	}


	public void setSecureconf(String secureconf) {
		this.secureconf = secureconf;
	}


	public String getUsertype() {
		return usertype;
	}


	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getOrgi() {
		return orgi;
	}


	public void setOrgi(String orgi) {
		this.orgi= orgi;
	}





	public String getCreater() {
		return creater;
	}


	public void setCreater(String creater) {
		this.creater = creater;
	}


	public Date getCreatetime() {
		return createtime;
	}


	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}


	public Date getPassupdatetime() {
		return passupdatetime;
	}


	public void setPassupdatetime(Date passupdatetime) {
		this.passupdatetime = passupdatetime;
	}


	public Date getUpdatetime() {
		return updatetime;
	}


	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}


	public String getSign() {
		return sign;
	}


	public void setSign(String sign) {
		this.sign = sign;
	}


	public String getOrgan() {
		return organ;
	}


	public void setOrgan(String organ) {
		this.organ = organ;
	}


	public void setId(String id) {
		this.id = id;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public boolean isAgent() {
		return agent;
	}

	public void setAgent(boolean agent) {
		this.agent = agent;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	@Transient
	public boolean isLogin() {
		return login;
	}

	public void setLogin(boolean login) {
		this.login = login;
	}

	public int getFans() {
		return fans;
	}

	public void setFans(int fans) {
		this.fans = fans;
	}

	public int getFollows() {
		return follows;
	}

	public void setFollows(int follows) {
		this.follows = follows;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	public Date getLastlogintime() {
		return lastlogintime;
	}

	public void setLastlogintime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDeactivetime() {
		return deactivetime;
	}

	public void setDeactivetime(Date deactivetime) {
		this.deactivetime = deactivetime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getName(){return name;}
	public void setName(String name){this.name=name;}
	public String getSno(){return sno;}
	public void setSno(String sno){this.sno=sno;}
	public String getGrade(){return grade;}
	public void setGrade(String grade){this.grade=grade;}
	public String getMajor(){return major;}
	public void setMajor(String major){this.major=major;}
	public String getRoom_id(){return room_id;}
	public void setRoom_id(String room_id){this.room_id=room_id;}
	public String getPhone(){return phone;}
	public void setPhone(String phone){this.phone=phone;}
	public String getParent_phone(){return parent_phone;}
	public void setParent_phone(String parent_phone){this.parent_phone=parent_phone;}
	public String getJoin_time(){return join_time;}
	public void setJoin_time(String join_time){this.join_time=join_time;}
	public String getRank(){return rank;}
	public void setRank(String rank){this.rank=rank;}
	public String getDescription(){return description;}
	public void setDescription(String description){this.description=description;}
	public String getRemark(){return remark;}
	public void setRemark(String remark){this.remark=remark;}
	
	
	
	@Transient
	public int getRowcount() {
		return rowcount;
	}

	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}
	
	@Transient
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
}
