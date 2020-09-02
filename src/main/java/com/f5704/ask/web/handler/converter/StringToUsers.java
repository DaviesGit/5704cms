package com.f5704.ask.web.handler.converter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Controller;

import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.User;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class StringToUsers implements Converter<String, Set<User>> {


	@Autowired
	private UserRepository userRepository;
	

	private static ObjectMapper objectMapper=new ObjectMapper();

	@Override
	public Set<User> convert(String idStr) {
		Set<User> users = new HashSet<User>();
		String[] ids;
		try {
			ids = objectMapper.readValue(idStr, String[].class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return users;
		}
		for (String id : ids) {
			User user = userRepository.findById(id);
			if (null == user)
				continue;
			users.add(user);
		}
		return users;
	}
}
