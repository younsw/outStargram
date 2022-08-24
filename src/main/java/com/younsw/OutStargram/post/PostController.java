package com.younsw.OutStargram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.younsw.OutStargram.post.bo.PostBO;
import com.younsw.OutStargram.post.model.PostDetail;


@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/post/timeline/view")
	public String postView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postDetailList = postBO.selectPost(userId);
		model.addAttribute("postList", postDetailList);
		
		return "post/timeline";
	}
	
	@GetMapping("/post/create/view")
	public String postCreate() {
		return "post/creat";
	}

}
