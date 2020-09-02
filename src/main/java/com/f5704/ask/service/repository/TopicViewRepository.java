package com.f5704.ask.service.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.f5704.ask.web.model.TopicView;

public interface TopicViewRepository extends  ElasticsearchRepository<TopicView, String> , TopicViewEsCommonRepository {
}
