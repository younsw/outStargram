<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OutStargram</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap" class="d-flex justify-content-center">
		<div>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
			<section class="">
				<div class="d-flex justify-content-end mt-3">
					<c:if test="${not empty userId }">
						<a href="/post/create/view" class="btn btn-success">게시물 작성하기</a>
			 		</c:if>
				</div>
				<c:forEach var="postDetail" items="${postList }">
					<div class="d-flex justify-content-center">
						<div class="col-6 text-center my-4 border">
							<div class="d-flex justify-content-between">
							<!-- 게시물 작성자 이름 -->
								<div class="d-flex justify-content-start">
									<i class="bi bi-person-circle fa-3x" style="font-size:25px;"></i>&nbsp;
									<h5 class="mt-2 ">${postDetail.user.loginId }</h5>
								</div>
								
								<div>
									<c:if test="${userId eq postDetail.post.userId }">
										<a href="#" class="more-btn" data-post-id="${postDetail.post.id}" data-toggle="modal" data-target="#moreModal">
											<i class="bi bi-three-dots mt-2"></i>
										</a>
									</c:if>
								</div>
							</div> 
							<!-- 게시물 사진과 내용과 좋아요 수 댓글   -->
							<img class="form-control" src="${postDetail.post.postImage }">
							<div class="d-flex justify-content-start text-border">
								&nbsp;
								<c:choose>
									<c:when test="${postDetail.heart }">
										<a href="#" class="unheart-btn decoration-none" data-post-id="${postDetail.post.id}">
											<i class="bi bi-heart-fill"></i>
										</a>
									</c:when>
									<c:otherwise>
										<a href="#" class="heart-btn decoration-none" data-post-id="${postDetail.post.id}">
											<i class="bi bi-heart"></i> 
										</a>
									</c:otherwise>
								</c:choose>
								&nbsp;${postDetail.heartCount }
								<!-- &nbsp;<i class="bi bi-chat"></i>&nbsp;7 -->
							</div>
							<textarea class="form-control">${postDetail.post.post } </textarea>
							<!-- 댓글 리스트 -->
							<div class="d-flex justify-content-start mt-1">
								댓글
							</div>
							<c:forEach var="comentDetail" items="${postDetail.comentList }">
								<div class="d-flex justify-content-start">
									<div>
										<b>${comentDetail.user.loginId }</b>
										${comentDetail.coment.coment }
									</div>
								</div>
							</c:forEach>
							<!-- 댓글 입력 --> 
							<div class="d-flex mb-3">
								<input type="text" class="form-control" placeholder="댓글 달기..." id="comentInput${postDetail.post.id }">
								<button class="comentAdd btn btn-success" data-post-id="${postDetail.post.id}">댓글달기</button>
							</div>
						</div>
					</div>
				</c:forEach>	
			</section>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
			
			<!-- Modal -->
			<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    
			      <div class="modal-body text-center">
			      	<a href="#" id="deleteBtn">삭제하기</a>
			      </div>
			      
			    </div>
			  </div>
			</div>
		</div>		
	</div>
	
	
	
	<script>
	
		$(document).ready(function() {
			
			$(".more-btn").on("click", function() {
				// 이번트가 발생한 버튼에서 post-id를 얻어온다
				let postId = $(this).data("post-id");
				
				// 삭제하기 버튼에 해당 id를 저장한다 (data-post-id 속성에 값을 넣는다)
				$("#deleteBtn").data("post-id", postId);
				
			});
			
			$("#deleteBtn").on("click", function(e) {
				// postId
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					},
					error:function(){
						alert("삭제 에러");
					}
				});
				
			}); 
			
			$(".unheart-btn").on("click", function(e) {
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/unheart",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
					},
					error:function() {
						alert("좋아요 최소 에러");
					}
				});
			});
			
			$(".heart-btn").on("click", function(e) {
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/heart",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					},
					error:function() {
						alert("좋아요 에러");
					}
				});
				
			});
			
			$(".comentAdd").on("click", function() {
				let postId = $(this).data('post-id');
				let coment = $("#comentInput" + postId).val();
				
				if(coment == "") {
					alert("댓글을 입력하세요");
					return false;
				}
				
				$.ajax({
					
					
					
					type:"post",
					url:"/post/coment",
					data:{"postId":postId, "coment":coment},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 삽입 실패");
						}
					},
					error:function() {
						alert("댓글 삽입 에러");
					}
				});
				
			});
			
		});
	
	</script>

</body>
</html>