package com.f5704.ask.web.handler;

import static org.elasticsearch.index.query.QueryBuilders.termQuery;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f5704.ask.service.repository.TopicCommentRepository;
import com.f5704.ask.service.repository.TopicRepository;
import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.Topic;
import com.f5704.ask.web.model.TopicComment;
import com.f5704.ask.web.model.User;
import com.f5704.core.FDataContext;
import com.f5704.util.Menu;

@Controller
public class ApplicationController extends Handler {

	@Autowired
	private TopicRepository topicRes;

	@Autowired
	private UserRepository userRes;

	@Autowired
	private TopicCommentRepository topicCommentRes;

	@RequestMapping("/")
	@Menu(type = "apps",  access = true)
	public void index(HttpServletRequest request,HttpServletResponse response,@Valid String q) {
		response.setHeader("Location", "/info");
		response.setStatus(302);
	}
	
	private void addBasicInfoObject(ModelAndView view,String q,int p,int ps) {

		view.addObject("relaAnswersList", topicRes.getTopicByCateAndRela(FDataContext.AskSectionType.DEFAULT.toString(),
				"answers", p, PAGE_SIZE_TW));

		view.addObject("relaViewsList", topicRes.getTopicByCateAndRela(FDataContext.AskSectionType.DEFAULT.toString(),
				"views", p, PAGE_SIZE_TW));

		NativeSearchQueryBuilder query = new NativeSearchQueryBuilder()
				.withQuery(termQuery("cate", FDataContext.AskSectionType.DEFAULT.toString()))
				.addAggregation(AggregationBuilders.terms("creater").field("creater").order(Terms.Order.count(false))
						.subAggregation(AggregationBuilders.topHits("top").setExplain(true).setSize(1).setFrom(0)));
		Page<TopicComment> topicCommentFacetPage = topicCommentRes.findByCon(query, "creater", "top", q,
				p,ps);
		List<String> topUsers = new ArrayList<String>();
		for (int i = 0; i < topicCommentFacetPage.getContent().size(); i++) {
			TopicComment comment = topicCommentFacetPage.getContent().get(i);
			topUsers.add(comment.getCreater());
		}
		if (topUsers.size() > 0) {
			List<TopicComment> topUserCommentList = new ArrayList<TopicComment>();
			List<User> topUsersList = userRes.findAll(topUsers);
			for (TopicComment comment : topicCommentFacetPage.getContent()) {
				for (User user : topUsersList) {
					if (comment.getCreater().equals(user.getId())) {
						comment.setUser(user);
						topUserCommentList.add(comment);
						break;
					}
				}
			}
			view.addObject("topUserCommentList", topUserCommentList);
		}

	}
	
	@RequestMapping("/all")
	@Menu(type = "apps", subtype = "all", access = true)
	public ModelAndView all(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.getAllTopic(q, super.getP(request), super.get50Ps(request));

		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));
		
		return view;
	}
	@RequestMapping("/my")
	@Menu(type = "apps", subtype = "my", access = true)
	public ModelAndView my(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.getTopicByUser(super.getUser(request).getId(), q, super.getP(request),
				super.get50Ps(request));
		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));

		return view;
	}
	@RequestMapping("/essence")
	@Menu(type = "apps", subtype = "essence", access = true)
	public ModelAndView essence(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.findByCon(
				new NativeSearchQueryBuilder()
						.withQuery(termQuery("cate", FDataContext.AskSectionType.DEFAULT.toString()))
						.withQuery(termQuery("essence", true))
						.withSort(new FieldSortBuilder("updatetime").unmappedType("date").order(SortOrder.DESC)),
				q, super.getP(request), super.get50Ps(request));
		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));

		return view;
	}
	@RequestMapping("/info")
	@Menu(type = "apps", subtype = "info", access = true)
	public ModelAndView info(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.getTopicByCate("消息发布", q, super.getP(request),
				super.get50Ps(request));
		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));

		return view;
	}
	@RequestMapping("/activity")
	@Menu(type = "apps", subtype = "activity", access = true)
	public ModelAndView activity(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.getTopicByCate("活动", q, super.getP(request),
				super.get50Ps(request));
		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));

		return view;
	}
	@RequestMapping("/not_graduated")
	@Menu(type = "apps", subtype = "not_graduated", access = true)
	public ModelAndView not_graduated(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.getTopicByCate("在校", q, super.getP(request),
				super.get50Ps(request));
		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));

		return view;
	}
	@RequestMapping("/graduated")
	@Menu(type = "apps", subtype = "graduated", access = true)
	public ModelAndView graduated(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.getTopicByCate("毕业", q, super.getP(request),
				super.get50Ps(request));
		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));

		return view;
	}
	
	
	@RequestMapping("/chat")
	@Menu(type = "apps", subtype = "chat", access = true)
	public ModelAndView chat(HttpServletRequest request, @Valid String q) {
		ModelAndView view = request(super.createAppsTempletResponse("/apps/topic/index"));
		Page<Topic> defaultTopicList = topicRes.getTopicByCate("闲聊", q, super.getP(request),
				super.get50Ps(request));
		view.addObject("defaultTopicList", processCreater(defaultTopicList));
		addBasicInfoObject(view,q,super.getP(request), super.getPs(request));

		return view;
	}


	/**
	 * 处理 创建人
	 * 
	 * @param defaultTopicList
	 */
	protected Page<Topic> processCreater(Page<Topic> defaultTopicList) {
		List<String> users = new ArrayList<String>();
		for (Topic topic : defaultTopicList.getContent()) {
			users.add(topic.getCreater());
		}
		List<User> userList = userRes.findAll(users);
		for (Topic topic : defaultTopicList.getContent()) {
			for (User user : userList) {
				if (topic.getCreater().equals(user.getId())) {
					topic.setUser(user);
					break;
				}
			}
		}
		return defaultTopicList;
	}
}