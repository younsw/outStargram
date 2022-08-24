package com.younsw.OutStargram.post.coment.model;

import com.younsw.OutStargram.user.model.User;

public class ComentDetail {
	
	private Coment coment;
	private User user;
	
	public Coment getComent() {
		return coment;
	}
	public void setComent(Coment coment) {
		this.coment = coment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

}
