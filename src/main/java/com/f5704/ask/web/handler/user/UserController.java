package com.f5704.ask.web.handler.user;

import static org.elasticsearch.index.query.QueryBuilders.termQuery;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.elasticsearch.common.lang3.StringUtils;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.f5704.ask.service.repository.FansRepository;
import com.f5704.ask.service.repository.TopicCommentRepository;
import com.f5704.ask.service.repository.TopicRepository;
import com.f5704.ask.service.repository.FFuRepository;
import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.handler.Handler;
import com.f5704.ask.web.model.Achievement;
import com.f5704.ask.web.model.Fans;
import com.f5704.ask.web.model.Message;
import com.f5704.ask.web.model.Project;
import com.f5704.ask.web.model.Topic;
import com.f5704.ask.web.model.TopicComment;
import com.f5704.ask.web.model.User;
import com.f5704.util.FTools;
import com.f5704.util.IP;
import com.f5704.util.IPTools;
import com.f5704.util.Menu;

@Controller
@RequestMapping("/user")
public class UserController extends Handler {

	@Autowired
	private UserRepository userRes;

	@Autowired
	private TopicRepository topicRes;

	@Autowired
	private FansRepository fansRes;

	@Autowired
	private FFuRepository fFuRes;

	@Autowired
	private TopicCommentRepository topicCommentRes;

	@Value("${web.upload-path}")
	private String path;

	@RequestMapping("/index")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return request(
				super.createRequestPageTempletResponse("redirect:/user/index/" + super.getUser(request).getId() + ""));
	}

	@RequestMapping("/index/{userid}")
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid,
			@Valid String q, @RequestParam(value = "tab", required = false) String tab,
			@RequestParam(value = "project_id", required = false) String project_id,
			@RequestParam(value = "achievement_id", required = false) String achievement_id) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/index"));
		view.addObject("tab", tab);

		User curruser = userRes.findById(userid);
		if (curruser != null) {
			if (super.getUser(request).isLogin()) {
				view.addObject("fan", fansRes.findByUserAndCreater(userid, super.getUser(request).getId()));
			}
			Project projectData = null;
			Set<Project> projects = curruser.getProjects();
			for (Project project : projects)
				if (null != project_id && project_id.equals(project.getId())) {
					projectData = project;
					break;
				}
			if (null == projectData && projects.size() > 0)
				projectData = projects.iterator().next();
			view.addObject("projectData", projectData);

			Achievement achievementData = null;
			Set<Achievement> achievements = curruser.getAchievements();
			for (Achievement achievement : achievements)
				if (null != achievement_id && achievement_id.equals(achievement.getId())) {
					achievementData = achievement;
					break;
				}
			if (null == achievementData && achievements.size() > 0)
				achievementData = achievements.iterator().next();
			view.addObject("achievementData", achievementData);

			view.addObject("userData", curruser);

			view.addObject("follows", fansRes.countByCreater(userid));

			view.addObject("fans", fansRes.countByUser(userid));

			view.addObject(
					"topicList", topicRes
							.findByCon(
									new NativeSearchQueryBuilder().withQuery(termQuery("creater", userid))
											.withSort(new FieldSortBuilder("updatetime").unmappedType("date")
													.order(SortOrder.DESC)),
									q, super.getP(request), super.get50Ps(request)));

			int ps = super.getPs(request);
			NativeSearchQueryBuilder query = new NativeSearchQueryBuilder().withQuery(termQuery("creater", userid))
					.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC))
					.addAggregation(AggregationBuilders.terms("dataid").field("dataid")
							.subAggregation(AggregationBuilders.topHits("top")
									.addSort(new FieldSortBuilder("updatetime").unmappedType("date")
											.order(SortOrder.DESC))
									.setExplain(true).setSize(1).setFrom(0))
							.size(super.getP(request) * ps));
			Page<TopicComment> topicCommentFacetPage = topicCommentRes.findByCon(query, "dataid", "top", q,
					super.getP(request), ps);
			List<String> relaTopics = new ArrayList<String>();
			for (int i = 0; i < topicCommentFacetPage.getContent().size() && i < ps; i++) {
				TopicComment comment = topicCommentFacetPage.getContent().get(i);
				relaTopics.add(comment.getDataid());
			}
			List<TopicComment> resultTopicCommentList = new ArrayList<TopicComment>();
			if (relaTopics.size() > 0) {
				Iterable<Topic> topicList = topicRes.findAll(relaTopics);
				for (Topic topic : topicList) {
					for (TopicComment comment : topicCommentFacetPage.getContent()) {
						if (comment.getDataid().equals(topic.getId())) {
							comment.setTopic(topic);
							resultTopicCommentList.add(comment);
							break;
						}
					}
				}

			}
			view.addObject("topicCommentList", resultTopicCommentList);
		} else {
			view = request(super.createRequestPageTempletResponse("redirect:/"));
		}

		return view;
	}

	@RequestMapping("/comment/{userid}")
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView comment(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid,
			@Valid String q) {
		ModelAndView view = request(super.createRequestPageTempletResponse("/apps/user/comment"));

		int ps = super.getPs(request), p = super.getP(request) + 1; // 流式 翻页 默认从 第二页开始
		NativeSearchQueryBuilder query = new NativeSearchQueryBuilder().withQuery(termQuery("creater", userid))
				.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC))
				.addAggregation(AggregationBuilders.terms("dataid").field("dataid")
						.subAggregation(AggregationBuilders.topHits("top")
								.addSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC))
								.setExplain(true).setSize(1).setFrom(0))
						.size(p * ps));
		Page<TopicComment> topicCommentFacetPage = topicCommentRes.findByCon(query, "dataid", "top", q, p, ps);
		List<String> relaTopics = new ArrayList<String>();
		if (topicCommentFacetPage.getContent().size() == p * ps) {
			for (int i = topicCommentFacetPage.getContent().size() - 1; i >= topicCommentFacetPage.getContent().size()
					- ps; i--) {
				TopicComment comment = topicCommentFacetPage.getContent().get(i);
				relaTopics.add(comment.getDataid());
			}
			Iterable<Topic> topicList = topicRes.findAll(relaTopics);
			List<TopicComment> resultTopicCommentList = new ArrayList<TopicComment>();
			for (Topic topic : topicList) {
				for (TopicComment comment : topicCommentFacetPage.getContent()) {
					if (comment.getDataid().equals(topic.getId())) {
						comment.setTopic(topic);
						resultTopicCommentList.add(comment);
						break;
					}
				}
			}

			view.addObject("topicCommentList", resultTopicCommentList);
		}
		return view;
	}

	@RequestMapping("/profile")
	@Menu(type = "apps", subtype = "user", name = "profile", access = false)
	public ModelAndView profile(HttpServletRequest request, HttpServletResponse response, @Valid String orgi,
			@Valid String t) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/profile"));
		User user = userRes.getOne(super.getUser(request).getId());
		if (StringUtils.isBlank(user.getProvince()) || StringUtils.isBlank(user.getCity())) {
			IP ip = IPTools.getInstance().findGeography(request.getRemoteAddr());
			if (ip.getProvince().equals("0")) {
//				user.setProvince("未知");
			} else {
				user.setProvince(ip.getProvince());
			}
			if (ip.getCity().equals("0")) {
//				user.setCity("未知");
			} else {
				user.setCity(ip.getCity());
			}
		}
		view.addObject("userData", user);

		if (!StringUtils.isBlank(t)) {
			view.addObject("t", t);
		}

		return view;
	}

	@RequestMapping("/profile/save")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView profilesave(HttpServletRequest request, HttpServletResponse response, @Valid User tuser) {
		ModelAndView view = request(super.createRequestPageTempletResponse("redirect:/user/profile?msg=1"));
		User user = userRes.findById(super.getUser(request).getId());

		User eusers = userRes.findByUsername(tuser.getUsername());

		if (eusers == null || eusers.getId().equals(user.getId())) {
			String nickname = tuser.getNickname();
			String firstname = tuser.getFirstname();
			String midname = tuser.getMidname();
			String lastname = tuser.getLastname();
			String language = tuser.getLanguage();
			String jobtitle = tuser.getJobtitle();
			String title = tuser.getTitle();
			String birthday = tuser.getBirthday();
			String department = tuser.getDepartment();
			String gender = tuser.getGender();
			String name = tuser.getName();
			String email = tuser.getEmail();
			String mobile = tuser.getMobile();
			String phone = tuser.getPhone();
			String parent_phone = tuser.getParent_phone();
			String organ = tuser.getOrgan();
			String skill = tuser.getSkill();
			String city = tuser.getCity();
			String province = tuser.getProvince();
			String sno = tuser.getSno();
			String grade = tuser.getGrade();
			String major = tuser.getMajor();
			String room_id = tuser.getRoom_id();
			String join_time = tuser.getJoin_time();
			String sign = tuser.getSign();
			String description = tuser.getDescription();
			String remark = tuser.getRemark();
			if (null != nickname && !nickname.isEmpty())
				user.setNickname(nickname);
			if (null != firstname && !firstname.isEmpty())
				user.setFirstname(firstname);
			if (null != midname && !midname.isEmpty())
				user.setMidname(midname);
			if (null != lastname && !lastname.isEmpty())
				user.setLastname(lastname);
			if (null != language && !language.isEmpty())
				user.setLanguage(language);
			if (null != jobtitle && !jobtitle.isEmpty())
				user.setJobtitle(jobtitle);
			if (null != title && !title.isEmpty())
				user.setTitle(title);
			if (null != birthday && !birthday.isEmpty())
				user.setBirthday(birthday);
			if (null != department && !department.isEmpty())
				user.setDepartment(department);
			if (null != gender && !gender.isEmpty())
				user.setGender(gender);
			if (null != name && !name.isEmpty())
				user.setName(name);
			if (null != email && !email.isEmpty())
				user.setEmail(email);
			if (null != mobile && !mobile.isEmpty())
				user.setMobile(mobile);
			if (null != phone && !phone.isEmpty())
				user.setPhone(phone);
			if (null != parent_phone && !parent_phone.isEmpty())
				user.setParent_phone(parent_phone);
			if (null != organ && !organ.isEmpty())
				user.setOrgan(organ);
			if (null != skill && !skill.isEmpty())
				user.setSkill(skill);
			if (null != city && !city.isEmpty())
				user.setCity(city);
			if (null != province && !province.isEmpty())
				user.setProvince(province);
			if (null != sno && !sno.isEmpty())
				user.setSno(sno);
			if (null != grade && !grade.isEmpty())
				user.setGrade(grade);
			if (null != major && !major.isEmpty())
				user.setMajor(major);
			if (null != room_id && !room_id.isEmpty())
				user.setRoom_id(room_id);
			if (null != join_time && !join_time.isEmpty())
				user.setJoin_time(join_time);
			if (null != sign && !sign.isEmpty())
				user.setSign(sign);
			if (null != description && !description.isEmpty())
				user.setDescription(description);
			if (null != remark && !remark.isEmpty())
				user.setRemark(remark);
			userRes.save(user);
		} else {
			view = request(super.createRequestPageTempletResponse("redirect:/user/profile?msg=0"));
		}

		return view;
	}

	@RequestMapping("/profile/avator")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView profilesave(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "avator", required = false) MultipartFile avator,
			@RequestParam(value = "width", required = false) Integer width,
			@RequestParam(value = "height", required = false) Integer height) throws Exception {
		User user = userRes.getOne(super.getUser(request).getId());
		ModelAndView view = request(super.createRequestPageTempletResponse("redirect:/user/profile?t=avator"));
		String imgid = user.getId();
		int errorCode = 0;
		String errorMsg = "";
		if (avator != null) {
			try {
				BufferedImage img = ImageIO.read(avator.getInputStream());
				BufferedImage scaledImg = Scalr.resize(img, Method.AUTOMATIC, Mode.AUTOMATIC,
						Math.min(null == width ? 400 : width, img.getWidth()),
						Math.min(null == height ? 400 : height, img.getHeight()));
				ImageIO.write(scaledImg, "jpg", new File(path, imgid));
			} catch (Exception e) {
				errorCode = 1;
				errorMsg = e.toString();
			}
		}
		view.addObject("imgid", imgid);
		view.addObject("name", null != avator ? avator.getName() : null);
		view.addObject("errorCode", errorCode);
		view.addObject("errorMsg", errorMsg);
		return view;
	}

	@RequestMapping("/profile/changepasswd")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView passwd(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "oldpasswd", required = true) String oldpasswd,
			@RequestParam(value = "passwd", required = true) String passwd) throws Exception {
		ModelAndView view;
		User user = userRes.findByIdAndPassword(super.getUser(request).getId(), FTools.md5(oldpasswd));
		if (null != user) {
			if (null != passwd && !passwd.isEmpty()) {
				user.setPassword(FTools.md5(passwd));
			}
			userRes.save(user);
			view = request(super.createRequestPageTempletResponse("redirect:/user/profile?msg=1"));
		} else {
			view = request(super.createRequestPageTempletResponse("redirect:/user/profile?msg=2"));
		}
		return view;
	}

	@RequestMapping("/fans/list/{userid}")
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView fanslist(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid)
			throws Exception {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/fans"));
		Pageable page = new PageRequest(super.getP(request), super.getPs(request),
				new Sort(Direction.DESC, "createtime"));
		Page<Fans> fansList = fansRes.findByUser(userid, page);

		List<String> userids = new ArrayList<String>();
		for (Fans fan : fansList) {
			userids.add(fan.getCreater());
		}
		if (userids.size() > 0) {
			view.addObject("fansList", new PageImpl<User>(userRes.findAll(userids), page, fansList.getTotalElements()));
		}

		User curruser = userRes.findById(userid);
		if (super.getUser(request).isLogin()) {
			view.addObject("fan", fansRes.findByUserAndCreater(userid, super.getUser(request).getId()));
		}
		view.addObject("userData", curruser);

		view.addObject("follows", fansRes.countByCreater(userid));

		view.addObject("fans", fansRes.countByUser(userid));

		return view;
	}

	@RequestMapping("/follows/list/{userid}")
	@Menu(type = "apps", subtype = "user", access = true)
	public ModelAndView follows(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid)
			throws Exception {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/follows"));
		Pageable page = new PageRequest(super.getP(request), super.getPs(request),
				new Sort(Direction.DESC, "createtime"));
		Page<Fans> fansList = fansRes.findByCreater(userid, page);

		List<String> userids = new ArrayList<String>();
		for (Fans fan : fansList) {
			userids.add(fan.getUser());
		}
		if (userids.size() > 0) {
			view.addObject("fansList", new PageImpl<User>(userRes.findAll(userids), page, fansList.getTotalElements()));
		}

		User curruser = userRes.findById(userid);
		if (super.getUser(request).isLogin()) {
			view.addObject("fan", fansRes.findByUserAndCreater(userid, super.getUser(request).getId()));
		}
		view.addObject("userData", curruser);

		view.addObject("follows", fansRes.countByCreater(userid));

		view.addObject("fans", fansRes.countByUser(userid));

		return view;
	}

	@RequestMapping("/fans/{userid}")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView fans(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid)
			throws Exception {
		User user = userRes.getOne(super.getUser(request).getId());
		if (fansRes.findByUserAndCreater(userid, user.getId()) == null && !user.getId().equals(userid)) {
			Fans fans = new Fans();
			fans.setCreater(user.getId());
			fans.setUser(userid);
			fansRes.save(fans);

			user.setFollows(user.getFollows() + 1);
			userRes.save(user);

			User target = userRes.getOne(userid);
			target.setFans(fansRes.countByUser(userid));
			userRes.save(target);
		}
		return request(super.createRequestPageTempletResponse("redirect:/user/index/{userid}"));
	}

	@RequestMapping("/unfans/{userid}")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView unfans(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid)
			throws Exception {
		User user = userRes.getOne(super.getUser(request).getId());
		Fans fan = fansRes.findByUserAndCreater(userid, user.getId());
		if (fan != null) {
			fansRes.delete(fan);
			if (user.getFollows() > 0) {
				user.setFollows(user.getFollows() - 1);
				userRes.save(user);
			}

			User target = userRes.getOne(userid);
			target.setFans(fansRes.countByUser(userid));
			userRes.save(target);
		}

		return request(super.createRequestPageTempletResponse("redirect:/user/index/{userid}"));
	}

	@RequestMapping("/center")
	@Menu(type = "apps", subtype = "user", name = "center", access = false)
	public ModelAndView center(HttpServletRequest request, HttpServletResponse response, @Valid String orgi,
			@Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/center"));
		User user = userRes.getOne(super.getUser(request).getId());
		view.addObject("userData", user);

		view.addObject("topicList", topicRes.findByCon(
				new NativeSearchQueryBuilder().withQuery(termQuery("creater", super.getUser(request).getId()))
						.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC)),
				q, super.getP(request), super.get50Ps(request)));

		return view;
	}

	@RequestMapping("/center/answer")
	@Menu(type = "apps", subtype = "user", name = "answer", access = false)
	public ModelAndView answer(HttpServletRequest request, HttpServletResponse response, @Valid String orgi,
			@Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/answer"));
		User user = userRes.getOne(super.getUser(request).getId());
		view.addObject("userData", user);

		int ps = super.getPs(request);
		NativeSearchQueryBuilder query = new NativeSearchQueryBuilder()
				.withQuery(termQuery("creater", super.getUser(request).getId()))
				.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC))
				.addAggregation(AggregationBuilders.terms("dataid").field("dataid")
						.subAggregation(AggregationBuilders.topHits("top").setExplain(true).setSize(1).setFrom(0))
						.size(super.getP(request) * ps));
		Page<TopicComment> topicCommentFacetPage = topicCommentRes.findByCon(query, "dataid", "top", q,
				super.getP(request), ps);
		List<String> relaTopics = new ArrayList<String>();
		for (int i = 0; i < topicCommentFacetPage.getContent().size() && i < ps; i++) {
			TopicComment comment = topicCommentFacetPage.getContent().get(i);
			relaTopics.add(comment.getDataid());
		}
		List<TopicComment> resultTopicCommentList = new ArrayList<TopicComment>();
		if (relaTopics.size() > 0) {
			Iterable<Topic> topicList = topicRes.findAll(relaTopics);
			for (Topic topic : topicList) {
				for (TopicComment comment : topicCommentFacetPage.getContent()) {
					if (comment.getDataid().equals(topic.getId())) {
						comment.setTopic(topic);
						resultTopicCommentList.add(comment);
						break;
					}
				}
			}

		}
		view.addObject("topicCommentList", resultTopicCommentList);
		return view;
	}

	@RequestMapping("/center/fans")
	@Menu(type = "apps", subtype = "user", name = "fans", access = false)
	public ModelAndView centerfans(HttpServletRequest request, HttpServletResponse response, @Valid String orgi,
			@Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/centerfans"));
		String userid = super.getUser(request).getId();
		Pageable page = new PageRequest(super.getP(request), super.getPs(request),
				new Sort(Direction.DESC, "createtime"));
		Page<Fans> fansList = fansRes.findByUser(userid, page);

		List<String> userids = new ArrayList<String>();
		for (Fans fan : fansList) {
			userids.add(fan.getCreater());
		}
		if (userids.size() > 0) {
			view.addObject("fansList", new PageImpl<User>(userRes.findAll(userids), page, fansList.getTotalElements()));
		}

		return view;
	}

	@RequestMapping("/center/follows")
	@Menu(type = "apps", subtype = "user", name = "follows", access = false)
	public ModelAndView centerfollows(HttpServletRequest request, HttpServletResponse response, @Valid String orgi,
			@Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/centerfollows"));
		String userid = super.getUser(request).getId();
		Pageable page = new PageRequest(super.getP(request), super.getPs(request),
				new Sort(Direction.DESC, "createtime"));
		Page<Fans> fansList = fansRes.findByCreater(userid, page);

		List<String> userids = new ArrayList<String>();
		for (Fans fan : fansList) {
			userids.add(fan.getUser());
		}
		if (userids.size() > 0) {
			view.addObject("fansList", new PageImpl<User>(userRes.findAll(userids), page, fansList.getTotalElements()));
		}

		return view;
	}

	@RequestMapping("/message/{userid}")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView message(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid)
			throws Exception {
		ModelAndView view = request(super.createRequestPageTempletResponse("/apps/user/sendmsg"));
		User curruser = userRes.getOne(userid);
		view.addObject("userData", curruser);
		return view;
	}

	@RequestMapping("/sendmsg/{userid}")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView sendmsg(HttpServletRequest request, HttpServletResponse response, @PathVariable String userid,
			@Valid Message message, @RequestHeader(value = "referer", required = false) String referer)
			throws Exception {
		ModelAndView view = request(super.createRequestPageTempletResponse("redirect:/user/messages"));
		if (!StringUtils.isBlank(referer)) {
			if (referer.indexOf("?") > 0) {
				view = request(super.createRequestPageTempletResponse("redirect:" + referer + "&msg=sendmsg"));
			} else {
				view = request(super.createRequestPageTempletResponse("redirect:" + referer + "?msg=sendmsg"));
			}
		}
		if (message != null) {
			message.setCreater(super.getUser(request).getId());
			message.setFromuser(super.getUser(request).getId());
			message.setTouser(userid);

			message.setStatus("0");

			message.setUserid(super.getUser(request).getId());
			message.setOwner(userid);
			message.setMsgtype("recive");
			message.setOrgi(super.getUser(request).getOrgi());
			fFuRes.save(message);

			Message owner = new Message();

			owner.setCreater(super.getUser(request).getId());
			owner.setFromuser(super.getUser(request).getId());
			owner.setTouser(userid);

			owner.setOrgi(super.getUser(request).getOrgi());
			owner.setUserid(userid);
			owner.setStatus("1");
			owner.setOwner(super.getUser(request).getId());
			owner.setMsgtype("send");
			owner.setContent(message.getContent());

			fFuRes.save(owner);

		}
		return view;
	}

	@RequestMapping("/messages")
	@Menu(type = "apps", subtype = "user", name = "messages", access = false)
	public ModelAndView messages(HttpServletRequest request, HttpServletResponse response, @Valid String orgi,
			@Valid String q, @Valid String op) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/messages"));
		if (!StringUtils.isBlank(op) && op.equals("load")) {
			view = request(super.createRequestPageTempletResponse("/apps/user/message"));
		}
		final String userid = super.getUser(request).getId();
		int ps = super.getPs(request);
		NativeSearchQueryBuilder query = new NativeSearchQueryBuilder().withQuery(termQuery("owner", userid))
				.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC))
				.addAggregation(AggregationBuilders.terms("userid").field("userid")
						.subAggregation(AggregationBuilders.topHits("top")
								.addSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC))
								.setExplain(true).setSize(1).setFrom(0))
						.size(super.getP(request) * ps));
		Page<Serializable> messageFacetPage = fFuRes.findByCon(Message.class, query, q, super.getP(request), ps);
		List<String> messages = new ArrayList<String>();
		for (int i = messageFacetPage.getContent().size() - 1; i >= super.getP(request) * ps
				&& i >= messageFacetPage.getContent().size() - ps; i--) {
			Message message = (Message) messageFacetPage.getContent().get(i);
			messages.add(message.getUserid());
		}
		List<Message> messageList = new ArrayList<Message>();
		if (messages.size() > 0) {
			List<User> userList = userRes.findAll(messages);
			for (int i = messageFacetPage.getContent().size() - 1; i >= super.getP(request) * ps
					&& i >= messageFacetPage.getContent().size() - ps; i--) {
				Message message = (Message) messageFacetPage.getContent().get(i);
				for (User user : userList) {
					if (message.getUserid().equals(user.getId())) {
						message.setTarget(user);
						messageList.add(message);
						break;
					}
				}

			}
		}
		view.addObject("msgList", messageList);

		return view;
	}

	@RequestMapping("/message/delete/{userid}")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView messagedelete(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String userid) throws Exception {
		ModelAndView view = request(super.createRequestPageTempletResponse("redirect:/user/messages"));
		fFuRes.deleteByQuery(termQuery("userid", userid), Message.class);
		return view;
	}

	@RequestMapping("/message/list/{userid}")
	@Menu(type = "apps", subtype = "user", access = false)
	public ModelAndView messagelist(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String userid) throws Exception {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/user/messagelist"));
		view.addObject("msgList", fFuRes.findByUserid(userid, super.getP(request), super.getPs(request)));
		return view;
	}

}