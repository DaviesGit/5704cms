package com.f5704.ask.util.disruptor;

import com.f5704.util.event.UserDataEvent;
import com.lmax.disruptor.EventFactory;

public class UserHistoryEventFactory implements EventFactory<UserDataEvent>{

	@Override
	public UserDataEvent newInstance() {
		return new UserDataEvent();
	}
}
