package com.f5704.ask.web.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.elasticsearch.common.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.User;
import com.f5704.core.FDataContext;
import com.f5704.util.IP;
import com.f5704.util.IPTools;
import com.f5704.util.Menu;
import com.f5704.util.FTools;

/**
 *
 * @author F5704
 * @version 1.0.0
 *
 */
@Controller
public class LoginController extends Handler {

	@Autowired
	private UserRepository userRepository;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
			@RequestHeader(value = "referer", required = false) String referer, @Valid String msg) {
		ModelAndView view = request(super.createRequestPageTempletResponse("redirect:/"));
		if (request.getSession(true).getAttribute(FDataContext.USER_SESSION_NAME) == null) {
			view = request(super.createRequestPageTempletResponse("/login"));
			if (!StringUtils.isBlank(request.getParameter("referer"))) {
				referer = request.getParameter("referer");
			}
			if (!StringUtils.isBlank(referer)) {
				view.addObject("referer", referer);
			}
		}
		if (!StringUtils.isBlank(msg)) {
			view.addObject("msg", msg);
		}
		return view;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, @Valid User user,
			@Valid String referer) {
		ModelAndView view = request(super.createRequestPageTempletResponse("redirect:/"));
		if (request.getSession(true).getAttribute(FDataContext.USER_SESSION_NAME) == null) {
			if (user != null && user.getUsername() != null) {
				User loginUser = userRepository.findByUsernameAndPassword(user.getUsername(),
						FTools.md5(user.getPassword()));
				if (loginUser != null) {
					loginUser.setLogin(true);
					super.setUser(request, loginUser);
					if (!StringUtils.isBlank(referer)) {
						view = request(super.createRequestPageTempletResponse("redirect:" + referer));
					}
					loginUser.setLastlogintime(new Date());
					if (!StringUtils.isBlank(loginUser.getId())) {
						userRepository.save(loginUser);
					}
				} else {
					view = request(super.createRequestPageTempletResponse("/login"));
					if (!StringUtils.isBlank(referer)) {
						view.addObject("referer", referer);
					}
					view.addObject("msg", "0");
				}
			}
		}
		return view;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute(FDataContext.USER_SESSION_NAME);
		return "redirect:/";
	}

	@RequestMapping("/reg")
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView reg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = request(super.createRequestPageTempletResponse("/reg"));
		if (request.getSession(true).getAttribute(FDataContext.USER_SESSION_NAME) != null) {
			view = request(super.createRequestPageTempletResponse("redirect:/"));
		}
		return view;
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView reguser(HttpServletRequest request, HttpServletResponse response, @Valid User user) {
		ModelAndView view = request(super.createRequestPageTempletResponse("redirect:/login?msg=1"));
		if (request.getSession(true).getAttribute(FDataContext.USER_SESSION_NAME) == null) {
			User email = userRepository.findByEmail(user.getEmail());
			User username = userRepository.findByUsername(user.getUsername());
			if (email == null && username == null) {
				user.setPassword(FTools.md5(user.getPassword()));
				String addr = request.getRemoteAddr();
				IP ip = IPTools.getInstance().findGeography(addr);
				if (ip != null) {
					String province;
					String city;
					if (!"0".equals(province = ip.getProvince()))
						user.setProvince(province);
					if (!"0".equals(city = ip.getCity()))
						user.setCity(city);
				}
				userRepository.save(user);
			} else {
				view = request(super.createRequestPageTempletResponse("/reg"));
				if (username != null) {
					view.addObject("msg", "0");
				} else if (email != null) {
					view.addObject("msg", "1");
				}

			}
		}
		return view;
	}

}