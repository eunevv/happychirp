<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	margin: 0;
}
table{
	background-color: white;
	width: 550px;
	height: 180px;
	margin: 0 auto;
	border: 1px solid grey;
	border-radius: 15px;
	padding: 20px;
	margin-bottom: 20px;
}
.modify_title{
	height: 20px;
	width: 450px;
	
}
.modify_content{
	height: 150px;
	width: 450px;
}
#btn{
	width: 550px;
	margin: 0 auto;
	text-align: right;
/* 	border: 1px solid grey;	  */
}
.btn{
	width: 60px; 
	height: 30px;
	margin-bottom: 30px;
 	border: 1px solid grey;	 
 	border-radius: 20px;
 	background: linear-gradient(#f2fcfe, #86a8e7);	
 	cursor: pointer;
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
				      <li><a href="adminInfo?id=${adminDto.id}">Settings</a></li>
				</c:if>
				<c:if test="${sessionScope.userDto != null}">
				     <li><a href="userInfo?id=${userDto.id}">Settings</a></li>
				</c:if>
		</ul>
	</nav>
<section  style="margin-top: 50px;">
	<article>
<!-- 		<a href="list">목록보기</a> -->
		<table>
	<%-- 		<c:if test="${content_view.c_id eq sessionScope.adminDto.id}"> --%>
	        	<form method="post" action="update">
	<%--     	</c:if> --%>
<%-- 				<tr>${content_view.c_id}</tr> --%>
				<input type="hidden" name="c_code" value="${content_view.c_code}">
				<input type="hidden" name="c_id" value="${content_view.c_id}">
				<tr height="30px;">
					<td>${content_view.c_name}</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="c_title" value="${content_view.c_title}" class="modify_title">
					</td>
				</tr>
				<tr>
					<td>${content_view.c_date}</td>
				</tr>
				<tr>
					<td>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="10" name="c_content" class="modify_content">${content_view.c_content}</textarea>						
					</td>
				</tr>
		</table>	
				<div id="btn">		
            	<input type="submit" value="수정" class="btn">
            	</div>
        	</form>
	</article>
</section>
</body>
</html>