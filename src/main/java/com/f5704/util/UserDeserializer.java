package com.f5704.util;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.User;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;

public class UserDeserializer extends StdDeserializer<Set<User>>{
	private UserRepository userRepository;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public UserDeserializer() {
		this(String[].class);
	}
	public UserDeserializer(Class<?> vc) {
		super(vc);
		// TODO Auto-generated constructor stub
	}
	@Override
	public Set<User> deserialize(JsonParser jsonparser, DeserializationContext context) throws IOException {
		String[] ids= jsonparser.readValueAs(String[].class);
		HashSet<User> users=new HashSet<User>();
    	for(String id:ids) {
    		User user=userRepository.findById(id);
    		if(null==user)
    			continue;
        	users.add(user);
    	}
		return users;
	}
}