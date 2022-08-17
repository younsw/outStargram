package com.younsw.OutStargram.post.heart.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younsw.OutStargram.post.heart.dao.HeartDAO;

@Service
public class HeartBO {
	
	@Autowired
	private HeartDAO heartDAO;
	
	public int addHeart(int postId,int userId) {
		
		return heartDAO.insertHeart(postId, userId);
		
	}

}
