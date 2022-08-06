package com.younsw.OutStargram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.younsw.OutStargram.user.bo.UserBO;

@Controller
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	public Map<String, String> signup(
			@RequestParam("loginId") String loginid
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			) {
		
		int count = userBO.insertUser(loginid, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
	}

}
