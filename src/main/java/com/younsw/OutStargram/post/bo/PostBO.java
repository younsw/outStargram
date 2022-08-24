package com.younsw.OutStargram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.younsw.OutStargram.common.FileManagerService;
import com.younsw.OutStargram.post.coment.bo.ComentBO;
import com.younsw.OutStargram.post.coment.model.ComentDetail;
import com.younsw.OutStargram.post.dao.PostDAO;
import com.younsw.OutStargram.post.heart.bo.HeartBO;
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
	
	@Autowired
	private HeartBO heartBO;
	
	@Autowired
	private ComentBO comentBO;
	
	public int insertPost(int userId, String post, MultipartFile postImage) {
		
		String image = FileManagerService.saveFile(userId, postImage);
		
		return postDAO.insertPost(userId, post, image);
	}
	
	public List<PostDetail> selectPost(int loginUserId) {
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post content : postList) {
			
			int id = content.getUserId();
			int postId = content.getId();
			//user 테이블 조회
			//userBO 를 통해서 userId 와 일치하는 사용자 정보 조회
			User user = userBO.getUserById(id);
			// heartBO 를 통해서 postId 와 일치하는 좋아요 개수 조회
			int heart = heartBO.getHeartId(postId);
			// comentBO 를 통해서 postId와 일치하는 댓글 조회
			List<ComentDetail> comentList = comentBO.selectComent(postId);
			boolean isHeart = heartBO.isHeart(postId, loginUserId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(content);
			postDetail.setUser(user);
			postDetail.setHeart(heart);
			postDetail.setComentList(comentList);
			postDetail.setHeart(isHeart);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
	}
	
	
	
	public int deletePos(int postId, int userId) {
		
		Post post = postDAO.selectPostByPostId(postId);
		
		int count = postDAO.deletePost(postId, userId);
		
		if(count == 1) {
			// 파일 삭제
			// 파일 경로 알아 오기 
			
			
			FileManagerService.removeFile(post.getPostImage());
			
			comentBO.deleteComent(postId);
			heartBO.deleteHeartByPostId(postId);
		} 
		return count;
	}
	
	

}
