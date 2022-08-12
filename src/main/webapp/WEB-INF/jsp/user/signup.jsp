<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		
		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
 		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		
		<section class="content d-flex justify-content-center my-5">
			<div>
				<div class="login-box section d-flex justify-content-center align-items-start bg-white  border rounded">
					<div class="w-100 p-5">
						<h2 class="text-center">OutStargram</h2>
						<br>
						
						<div class="d-flex  mt-3">
							<input type="text" id="loginIdInput" class="form-control" placeholder="아이디">
							<button type="button" class="btn btn-sm ml-2" id="isDuplicateBtn">중복확인</button>
						</div>
						<div id="duplicateText" class="d-none"><small class="text-danger">중복된 ID 입니다</small></div>
						<div id="possibleText" class="d-none"><small class="text-success">사용가능한 ID 입니다</small></div>
						<input type="password" id="passwordInput" class="form-control mt-3" placeholder="패스워드">
						<input type="password" id="passwordConfirmInput" class="form-control mt-3" placeholder="패스워드 확인">
						
						<input type="text" id="nameInput" class="form-control mt-3" placeholder="이름">
						<input type="text" id="emailInput" class="form-control mt-3" placeholder="이메일">
						
						<button type="button" id="signUpBtn" class="btn btn-block mt-3">회원가입</button>
				
					</div>
					
				</div>
				<div class="mt-4 p-3 d-flex justify-content-center align-items-start bg-white  border rounded">
					계정이 있으신가요? <a href="/user/signin/view">로그인</a>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script type="text/javascript">
		
	$(document).ready(function() {
		
		var isDuplicateCheck = false;
		var isDuplicateId = true;
		
		$("#loginIdInput").on("input", function() {
			isDuplicateCheck = false;
			isDuplicateId = true;
			$("#possibleText").addClass("d-none");
			$("#duplicateText").addClass("d-none");
		});
		
		
		$("#isDuplicateBtn").on("click", function() {
			var loginId = $("#loginIdInput").val();
			
			if(loginId == "") {
				alert("아이디를 입력하세요");
				return ;
			}
			
			$.ajax({
				type:"get",
				url:"/user/duplicate_id",
				data:{"loginId":loginId},
				success:function(data) {
					//{"is_duplicate":true}
					//{"is_duplicate":false}
					// 중복체크 여부 판단
					isDuplicateCheck = true;
					
					
					if(data.is_duplicate) { // 중복된 경우
						$("#duplicateText").removeClass("d-none");
						$("#possibleText").addClass("d-none");
						isDuplicateId = true;
					} else {  // 중복되지 않은 경우
						$("#possibleText").removeClass("d-none");
						$("#duplicateText").addClass("d-none");
						isDuplicateId = false;
					}
					
				},
				error:function() {
					alert("중복확인 에러");
				}	
			});
			
		});
		
		
		$("#signUpBtn").on("click", function() {
			
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var name = $("#nameInput").val()
			var email = $("#emailInput").val()
			
			if(loginId == "") {
				alert("아이디를 입력하세요");
				return ;
			}
			
			// 중복체크 여부 유효성 검사 
			// if(isDuplicateCheck == false) {
			if(!isDuplicateCheck) {
				alert("중복여부 체크를 진행해주세요");
				return ;
			}
			
			// 아이디 중복여부 유효성 검사 
			// if(isDuplicateId == true) {
			if(isDuplicateId) {
				alert("중복된 아이디입니다");
				return ;
			}
			
			if(password == "") {
				alert("비밀번호를 입력하세요");
				return ;
			}
			
			if(password != passwordConfirm) {
				alert("비밀번호를 확인하세요");
				return ;
			}
			
			if(name == "") {
				alert("이름을 입력하세요");
				return ;
			}
			
			if(email == "") {
				alert("이메일을 입력하세요");
				return ;
			}
			
			$.ajax({
				type:"post",
				url:"/user/signup",
				data:{"loginId":loginId, "password":password, "name":name, "email":email},
				success:function(data) {
					if(data.result == "success") {
						location.href = "/user/signin/view";
					} else {
						alert("회원가입 실패!");
					}
					
				},
				error:function() {
					alert("회원가입 에러!");
				}
			});
			
			
			
		});
		
	});
		
	
	</script>


</body>
</html>