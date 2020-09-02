package com.f5704.ask.util.disruptor;

import com.f5704.ask.service.repository.UserEventRepository;
import com.f5704.ask.web.model.UserHistory;
import com.f5704.core.FDataContext;
import com.f5704.util.event.UserDataEvent;
import com.lmax.disruptor.EventHandler;

public class UserEventHandler implements EventHandler<UserDataEvent>{

	@Override
	public void onEvent(UserDataEvent arg0, long arg1, boolean arg2)
			throws Exception {
		UserEventRepository userEventRes = FDataContext.getContext().getBean(UserEventRepository.class) ;
		userEventRes.save((UserHistory)arg0.getEvent()) ;
	}

}
