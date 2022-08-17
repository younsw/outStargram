package com.younsw.OutStargram.post.coment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ComentDAO {
	
	public int insertComent(
			@Param("postId") int postId
			, @Param("coment") String coment
			, @Param("userId") int userId);

}
