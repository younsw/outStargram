<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
		<header class="header d-flex align-items-center justify-content-between" >
		 	<h1 class="ml-1">OutStargarm</h1>
		 	<%-- session userId 가 값이 저장되어 있으면 로그아웃 링크 보여주기 --%>
		 	<c:if test="${not empty userId }">
		 		<div class="mr-3">${userName }님<a href="/user/signout">로그아웃</a> </div>
		 	</c:if>
		 	<c:if test="${empty userId }">
				<div class="mr-3"><a href="/user/signin/view">로그인</a></div>
			</c:if>
		</header>