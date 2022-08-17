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

	<div id="wrap">
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
							
							<i class="bi bi-three-dots mt-2"></i>
						</div> 
						<!-- 게시물 사진과 내용과 좋아요 수 댓글   -->
						<img class="form-control" src="${postDetail.post.postImage }">
						<div class="d-flex justify-content-start text-border">
							&nbsp;<i class="bi bi-heart"></i>&nbsp;12 &nbsp;<i class="bi bi-chat"></i>&nbsp;7
						</div>
						<textarea class="form-control">${postDetail.post.post } </textarea>
						<!-- 댓글 리스트 -->
						<div class="d-flex justify-content-start mt-1">
							댓글
						</div>
						<div class="d-flex justify-content-start">
							<div>
								<b>누구누구</b>
								너무 귀엽네요
							</div>
						</div>
						<!-- 댓글 입력 --> 
						<div class="d-flex mb-3">
							<input type="text" class="form-control" placeholder="댓글 달기..." id="comentInput">
							<button class="comentAdd btn btn-success" value="${postDetail.post.id}" id="${postDetail.user.loginId }">댓글달기</button>
						</div>
					</div>
				</div>
			</c:forEach>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$(".comentAdd").on("click", function() {
				let postId = $(this).attr('id');
				let userId = $(this).attr('value');
				
				alert(postId);
				alert(userId);
				
				if(coment == "") {
					alert("댓글을 입력하세요");
					return false;
				}
				
				
				
				/* $.ajax({
					type:"post",
					url:"/post/coment"
					data:{"coment":coment, "userId":userId},
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/ti"
						} else {
							alert("댓글 삽입 실패");
						}
					},
					error:function() {
						alert("댓글 삽입 에러");
					}
				}); */
				
			});
			
		});
	
	</script>

</body>
</html>