package com.younsw.OutStargram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younsw.OutStargram.post.dao.PostDAO;
import com.younsw.OutStargram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public List<Post> selectPost() {
		return postDAO.selectPost();
	}
	
	public int insertPost(int userId, String post, String postImage) {
		return postDAO.insertPost(userId, post, postImage);
	}

}
