package com.younsw.OutStargram.post.coment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.younsw.OutStargram.post.coment.bo.ComentBO;

@RestController
public class ComentReatController {
	
	@Autowired
	private ComentBO comentBO;
	
	public Map<String, String> insertComent(
			@RequestParam("postId") int postId
			, @RequestParam("coement") String coemnt
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		Map<String ,String> result = new HashMap<>();
		
		int count = comentBO.insertComent(postId, coemnt, userId);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
		
	}

}
