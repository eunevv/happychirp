<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	height: 300vh;
	background: linear-gradient(#ee9ca7, #FFFFFF, #FFFFFF, #ee9ca7); 
	margin: 0;
}
.date {
	/* 	border: 1px solid blue; */
	width: 520px;
	margin: 0 auto;
	margin-top: 30px; margin-bottom : 15px;
	font-weight: 600;
	margin-bottom: 15px;
}

.list {
	border: 1px solid grey;
	width: 480px;
	height: 65px;
	border-radius: 20px;
	margin: 0 auto;
	margin-bottom: 10px;
	padding: 20px;
	background: linear-gradient(#FFFFFF, rgb(134, 168, 231, 0.8));
	cursor: pointer;
}

.list:hover {
	background: rgb(134, 168, 231, 0.4);
}

.no {
	color: black;
	text-decoration: none;
	font-weight: bolder;
}

.name {
	color: grey;
	font-size: small;
	font-weight: bold;
}

#write {
	width: 510px;
	border-radius: 20px;
	margin: 0 auto;
	padding: 20px;
}

.write_btn {
	margin-bottom: 30px;
	border: 1px solid grey;
	border-radius: 30px;
	width: 90px;
	height: 30px;
	text-align: center;
	float: right;
	line-height: 30px;
	background: linear-gradient(#f2fcfe, #86a8e7);
}
.write_btn:hover{
	background: rgb(134, 168, 231, 0.8);
}
.search_area {
	/* 	background: pink; */
	text-align: center;
	margin-bottom: 40px;
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

button {
	border-radius: 50%;
	border: 2px solid grey;
	/* 	  border: 1px solid transparent; */ background : white;
	cursor: pointer;
	margin-right: 10px;
	background: white;
}

button:hover {
	border: 2px solid #FF3366;
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
<!-- 			<a href="main" class="maintxt"> Happy Chirp</a> -->
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
	<section style="margin-top: 50px;">
		<article>
			<div class="search_area">
				<form id="search" action="list">
					<!-- 검색어를 설정할 input 요소를 추가하고 각각의 값을 버튼을 클릭할 때 변경 -->
					<input type="hidden" name="keyword" id="searchKeyword" value="">
					<button type="button" onclick="search('')">
						<img src="resources/img/all.png" height="90" width="90">
					</button>
					<button type="button" onclick="search('shin')">
						<img src="resources/img/1.png" height="90" width="90">
					</button>
					<button type="button" onclick="search('yuri')">
						<img src="resources/img/2.png" height="90" width="90">
					</button>
					<button type="button" onclick="search('soo')">
						<img src="resources/img/3.png" height="90" width="90">
					</button>
					<button type="button" onclick="search('maeng')">
						<img src="resources/img/4.png" height="90" width="90">
					</button>
					<button type="button" onclick="search('hoon')">
						<img src="resources/img/5.png" height="90" width="90">
					</button>
				</form>
			</div>

			<div id="write">
				<c:if
					test="${not empty sessionScope.adminDto and empty sessionScope.userDto}">
					<div class="write_btn" onclick="location.href='write_view'" style="cursor: pointer;">글작성</div>
				</c:if>
			</div>
			<div id="change">
				<c:set var="prevDate" value="" />
				<c:forEach items="${list}" var="board">
					<div class="date">
						<c:if test="${board.c_date ne prevDate}">
            	${board.c_date}
            </c:if>
					</div>
					<div class="list" onclick="location.href='content_view?c_code=${board.c_code}'" cusor:pointer;>
						<!--                     <tr class="listToChange"> -->
						<%-- <td>${board.c_code}</td> --%>
						<%-- <td class="scrolling"><c:out value="${count}"/></td> --%>
						<%--                         <c:if test="${board.c_date ne prevDate}"> --%>
						<%--                             <td>${board.c_date}</td> --%>
						<%--                         </c:if> --%>
						<c:set var="prevDate" value="${board.c_date}" />
						<div class="name" style="margin-bottom: 10px">
							${board.c_name}</div>
						<div class="no">${board.c_title}</div>
						<input type="hidden" name="c_id" value="${board.c_id}">
						<%--                         <td>${board.c_name}</td> --%>
						<!--                         <td> -->
						<%--                             <a href="content_view?c_code=${board.c_code}">${board.c_title}</a> --%>
						<%-- 댓글갯수표시 --%>
						<%--                             <c:if test="${board.recnt ne 0}"> --%>
						<%--                                 [<c:out value="${board.recnt}"/>] --%>
						<%--                             </c:if> --%>
						<!--                         </td> -->
						<!--                     </tr> -->
						<!--                 </table> -->
					</div>
				</c:forEach>
			</div>
		</article>
	</section>
<!-- 	<div style="position: sticky; bottom: 15px; float:right; margin-right:40px;"> -->
<!-- 		<a href="#" style="font-size: xx-large;"> ^ </a> -->
<!-- 	</div> -->
<!-- 	<script -->
<!-- 		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" -->
<!-- 		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" -->
<!-- 		crossorigin="anonymous"></script> -->
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function search(keyword) {
		document.getElementById("searchKeyword").value = keyword;
		document.getElementById("search").submit();
	}
</script>






