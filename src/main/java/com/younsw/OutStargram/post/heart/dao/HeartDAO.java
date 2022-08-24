package com.younsw.OutStargram.post.heart.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface HeartDAO {
	
	public int insertHeart(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int deleteHeart(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	
	public int getHeartCount(
			@Param("postId") int postId);
	
	public int selectCountHeartByPostUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int deleteByPostId(
			@Param("postId") int postId);

}
