package com.younsw.OutStargram.post.coment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younsw.OutStargram.post.coment.dao.ComentDAO;

@Service
public class ComentBO {
	
	@Autowired
	private ComentDAO comentDAO;
	
	public int insertComent(int postId, String coment, int userId) {
		
		return comentDAO.insertComent(postId, coment, userId);
		
	}

}
