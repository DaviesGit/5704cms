package com.f5704.ask.web.handler.test;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.f5704.ask.service.repository.UserRepository;
import com.f5704.ask.web.model.User;
import com.f5704.util.Menu;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;


@Controller
public class ControllerTest  {
	

	@Autowired
	private UserRepository userRepository;
	
	
	  public static class UserDeserializer extends StdDeserializer<String>{
	  	private static final long serialVersionUID = 1L;
	  	public UserDeserializer() {
	  		this(String.class);
	  	}
	  	public UserDeserializer(Class<?> vc) {
	  		super(vc);
	  		// TODO Auto-generated constructor stub
	  	}
	  	@Override
	  	public String deserialize(JsonParser jsonparser, DeserializationContext context) throws IOException {
	  		String ids= jsonparser.readValueAs(String.class);
	  		
	  		return ids+" parsed!";
	  	}
	  }
	  
	  public static class UserSerializer extends  StdSerializer<String>{
	  	private static final long serialVersionUID = 1L;
	  	 
	      public UserSerializer() { 
	          this(null); 
	      } 
	   
	      public UserSerializer(Class<String> t) {
	          super(t); 
	      }
	  	@Override
	      public void serialize(
	        String value, JsonGenerator gen, SerializerProvider arg2) 
	        throws IOException, JsonProcessingException {
	          gen.writeString(value+" serialized!");
	      }
	  }
	  
	  
	  public static class T {
	  	public String sno;
	  	public String getSno() {
	  		return this.sno;
	  	}
	  	public void setSno(String sno) {
	  		this.sno=sno;
	  	}
	  }
	  
//	  @ResponseBody
//	  @RequestMapping(value = "/t")
//	  @Menu(type = "apps" , subtype = "user" , access = true)
//	  public User t(T t) {
//	  	User user=userRepository.findBySno(t.getSno());
//	  	user.setProjects(null);
//	  	return user;
//	  }

    
}
