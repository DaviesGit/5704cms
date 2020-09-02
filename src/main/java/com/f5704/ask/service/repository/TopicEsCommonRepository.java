package com.f5704.ask.service.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;

import com.f5704.ask.web.model.Topic;

public interface TopicEsCommonRepository {

	public Page<Topic> getAllTopic(String q, int p, int ps);

	public Page<Topic> getTopicByUser(String user, String q, int p, int ps);

	public Page<Topic> getTopicByCate(String cate, String q, int p, int ps);

	public Page<Topic> getTopicByCateAndUser(String cate, String q, String user, int p, int ps);

	public Page<Topic> getTopicByCateAndRela(String cate, String field, int p, int ps);

	public Page<Topic> findByCon(NativeSearchQueryBuilder searchQueryBuilder, String q, int p, int ps);

	public Page<Topic> countByCon(NativeSearchQueryBuilder searchQueryBuilder, String field, String q, int p, int ps);
}
