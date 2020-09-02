package com.f5704.ask.service.repository;

import com.f5704.ask.web.model.TopicView;



public interface TopicViewEsCommonRepository {
	public long findByIpcode(String id , String ip , String optype)  ;
	
	public TopicView findByCreaterAndDataid(String creater , String dataid) ;
}
