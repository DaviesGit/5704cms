package com.f5704.ask.web.handler.admin.users;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.handler.Handler;
import com.f5704.ask.web.model.User;
import com.f5704.util.Menu;
import com.f5704.util.FTools;

/**
 *
 * @author Davies
 * @version 1.0.0
 * @blog http://blog.didispace.com
 *
 */
@Controller
@RequestMapping("/admin/user")
public class UsersController extends Handler{

	@Autowired
	private UserRepository userRepository;

    @RequestMapping("/index")
    @Menu(type = "admin" , subtype = "user" , access = false , admin = true)
    public ModelAndView index(ModelMap map , HttpServletRequest request,
    		String id,
    		String username,
    		String usertype,
    		String lastlogintime,
    		String rank,
    		String nickname,
    		String firstname,
    		String midname,
    		String lastname,
    		String language,
    		String jobtitle,
    		String title,
    		String birthday,
    		String department,
    		String gender,
    		String name,
    		String email,
    		String mobile,
    		String phone,
    		String parent_phone,
    		String organ,
    		String skill,
    		String city,
    		String province,
    		String sno,
    		String grade,
    		String major,
    		String room_id,
    		String join_time,
    		String search
    		) {
//    	Page<User> userList=userRepository.findByUsertype("0" , new PageRequest(super.getP(request), super.getPs(request), Sort.Direction.DESC, "createtime"));
    	Page<User> userList=userRepository.search(
                		""==id?null:id,
                        ""==username?null:username,
                        ""==usertype?null:usertype,
                        ""==lastlogintime?null:lastlogintime,
                        ""==rank?null:rank,
                        ""==nickname?null:nickname,
                        ""==firstname?null:firstname,
                        ""==midname?null:midname,
                        ""==lastname?null:lastname,
                        ""==language?null:language,
                        ""==jobtitle?null:jobtitle,
                        ""==title?null:title,
                        ""==birthday?null:birthday,
                        ""==department?null:department,
                        ""==gender?null:gender,
                        ""==name?null:name,
                        ""==email?null:email,
                        ""==mobile?null:mobile,
                        ""==phone?null:phone,
                        ""==parent_phone?null:parent_phone,
                        ""==organ?null:organ,
                        ""==skill?null:skill,
                        ""==city?null:city,
                        ""==province?null:province,
                        ""==sno?null:sno,
                        ""==grade?null:grade,
                        ""==major?null:major,
                        ""==room_id?null:room_id,
                        ""==join_time?null:join_time,
                        ""==search?null:search,
    			new PageRequest(super.getP(request), super.getPs(request), Sort.Direction.DESC, "createtime"));
    	map.addAttribute("userListPage", userList);
        return request(super.createAdminTempletResponse("/admin/user/index"));
    }
    
    @RequestMapping("/list")
    @Menu(type = "admin" , subtype = "user" , access = false , admin = true)
    public ModelAndView list(ModelMap map , HttpServletRequest request) {
    	map.addAttribute("userListPage", userRepository.findByUsertype("1" , new PageRequest(super.getP(request), super.getPs(request), Sort.Direction.DESC, "createtime")));
        return request(super.createAdminTempletResponse("/admin/user/index"));
    }
    
    @RequestMapping("/add")
    @Menu(type = "admin" , subtype = "user" , access = false , admin = true)
    public ModelAndView add(ModelMap map , HttpServletRequest request) {
    	ModelAndView view = request(super.createRequestPageTempletResponse("/admin/user/add"));
    	view.addObject("userData", new User()) ;
        return view;
    }
    
    @RequestMapping("/save")
    @Menu(type = "admin" , subtype = "user" , access = false , admin = true)
    public ModelAndView save(HttpServletRequest request ,@Valid User user) {
    	ModelAndView view = null ; 
    	User tempUser = userRepository.findByUsername(user.getUsername()) ;
    	String msg = "admin_user_save_success" ;
    	if(tempUser != null){
    		msg =  "admin_user_save_exist";
    	}else{
    		user.setPassword(FTools.md5(user.getPassword()));
    		userRepository.save(user) ;
    	}
    	if(user.getUsertype().equals("0")){
    		view = request(super.createRequestPageTempletResponse("redirect:/admin/user/index?msg="+msg)) ;
    	}else{ 
    		view = request(super.createRequestPageTempletResponse("redirect:/admin/user/list?msg="+msg)) ;
    	}
    	return view ; 
    }
    
    @RequestMapping("/edit")
    @Menu(type = "admin" , subtype = "user" , access = false , admin = true)
    public ModelAndView edit(ModelMap map , @Valid String id) {
    	ModelAndView view = request(super.createRequestPageTempletResponse("/admin/user/edit")) ;
    	view.addObject("userData", userRepository.findById(id)) ;
        return view;
    }
    
    @RequestMapping("/update")
    @Menu(type = "admin" , subtype = "user" , access = false , admin = true)
    public ModelAndView update(HttpServletRequest request ,@Valid User user) {
    	ModelAndView view = null ;
    	User tempUser = userRepository.findById(user.getId()) ;
    	String msg = "admin_user_update_success";
    	if(tempUser != null){
//	    	if(!tempUser.getId().equals(user.getId())){
//	    		msg =  "admin_user_update_exist";
//	    	}else{
	    		String nickname=user.getNickname();
	    		String firstname=user.getFirstname();
	    		String midname=user.getMidname();
	    		String lastname=user.getLastname();
	    		String language=user.getLanguage();
	    		String jobtitle=user.getJobtitle();
	    		String title=user.getTitle();
	    		String birthday=user.getBirthday();
	    		String department=user.getDepartment();
	    		String gender=user.getGender();
	    		String name=user.getName();
	    		String email=user.getEmail();
	    		String mobile=user.getMobile();
	    		String phone=user.getPhone();
	    		String parent_phone=user.getParent_phone();
	    		String organ=user.getOrgan();
	    		String skill=user.getSkill();
	    		String city=user.getCity();
	    		String province=user.getProvince();
	    		String sno=user.getSno();
	    		String grade=user.getGrade();
	    		String major=user.getMajor();
	    		String room_id=user.getRoom_id();
	    		String join_time=user.getJoin_time();
	    		String sign=user.getSign();
	    		String description=user.getDescription();
	    		String remark=user.getRemark();
	    		String username=user.getUsername();
	    		String password=user.getPassword();
	    		String secureconf=user.getSecureconf();
	    		String usertype=user.getUsertype();
	    		String creater=user.getCreater();
	    		Integer integral=user.getIntegral();
	    		String status=user.getStatus();
	    		String rank=user.getRank();
	    		
	    		if(null!=nickname&&!nickname.isEmpty())tempUser.setNickname(nickname);
	    		if(null!=firstname&&!firstname.isEmpty())tempUser.setFirstname(firstname);
	    		if(null!=midname&&!midname.isEmpty())tempUser.setMidname(midname);
	    		if(null!=lastname&&!lastname.isEmpty())tempUser.setLastname(lastname);
	    		if(null!=language&&!language.isEmpty())tempUser.setLanguage(language);
	    		if(null!=jobtitle&&!jobtitle.isEmpty())tempUser.setJobtitle(jobtitle);
	    		if(null!=title&&!title.isEmpty())tempUser.setTitle(title);
	    		if(null!=birthday&&!birthday.isEmpty())tempUser.setBirthday(birthday);
	    		if(null!=department&&!department.isEmpty())tempUser.setDepartment(department);
	    		if(null!=gender&&!gender.isEmpty())tempUser.setGender(gender);
	    		if(null!=name&&!name.isEmpty())tempUser.setName(name);
	    		if(null!=email&&!email.isEmpty())tempUser.setEmail(email);
	    		if(null!=mobile&&!mobile.isEmpty())tempUser.setMobile(mobile);
	    		if(null!=phone&&!phone.isEmpty())tempUser.setPhone(phone);
	    		if(null!=parent_phone&&!parent_phone.isEmpty())tempUser.setParent_phone(parent_phone);
	    		if(null!=organ&&!organ.isEmpty())tempUser.setOrgan(organ);
	    		if(null!=skill&&!skill.isEmpty())tempUser.setSkill(skill);
	    		if(null!=city&&!city.isEmpty())tempUser.setCity(city);
	    		if(null!=province&&!province.isEmpty())tempUser.setProvince(province);
	    		if(null!=sno&&!sno.isEmpty())tempUser.setSno(sno);
	    		if(null!=grade&&!grade.isEmpty())tempUser.setGrade(grade);
	    		if(null!=major&&!major.isEmpty())tempUser.setMajor(major);
	    		if(null!=room_id&&!room_id.isEmpty())tempUser.setRoom_id(room_id);
	    		if(null!=join_time&&!join_time.isEmpty())tempUser.setJoin_time(join_time);
	    		if(null!=sign&&!sign.isEmpty())tempUser.setSign(sign);
	    		if(null!=description&&!description.isEmpty())tempUser.setDescription(description);
	    		if(null!=remark&&!remark.isEmpty())tempUser.setRemark(remark);
	    		if(null!=username&&!username.isEmpty())tempUser.setUsername(username);
	    		if(null!=secureconf&&!secureconf.isEmpty())tempUser.setSecureconf(secureconf);
	    		if(null!=usertype&&!usertype.isEmpty())tempUser.setUsertype(usertype);
	    		if(null!=creater&&!creater.isEmpty())tempUser.setCreater(creater);
	    		if(null!=integral&&integral>=0)tempUser.setIntegral(integral);
	    		if(null!=status&&!status.isEmpty())tempUser.setStatus(status);
	    		if(null!=rank&&!rank.isEmpty())tempUser.setRank(rank);
	    		
	    		if(null!=password&&!password.isEmpty()) {
	    			tempUser.setPassword(FTools.md5(password));
	    		}
	    		
	    		if(tempUser.getCreatetime() == null){
	    			tempUser.setCreatetime(new Date());
	    		}
	    		tempUser.setUpdatetime(new Date());
	    		
	    		userRepository.save(tempUser) ;
//	    	}
    	}else{
    		msg =  "admin_user_update_not_exist";
    	}
    	if(user.getUsertype().equals("0")){
    		view = request(super.createRequestPageTempletResponse("redirect:/admin/user/index?msg="+msg)) ;
    	}else{ 
    		view = request(super.createRequestPageTempletResponse("redirect:/admin/user/list?msg="+msg)) ;
    	}
    	return view ; 
    }
    
    @RequestMapping("/delete")
    @Menu(type = "admin" , subtype = "user" , access = false , admin = true)
    public ModelAndView delete(HttpServletRequest request ,@Valid User user) {
    	String msg = "admin_user_delete" ;
    	if(user!=null){
	    	userRepository.delete(user);
    	}else{
    		msg = "admin_user_not_exist" ;
    	}
    	return request(super.createRequestPageTempletResponse("redirect:/admin/user/index?msg="+msg));
    }
}