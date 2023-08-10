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
	background: linear-gradient(#FFEFBA, #FFFFFF, #FFFFFF, #FFEFBA); 
	margin: 0;
}
table{
	background-color: white;
	width: 600px;
	height: 300px;
	margin: 0 auto;
	border: 1px solid black;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 20px;
}
.btn{
	width: 600px;
	margin: 0 auto;
	text-align: center;
}
.btn > button{
	margin-right: 10px;
	border-radius: 20px;
	width: 70px;
	height: 30px;
	background: linear-gradient(#FFFFFF,#a8ff78); 
	cursor: pointer;
	
}
.btn > button:hover{
	background: #a8ff78; 
}
input {
	height: 30px;
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
				<li><a href="upload">Photos</a></li>
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
		<div style="text-align: center; margin-bottom: 50px; font-size: xx-large; font-weight: 800;">
			프로필 수정
		</div>
		<table>
			<form method="post" action="adminUpdate">
				<tr>
					<td colspan="2" style="font-size: xx-large; font-weight: 600;">
						${adminInfo.id} 님
						<input type="hidden" name="id" value="${adminInfo.id}">
					</td>
				</tr>
				<tr height="10px;">
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td width="80">
						패스워드
					</td>
					<td>
						<input type="text" size="30" name="pwd" value="${adminInfo.pwd}">
					</td>
				</tr>
				<tr>
					<td width="80">
						닉네임
					</td>
					<td>
						<input type="text" size="30" name="name" value="${adminInfo.name}">
					</td>
				</tr>
				<tr>
					<td width="80">
						관리자
					</td>
					<td>
						${adminInfo.admin}
						<input type="hidden" name="admin" value="${adminInfo.admin}">
					</td>
				</tr>
	<!-- 			<tr height="30"> -->
	<!-- 				<td width="80"> -->
	<!-- 					번호 -->
	<!-- 				</td> -->
	<!-- 				<td> -->
	<%-- 					<input type="text" size="30" name="hp" value="${adminInfo.hp}"> --%>
	<!-- 				</td> -->
	<!-- 			</tr> -->
<!-- 				<tr height="30"> -->
<!-- 					<td colspan="2"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
			</table>
				<div class="btn">
						<button type="button" onclick="location.href='logout'">로그아웃</button>
						<button type="submit">완료</button>
						<button type="button" onclick="location.href='amain'">메인으로</button>
				</div>
		</form>
	</article>
</section>
</body>
</html>