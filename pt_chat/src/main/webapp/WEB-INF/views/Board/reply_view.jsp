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
<style type="text/css">
body {
	height: 100vh;
	background: linear-gradient(#ee9ca7, #FFFFFF, #FFFFFF, #ee9ca7);
	background-size: cover;
	margin: 0;
}
	table{
	background-color: white;
	width: 550px;
	height: 180px;
	margin: 0 auto;
	border: 1px solid black;
	border-radius: 15px;
	padding: 20px;
	margin-bottom: 20px;
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

		<div class="navbar__logo">
			<i class="fas fa-blog"></i>
			 	<c:if test="${sessionScope.adminDto != null}">
				      <a href="amain?id=${adminDto.id}"  class="maintxt">Happy Chirp</a>
				</c:if>
				<c:if test="${sessionScope.userDto != null}">
				     <a href="main?id=${userDto.id}"  class="maintxt">Happy Chirp</a>
				</c:if>
		</div>

		<ul class="navbar__menu">
				<li><a href="#">Messages</a></li>
				<li><a href="#">Photos</a></li>
				<li><a href="list">Diary</a></li>
				<li><a href="https://youtu.be/p5tOU3f4O6E">link</a></li>
<%-- 				<li><a href="userInfo?id=${userDto.id}">Settings</a></li> --%>
				<c:if test="${sessionScope.adminDto != null}">
				      <li><a href=""adminInfo?id=${adminDto.id}"">Settings</a></li>
				</c:if>
				<c:if test="${sessionScope.userDto != null}">
				     <li><a href="userInfo?id=${userDto.id}">Settings</a></li>
				</c:if>
		</ul>
	</nav>
<section style="margin-top: 50px;">
	<article>
<!-- 		<div><a href="javascript:history.back()">목록보기</a></div> -->
		<table>
			<tr>
				<td>${replyDto.r_name}</td>
					<c:if test="${sessionScope.adminDto != null and sessionScope.adminDto.id eq replyDto.r_id}">
				      <td><a href="deleteReply?r_code=${replyDto.r_code}&c_code=${reply.c_code}">댓글삭제(관리자)</a></td>
				    </c:if>
				    <c:if test="${sessionScope.userDto != null and sessionScope.userDto.id eq replyDto.r_id}">
				      <td><a href="deleteReply?r_code=${replyDto.r_code}&c_code=${reply.c_code}">댓글삭제(회원)</a></td>
				    </c:if>
			</tr>
			<tr>
				<td colspan="2">${replyDto.r_date}</td>
			</tr>
			<tr height="80">
				<td colspan="2">${replyDto.r_content}</td>
			</tr>
		</table>
<!-- 		<div>  -->
<!-- 			<form action="insertReply"> -->
<%-- 				<input type="hidden" name="c_code" value="${content_view.c_code}"> --%>
<%-- 				<input type="hidden" name="r_id" value="${r_id}"> --%>
<%-- 				<input type="hidden" name="r_id" value="${r_id}"> --%>
<!-- 				<textarea rows="" cols="" name="r_content"></textarea> -->
<!-- 				<button type="submit">작성</button> -->
<!-- 			</form> -->
<!-- 		</div> -->
	</article>
</section>
</body>	
</html>