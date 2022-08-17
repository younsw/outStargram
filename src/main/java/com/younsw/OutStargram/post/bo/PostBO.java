package com.younsw.OutStargram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.younsw.OutStargram.common.FileManagerService;
import com.younsw.OutStargram.post.dao.PostDAO;
import com.younsw.OutStargram.post.model.Post;
import com.younsw.OutStargram.post.model.PostDetail;
import com.younsw.OutStargram.user.bo.UserBO;
import com.younsw.OutStargram.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int insertPost(int userId, String post, MultipartFile postImage) {
		
		String image = FileManagerService.saveFile(userId, postImage);
		
		return postDAO.insertPost(userId, post, image);
	}
	
	public List<PostDetail> selectPost() {
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post content : postList) {
			
			int id = content.getUserId();
			//user 테이블 조회
			//userBO 를 통해서 userId 와 일치하는 사용자 정보 조회
			User user= userBO.getUserById(id);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(content);
			postDetail.setUser(user);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
	}
	
	

}
