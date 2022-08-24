package com.younsw.OutStargram.post.coment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.younsw.OutStargram.post.coment.model.Coment;

@Repository
public interface ComentDAO {
	
	public int insertComent(
			@Param("postId") int postId
			, @Param("coment") String coment
			, @Param("userId") int userId);
	
	public List<Coment> selectComent(@Param("postId") int postId);
	
	public int deleteComent(@Param("postId") int postId);

}
