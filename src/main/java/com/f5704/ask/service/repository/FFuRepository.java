package com.f5704.ask.service.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.f5704.ask.web.model.Message;

/**
 * 
 * @author admin
 *
 */
public interface FFuRepository extends ElasticsearchRepository<Message, String> , FFuEsCommonRepository {
	
}
