package com.younsw.OutStargram.post.coment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younsw.OutStargram.post.coment.dao.ComentDAO;
import com.younsw.OutStargram.post.coment.model.Coment;
import com.younsw.OutStargram.post.coment.model.ComentDetail;
import com.younsw.OutStargram.post.dao.PostDAO;
import com.younsw.OutStargram.user.bo.UserBO;
import com.younsw.OutStargram.user.model.User;

@Service
public class ComentBO {
	
	@Autowired
	private ComentDAO comentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int insertComent(int postId, String coment, int userId) {
		
		return comentDAO.insertComent(postId, coment, userId);
		
	}
	
	public List<ComentDetail> selectComent(int postId) {
		
		List<Coment> selectComent = comentDAO.selectComent(postId);  
		
		List<ComentDetail> ComentDetail = new ArrayList<>();
		
		for(Coment coment : selectComent) {
			
			int userId = coment.getUserId(); 
			User user = userBO.getUserById(userId);
			
			ComentDetail comentDetail = new ComentDetail();
			comentDetail.setComent(coment);
			comentDetail.setUser(user);
			
			ComentDetail.add(comentDetail);	
		}
		return ComentDetail;
		
	}
	
	// 해당하 postId의 모든 댓글 삭제
	public int deleteComent(int postId) {
		return comentDAO.deleteComent(postId);
	}

}
