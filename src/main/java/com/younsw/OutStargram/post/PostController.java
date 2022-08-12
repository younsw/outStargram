package com.younsw.OutStargram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.younsw.OutStargram.post.bo.PostBO;
import com.younsw.OutStargram.post.model.Post;


@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/post/timeline/view")
	public String postView(Model model) {
		
		List<Post> postList = postBO.selectPost();
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
	
	@GetMapping("/post/create/view")
	public String postCreate() {
		return "post/creat";
	}

}
