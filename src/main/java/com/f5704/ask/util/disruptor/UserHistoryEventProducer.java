package com.f5704.ask.util.disruptor;

import com.f5704.util.event.UserDataEvent;
import com.f5704.util.event.UserEvent;
import com.lmax.disruptor.RingBuffer;

public class UserHistoryEventProducer {
	private final RingBuffer<UserDataEvent> ringBuffer;

    public UserHistoryEventProducer(RingBuffer<UserDataEvent> ringBuffer)
    {
        this.ringBuffer = ringBuffer;
    }

    public void onData(UserEvent userEvent)
    {
        long id = ringBuffer.next();  // Grab the next sequence
        try{
        	UserDataEvent event = ringBuffer.get(id);
        	event.setEvent(userEvent);
        }finally{
            ringBuffer.publish(id);
        }
    }
}
