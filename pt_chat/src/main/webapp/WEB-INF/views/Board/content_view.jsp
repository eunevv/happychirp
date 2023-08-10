<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Handjet:wght@600&family=Lisu+Bosa:ital,wght@1,200&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<style>
body {
	height: 150vh;
	background: linear-gradient(#ee9ca7, #FFFFFF, #FFFFFF, #ee9ca7);
	background-size: cover;
	margin: 0;
}
#replytable:hover {
	background-color: #f2f2f2;
}

#boardtable{
	background-color: white;
	width: 550px;
	height: 180px;
	margin: 0 auto;
	border: 1px solid black;
	border-radius: 15px;
	padding: 20px;
	margin-bottom: 20px;
}
#replytable{
	background-color: white;
	width: 550px;
	height: 90px;
	margin: 0 auto;
	border: 1px solid black;
	border-radius: 15px;
	padding: 20px;
	margin-bottom: 5px;
	cursor: pointer;
}
.title {
	font-size: x-large;
	font-weight: bold;
}

.name {
	color: grey;
	font-weight: bold;
}
div{
	width: 540px;
	margin: 0 auto;
	margin-bottom: 20px;
/* 	border: 1px solid red; */
}
.reply_btn{
	width: 58px; 
	height: 40px;
	margin-bottom: 30px;
 	border: 1px solid grey;	 
 	border-radius: 20px;
 	background: linear-gradient(#f2fcfe, #86a8e7);	
}
.modify_btn{
	margin-bottom: 30px;
 	border: 1px solid grey;	 
 	border-radius: 30px;
 	background: linear-gradient(#f2fcfe, #86a8e7);
 	text-decoration: none;
 	color: black;	
}
.delete_btn{
	margin-bottom: 30px;
 	border: 1px solid grey;	 
 	border-radius: 30px;
 	background: linear-gradient(#f2fcfe, #86a8e7);
 	text-decoration: none;
 	color: black;	
}
.navbar {
	position: sticky;
	top: 0;
	display: flex;
	/*   flex-flow: row nowrap; */
	justify-content: flex-start;
	align-items: center;
	background-color: rgba(255, 255, 255, 0.6);
	padding: 8px 25px;
	height: 90px;
}

.navbar__logo i {
	padding-left: 0;
}

a {
	text-decoration: none;
	color: black;
}

.navbar__menu {
	list-style: none;
	display: flex;
}

.navbar__menu li {
	padding: 8px 40px;
	font-family: 'Roboto', sans-serif;
}

.navbar__menu li:hover {
	background-color: white;
	border-radius: 3px;
}

.maintxt {
	font-family: 'Handjet', cursive;
	font-size: 30px;
	color: #7586c6;
	text-shadow: 2px 2px 2px grey;
}

</style>
</head>
<body>
		<nav class="navbar">
<!-- 			<div class="navbar__logo"> -->
				<i class="fas fa-blog"></i> 
				<c:if test="${sessionScope.adminDto != null}">
				      <a href="amain?id=${adminDto.id}"  class="maintxt">Happy Chirp</a>
				</c:if>
				<c:if test="${sessionScope.userDto != null}">
				     <a href="main?id=${userDto.id}"  class="maintxt">Happy Chirp</a>
				</c:if>
<!-- 			</div> -->
	
			<ul class="navbar__menu">
				<li><a href="#">Messages</a></li>
				<li><a href="#">Photos</a></li>
				<li><a href="list">Diary</a></li>
				<li><a href="https://youtu.be/p5tOU3f4O6E">link</a></li>
<%-- 				<li><a href="userInfo?id=${userDto.id}">Settings</a></li> --%>
				<c:if test="${sessionScope.adminDto != null}">
				      <li><a href="adminInfo?id=${adminDto.id}">Settings</a></li>
				</c:if>
				<c:if test="${sessionScope.userDto != null}">
				     <li><a href="userInfo?id=${userDto.id}">Settings</a></li>
				</c:if>
			</ul>
		</nav>
	<section style="margin-top: 50px;">
		<article>
<!-- 			<div> -->
<!-- 				<ul class="back"> -->
<!-- 					<li> -->
<!-- 						<a href="list">목록보기</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						Diary -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
			<table id="boardtable">
				<form method="post">
				<tr>
					<td class="name">${content_view.c_name}</td>
				</tr>
				<tr>
					<td class="title">${content_view.c_title}</td>
				</tr>
				<tr>
					<td class="date">${content_view.c_date}</td>
				</tr>
				<tr>
					<td>
						<hr>
					</td>
				</tr>
				<tr>
					<td class="content">${content_view.c_content}</td>
				</tr>
				</form>
			</table>
			
			<div>
			<c:if test="${content_view.c_id eq sessionScope.adminDto.id || content_view.c_id eq sessionScope.userDto.id}">
				<div style="text-align: right; float: left; height: 10px;">
				<a href="modify_view?c_code=${content_view.c_code}" class="modify_btn">수정하기</a>
				<a href="delete?c_code=${content_view.c_code}" class="delete_btn">삭제하기</a>
				</div>
			</c:if>
			</div>
			
			<div style="font-size: large; font-weight: bold;">
			 댓글
			</div>
			<div class="reply">
				<form action="insertReply" method="post">
					<input type="hidden" name="c_code" value="${content_view.c_code}">
					<input type="hidden" name="r_id" value="${r_id}"> 
					<input type="text" name="r_content" placeholder="댓글을 입력하세요" 
						style="width: 470px; height: 35px; border-radius: 10px; border: 1px solid grey;"> 
					<input type="submit" value="작성" class="reply_btn">
				</form>
			</div>

			<c:forEach items="${replylist}" var="reply">
				<table id="replytable" id="replyView" onclick="location.href='reply_view?r_code=${reply.r_code}&c_code=${reply.c_code}'">
					<tr>
						<td style="width: 430px;">${reply.r_name}</td>
						<c:if test="${sessionScope.adminDto != null and sessionScope.adminDto.id eq reply.r_id}">
							<td>
							<a href="deleteReply?r_code=${reply.r_code}&c_code=${reply.c_code}">댓글삭제</a>
							</td>
						</c:if>
						<c:if test="${sessionScope.userDto != null and sessionScope.userDto.id eq reply.r_id}">
							<td>
							<a href="deleteReply?r_code=${reply.r_code}&c_code=${reply.c_code}">댓글삭제</a>
							</td>
						</c:if>
					</tr>
					<tr>
						<td colspan="2">${reply.r_date}</td>
					</tr>
					<tr>
						<td colspan="2">${reply.r_content}</td>
					</tr>
				</table>
			</c:forEach>
		</article>
	</section>
</body>
</html>
