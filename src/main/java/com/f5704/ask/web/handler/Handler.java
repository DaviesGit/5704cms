package com.f5704.ask.web.handler;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.f5704.ask.web.model.User;
import com.f5704.core.FDataContext;
import com.f5704.util.FTools;
import com.f5704.util.FView;


@Controller
@SessionAttributes
public class Handler {
	public final static int PAGE_SIZE_BG = 1 ;
	public final static int PAGE_SIZE_TW = 10 ;
	public final static int PAGE_SIZE_FV = 20 ;
	public final static int PAGE_SIZE_HA = 30 ;
	
	public User getUser(HttpServletRequest request){
		User user = (User) request.getSession(true).getAttribute(FDataContext.USER_SESSION_NAME)  ;
		if(user==null){
			user = new User();
			user.setId(FTools.getContextID(request.getSession().getId())) ;
			user.setUsername(FDataContext.GUEST_USER+"_"+FTools.genIDByKey(user.getId())) ;
			user.setSessionid(user.getId()) ;
			user.setLogin(false);
		}else{
			user.setSessionid(user.getId()) ;
		}
		return user ;
	}
	
	public User getIMUser(HttpServletRequest request , String sign){
		User user = (User) request.getSession(true).getAttribute(FDataContext.IM_USER_SESSION_NAME)  ;
		if(user==null){
			user = new User();
			if(!StringUtils.isBlank(sign)){
				user.setId(sign) ;
			}else{
				user.setId(FTools.getContextID(request.getSession().getId())) ;
			}
			user.setUsername(FDataContext.GUEST_USER+"_"+FTools.genIDByKey(user.getId())) ;
			user.setSessionid(user.getId()) ;
		}else{
			user.setSessionid(FTools.getContextID(request.getSession().getId())) ;
		}
		return user ;
	}
	
	
	public void setUser(HttpServletRequest request , User user){
		request.getSession(true).removeAttribute(FDataContext.USER_SESSION_NAME) ;
		request.getSession(true).setAttribute(FDataContext.USER_SESSION_NAME , user) ;
	}
	

	/**
	 * 创建系统监控的 模板页面
	 * @param page
	 * @return
	 */
	public FView createAdminTempletResponse(String page) {
		return new FView("/admin/include/tpl" , page);
	}
	/**
	 * 创建系统监控的 模板页面
	 * @param page
	 * @return
	 */
	public FView createAppsTempletResponse(String page) {
		return new FView("/apps/include/tpl" , page);
	}

	public FView createRequestPageTempletResponse(String templet , String page) {
		return new FView(templet, page);
	}
	public FView createRequestPageTempletResponse(String page) {
		return new FView(page);
	}
	
	/**
	 * 
	 * @param data
	 * @return
	 */
	public ModelAndView request(FView data) {
    	return new ModelAndView(data.getTemplet()!=null ? data.getTemplet(): data.getPage() , "data", data) ;
    }

	public int getP(HttpServletRequest request) {
		int page = 0;
		String p = request.getParameter("p") ;
		if(!StringUtils.isBlank(p) && p.matches("[\\d]*")){
			page = Integer.parseInt(p) ;
			if(page > 0){
				page = page - 1 ;
			}
		}
		return page;
	}
	
	public int getPs(HttpServletRequest request) {
		int pagesize = PAGE_SIZE_TW;
		String ps = request.getParameter("ps") ;
		if(!StringUtils.isBlank(ps) && ps.matches("[\\d]*")){
			pagesize = Integer.parseInt(ps) ;
		}
		return pagesize;
	}
	
	public int get50Ps(HttpServletRequest request) {
		int pagesize = PAGE_SIZE_FV;
		String ps = request.getParameter("ps") ;
		if(!StringUtils.isBlank(ps) && ps.matches("[\\d]*")){
			pagesize = Integer.parseInt(ps) ;
		}
		return pagesize;
	}
}
