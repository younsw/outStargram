package com.younsw.OutStargram.post;

import java.util.List;

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
	public String postView(Model model) {
		
		List<PostDetail> postDetailList = postBO.selectPost();
		model.addAttribute("postList", postDetailList);
		
		return "post/timeline";
	}
	
	@GetMapping("/post/create/view")
	public String postCreate() {
		return "post/creat";
	}

}
