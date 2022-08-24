package com.younsw.OutStargram.post.heart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.younsw.OutStargram.post.heart.bo.HeartBO;

@RestController
public class HeartRestController {
	
	@Autowired
	private HeartBO heartBO;
	
	@GetMapping("post/heart")
	public Map<String, String> Heart(
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
		
		int count = heartBO.addHeart(postId, userId);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
		
	}
	
	// 좋아요 취소 api
	@GetMapping("post/unheart")
	public Map<String, String> unHeart(
			@RequestParam("postId") int postId
			, HttpServletRequest request) {

		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		int count = heartBO.unHeart(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
		
	}
	
}
