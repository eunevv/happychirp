<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Handjet:wght@600&family=Lisu+Bosa:ital,wght@1,200&display=swap" rel="stylesheet">
<style type="text/css">
nav{
/*   	border: 1px solid red;   */
	width: 80%;
	height: 50px;
	margin: 20px;
}
section{
/* 	border: 1px solid blue; */
/* 	margin-top: 10px; */
}
body{
	background-image: url('resources/img/v960-ning-30.jpg');
	background-size: cover;
/* 	스크롤 없앰 배경화면 고정 */
	background-attachment: fixed;
}
table{
  width: 380px;
/*   height: 530px; */
/*   background-color: white; */
  background-color: rgba( 255, 255, 255, 0.8);	
  text-align: center;
  border: 1px solid #F6F6F6;
  border-collapse: collapse;
/*   border-radius:  */
}
td{
/* 	border: 1px solid red; */
}
input{
	background-color: #F8F8FF;	
	border-radius: 3px;
	border: 1px solid grey;
	width: 300px;
	height: 40px;
	
}
.maintxt{
/* 		font-family: 'Lisu Bosa', serif; */
		font-family: 'Handjet', cursive;
 		font-size: 65px; 
/* 		text-align: center; */
/*  		color: #7586c6;  */
/* 		text-shadow: 2px 2px 2px grey; */
}
.btn{
	background: linear-gradient(#C9D6FF, #F6F6F6);	
	border-radius: 3px;
	border: 1px solid grey;
	width: 300px;
	height: 45px;
	cursor: pointer;
}
.main{
	text-decoration: none;
	color: #7586c6; 
	text-shadow: 2px 2px 2px grey;
	cursor: pointer;
}
hr{
	width: 320px;
	color: grey;
}
a{
	color: grey;
	text-decoration: none;
}
a:hover{
	color: black;
}
/* 로그인 실패시 경고글 */
.login_warn {
	color: red;
	font-size: small;
}
</style>
</head>
<body>
	<section>
		<article>
			<table align="center">
			    <form method="post" action="loginYN">
			    	<tr height="180">
			    		<td class="maintxt">
			    		 <div class="main" onclick="location.href='main'">happy chirp</div>
			    		</td>
			    	</tr>
			        <tr height="250">
			            <td>
			                <input type="text" name="id" placeholder="사용자 아이디">
			                <p></p>
			                <input type="text" name="pwd" placeholder="비밀번호">
			                <p></p>
<!-- 			                <div class="login_warn" style="margin-top: 10px;"> -->
<%-- 									    <c:if test="${adminDto == null or userDto == null}"> --%>
<!-- 									        사용자 ID 또는 비밀번호를 잘못 입력하셨습니다. -->
<%-- 									    </c:if> --%>
<!-- 							</div> -->
							<p></p>
			                <button type="submit" class="btn">로그인</button>
			            </td>
			        </tr>
			        <tr height="10">
			            <td>
<!-- 			            	<hr> -->
			            </td>
			        </tr>
			        <tr height="100">
			            <td>
			            	<a href="register" style="font-size: small;">회원가입&nbsp;|</a>
			            	
			            	<a style="font-size: small;">아이디 찾기&nbsp;|</a>
			       
			            	<a style="font-size: small;">비밀번호 찾기</a>
			            </td>
			        </tr>
			    </form>
			</table>
		</article>
	</section>	
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>