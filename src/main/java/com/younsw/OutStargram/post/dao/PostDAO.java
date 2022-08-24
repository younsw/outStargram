package com.younsw.OutStargram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.younsw.OutStargram.post.model.Post;

@Repository
public interface PostDAO {
	
	public List<Post> selectPost();
	
	public int insertPost(@Param("userId") int userId
			, @Param("post") String post
			, @Param("image") String image);
	
	public Post selectPostByPostId(@Param("postId") int postId);
	
	public int deletePost(@Param("postId") int postId, @Param("userId") int userId);

}
