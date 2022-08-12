package com.younsw.OutStargram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.younsw.OutStargram.post.bo.PostBO;

@RestController
public class PostReatController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/post/creat")
	public Map<String, String> insertPost(
			@RequestParam("post") String post
			, @RequestParam("postImage") String postImage
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.insertPost(userId, post, postImage);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
		
	}
	
}
