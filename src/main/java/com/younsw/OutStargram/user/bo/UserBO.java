package com.younsw.OutStargram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younsw.OutStargram.common.EncrypthUtils;
import com.younsw.OutStargram.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired 
	private UserDAO userDAO;
	
	public int insertUser(String loginId, String password, String name, String email) {
		
		String encryptPassword = EncrypthUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}

}
