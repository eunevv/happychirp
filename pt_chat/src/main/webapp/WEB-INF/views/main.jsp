<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- <link href="https://fonts.googleapis.com/css2?family=Lisu+Bosa:ital,wght@1,200&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Handjet:wght@600&family=Lisu+Bosa:ital,wght@1,200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	body{
		background-image: url('resources/img/v960-ning-30.jpg');
		background-size: cover;
/* 		스크롤 없앰 배경화면 고정 */
		background-attachment: fixed;
	}
	.maintxt{
/* 		font-family: 'Lisu Bosa', serif; */
		font-family: 'Handjet', cursive;
		font-size: 180px;
		text-align: center;
 		color: #7586c6; 
		text-shadow: 2px 2px 2px black;
	}
	.unlogin{
		text-align: center;
		border: 1px solid black;
		border-radius: 40px;
		background: linear-gradient(#ffffff, #6DD5FA);
		margin: 0 auto;
		width: 400px;
		height: 50px;
		line-height: 50px;
	}
	a{	
		text-decoration: none;
		color: black;
	}
	a:hover{
		text-decoration: underline;
	}
	.login{
/* 		border: 1px solid black; */
		width: 800px;
	    margin: 0 auto;
	    display: flex;
	}
 	.login > div{ 
/*  		border: 1px solid red; */
		text-align: center; 
  		margin: 0 auto; 
/*  		box-sizing: border-box;  */
 		width: 100px;
/*         height: 100px; */
 		
 	} 
 img:hover{
/*  	background: rgb(255,255,255,0.3); */
 	background: transparent;
 	border-radius: 10px;
 	width: 40px;
 }
</style>
</head>
<body>
	<div class="user-wrap">
		<div class="user-txt">
			<p class="maintxt">Happy Chirp</p>
		</div>
		<!-- 비로그인시 -->
		<c:if test="${ userDto == null }">
			<div class="unlogin">
				<a href="login">로그인/회원가입</a>		
			</div>
		</c:if>
		
		<!-- 로그인 상태 -->
		<c:if test="${ userDto != null }">
			<div class="login">
<!-- 			<h1>User 전용 main</h1> -->
				<div class="chat">
					<a href="#">
						<img alt="" src="resources/img/icon_message2.png">
					</a>							
				</div>
				<div class="mypage">
					<a href="imgboard?id=${userDto.id}">
						<img alt="" src="resources/img/icon_photo2.png">
					</a>			
				</div>
				<div class="Diary">
					<a href="list?id=${userDto.id}">
						<img alt="" src="resources/img/icon_diary2.png">
					</a>		
				</div>
				<div>
					<a href="https://youtu.be/p5tOU3f4O6E">
						<img alt="" src="resources/img/icon_link2.png">
					</a>
				</div>
				<div class="mypage">
					<a href="userInfo?id=${userDto.id}">
						<img alt="" src="resources/img/icon_setting.png">
					</a>			
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>