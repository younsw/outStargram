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
	
	public int unHeart(int postId, int userId) {
		return heartDAO.deleteHeart(postId, userId);
	}
	
	public int getHeartId(int postId) {
		return heartDAO.getHeartCount(postId);
	}
	
//	postId 와 userId 가 모두 일치하는 
	public boolean isHeart(int postId, int userId) {
		// postId와 userId가 모두 일치하는 행의 개수
		int count = heartDAO.selectCountHeartByPostUserId(postId, userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	public int deleteHeartByPostId(int postId) {
		return heartDAO.deleteByPostId(postId);
	}

}
