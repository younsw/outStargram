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
		<section class="  d-flex justify-content-center">
			<div class="col-6 my-4"> 
				<textarea rows="5" class="form-control" id="postInput"></textarea>
				<div class="btn my-1">
  					<label for="postImageInput"><i class="bi bi-arrow-up-square" style="font-size:20px;"></i></label>
  					<input type="file" id="postImageInput" style="display: none;">
				</div>
				
				<div class="d-flex justify-content-between">
					<a href="/post/timeline/view" class="btn btn-info">홈으로</a>
					<button type="button" id="saveBtn" class="btn btn-info">게시</button>
				</div>
				
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			/* ${"#imageIcon"}.on("click", function(e) {
				// fileInput 을 클릭한 효과를 만들어야 한다
				e.preventDefult();
				$("#fileInput").click();
			}); */
			
			$("#saveBtn").on("click", function() {
				let post = $("#postInput").val().trim();
				
				if(post == "") {
					alert("내용을 입력하세요");
					return false;
				}
				
				// 파일을 포함한 파리미터 구성하기
				var formData = new FormData();
				formData.append("post", post);
				formData.append("postImage", $("#postImageInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/creat",
					data:formData,
					enctype:"multipart/form-data", // 파일 업로드 필수 옵션
					processData:false, 				// 파일 업로드 필수 옵션
					contentType:false,				// 파일 업로드 필수 옵션
					success:function(data) {
						if(data.result == "success") {
							location.href = "/post/timeline/view";
						} else {
							alert("게시물 작성 실패");
						}
					},
					error:function() {
						alert("게시물 작성 에러");
					}
				});
				
			});
		});
	
	</script>

</body>
</html>