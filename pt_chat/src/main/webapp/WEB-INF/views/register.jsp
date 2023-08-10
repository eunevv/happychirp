<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Handjet:wght@600&family=Lisu+Bosa:ital,wght@1,200&display=swap" rel="stylesheet">
<style>
section{
/*   	border: 1px solid blue;   */
	margin-top: 10px;
}
body{
	background-image: url('resources/img/v960-ning-30.jpg');
	background-size: cover;
/* 	스크롤 없앰 배경화면 고정 */
	background-attachment: fixed;
}
table{
  width: 550px;
  height: 550px;
/*   background-color: rgba( 255, 255, 255, 0.8);	 */
  text-align: left;
/*   border: 1px solid #F6F6F6; */
/*    border: 1px solid black;  */
  border-collapse: collapse;
  margin-top: 10px;
}
.id_ok{
color:#008000;
display: none;
}
.id_already{
color:#6A82FB; 
display: none;
}
#alert-success {
	color: green;
	display: none;
	font-size: small;
}

#alert-danger {
	color: red;
	display: none;
	font-size: small;
}
#alert-form-success{
	color: green;
	display: none;
	font-size: small;
}
#alert-form{
	color: red;
	display: none;
	font-size: small;
}
input{
/* 	background-color: transparent;	 */
	background-color: white;	
 	border-radius: 3px; 
	border: 1px solid grey;
	width: 560px;
	height: 35px;
}
input:hover{
 	background-color: #F8F8FF; 
}
.btn{
	background: linear-gradient(#C9D6FF, #F6F6F6);	
	border-radius: 3px;
	border: 1px solid grey;
	width: 560px;
	height: 40px;
	cursor: pointer;
}
a{
	text-decoration: none;
	color: #7586c6; 
	text-shadow: 2px 2px 2px grey;
}
.maintxt{
/* 		font-family: 'Lisu Bosa', serif; */
		font-family: 'Handjet', cursive;
 		font-size: 65px; 
/* 		text-align: center; */
/*  		color: #7586c6;  */
/* 		text-shadow: 2px 2px 2px grey; */
}
.title{
	font-size: small;
	font-weight: 600;
}
</style>
</head>
<body>
	<section>
		<article>
			<table align="center">
				<form method="post" id="registerForm" action="registerOk">
					<tr height="170">
						<td class="maintxt" style="text-align: center;">
			    		 <a href="main">happy chirp</a>
			    		</td>
					</tr>
					<tr height="40">
						<td class="title">
							아이디
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" size="30" id="id" name="id" placeholder="아이디를 입력하세요">
							<!-- id ajax 중복체크 -->
<!-- 							<span class="id_ok">사용 가능한 아이디입니다.</span> -->
<!-- 							<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span> -->
						</td>
					</tr>
					<tr height="40">
						<td class="title">
							패스워드
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" size="30" name="pwd" id="pwd">
<!-- 							<br> -->
<!-- 							<span id="alert-form">8-16자 특수문자 어쩌고 저쩌고</span> -->
<!-- 							<span id="alert-form-success">사용 가능한 비밀번호 입니다</span> -->
						</td>
					</tr>
					<tr height="40">
						<td class="title">
							패스워드 확인
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" size="30" name="pwd" id="checkPwd">
							<span id="alert-success">패스워드가 일치합니다.</span>
							<span id="alert-danger">패스워드가 불일치합니다.</span>
						</td>
					</tr>
					<tr height="40">
						<td class="title">
							이름
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" size="30" name="name">
						</td>
					</tr>
					<tr height="40">
						<td class="title">
							이메일
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" size="30" name="email">
						</td>
					</tr>
					<tr height="130">
						<td>
							<button type="submit" class="btn" id="submit">가입</button>
						</td>
					</tr>
				</form>
			</table>
		</article>
	</section>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
/* 아이디 중복검사 */
// function checkId(){
// 	var id = $("#id").val();
// 	$.ajax({
// 		url: '${contextPath}/idCheck',
// 		type: 'post',
// 		data: {"id":id},
// 		success: function(cnt){
// 			if (cnt == 0 && id.length > 0) {
// 				 $('.id_ok').css("display","inline-block"); 
//                  $('.id_already').css("display", "none");
// 			}else if (cnt == 1 && id.length > 0 ) {
// 				 $('.id_already').css("display","inline-block");
//                  $('.id_ok').css("display", "none");
// 			}else{
// 				$('.id_ok').css("display", "none");
// 				$('.id_already').css("display", "none");
// 			}
// 		},
// 		error: function () {
// 			alert("오류 시발");
// 		}
// 	});
// }

// $('#id').on("propertychange change keyup paste input", function() {

// 	$.ajax({
// 		url : 'idCheck', //Controller에서 요청 받을 주소
// 		type : 'post', //POST 방식으로 전달
// 		dataType : "json",
// 		data : {
// 			"id" : $('#id').val()
// 		},
// 		success : function(data) { //컨트롤러에서 넘어온 cnt값을 받는다 
// 			if (data == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
// 				$('.id_ok').css("display", "inline-block");
// 				$('.id_already').css("display", "none");
// 				checkId = true;
// 			} else if (cnt == 1 && id.length > 0 ) { // cnt가 1일 경우 -> 이미 존재하는 아이디
// 				$('.id_already').css("display", "inline-block");
// 				$('.id_ok').css("display", "none");
// 				checkId = false;
// 			}
// 		},
// 		error : function() {
// 			alert("에러입니다");
// 		}
// 	});
// });

	/* 비밀번호 확인*/
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd = $("#pwd").val();
			var checkPwd = $("#checkPwd").val();
			if (pwd != "" || re_pwd != "") {
				if (pwd == checkPwd) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
					checkPwd = true;
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
					checkPwd = false;
				}
			}
		});
	})
</script>
