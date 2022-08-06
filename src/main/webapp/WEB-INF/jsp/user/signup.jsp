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
		<header>
			<div>OutStargram</div>
		</header>
		
		 <section class="section d-flex justify-content-center align-items-center" >
		 	<div class="col-3">
		 		<h2 class="text-center">회원가입</h2>
		 		<input class="form-control" type="text" id="idInput" placeholder="Username"> <br>
		 		<input class="form-control" type="password" id="passwordInput" placeholder="passwoad"><br>
		 		<input class="form-control" type="password" id="passwordCheckInput" placeholder="비밀번호 확인"> <br>
				<input class="form-control" type="text" id="nameInput" placeholder="이름"> <br>
		 		<input class="form-control" type="text" id="emailInput" placeholder="이메일"> <br>
		 		<button type="button" id="joinBtn" class="btn btn-block">회원가입</button>
		 	</div>
		 </section>
		
		<footer>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#joinBtn").on("click", function() {
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordCheck = $("#passwordCheckInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요!");
					return false;
				}
				if(password == "") {
					alert("비밀번호를 입력하세요!");
					return false;
				}
				if(passwordCheck != password) {
					alert("비밀번호가 일치하지 않습니다");
					return false;
				}
				if(name == "") {
					alert("이름을 입력하세요!");
					return false;
				}
				if(email == "") {
					alert("이메일을 입력하세요!");
					return false;
				}
				
				//아작스를 통해서 확인
				$.ajax({
					type:"post",
					url:"/user/signup",
					data:{"loginId":id, "password": password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success") {
							location.href = "/user/signin/view";
						} else {
							alert("삽입실패");
						}
					},
					error:function() {
						alert("회원가입 에러");
					}
				});
			});
		});
	</script>

</body>
</html>