package com.younsw.OutStargram.post.model;

import java.util.List;

import com.younsw.OutStargram.post.coment.model.Coment;
import com.younsw.OutStargram.post.coment.model.ComentDetail;
import com.younsw.OutStargram.user.model.User;

public class PostDetail {

	//user 정보
	private User user;
	
	//post 정보
	private Post post;
	// heart 정보
	private int heartCount;
	
	private List<ComentDetail> ComentList;
	
	private boolean isHeart;
	
	public int getheartCount() {
		return heartCount;
	}
	public void setHeart(int heartCount) {
		this.heartCount = heartCount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<ComentDetail> getComentList() {
		return ComentList;
	}
	public void setComentList(List<ComentDetail> comentList) {
		ComentList = comentList;
	}
	public boolean isHeart() {
		return isHeart;
	}
	public void setHeart(boolean isHeart) {
		this.isHeart = isHeart;
	}
	
	
	
	
}
