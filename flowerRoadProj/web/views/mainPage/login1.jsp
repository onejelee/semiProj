<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="..//lib/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>로그인</title>

<script src="../sibar/js/jquery-3.3.1.min.js"></script>


<style>
#login {
	background-color: lightpink;
}

#kakao {
	background-color: yellow;
}

#facebook {
	background-color: skyblue;
}

#google {
	background-color: mediumvioletred;
}

#naver {
	background-color: greenyellow;
}

#login-page {
	margin: auto;
	padding: auto;
	text-align: center;
	width: 100%;
	font-family: 'Malgun Gothic', '맑은 고딕';
}

#form {
	width: 40%;
	height: 100px;
	margin: auto;
	text-align: center;
	font-size: 20px;
}
</style>
<script>
	$(document).ready(function() {

		$(window).on('resize load', function() {
			$('.contentwrap').css({
				"padding-top" : $(".navbar").height() + "px"
			});
		});

	});
</script>




<!--
 아이디 저장 체크시 저장할수 있도록 연동 if (document.login.id_hold_check.value) alert(""); return false;
-->



</head>

<body>
	<%@include file="/views/common/header.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div id="login-page">

		<h2>로그인</h2>
		<div>
			<table id="form">
				<tr>
					<td>ID</td>
					<td><input type="text" size="30"></td>
					<td rowspan="2"><input type="submit" value="로그인"
						style="width: 110px; height: 100px;" id="login"></td>
				</tr>

				<tr>
					<td>PWD</td>
					<td><input type="password" size="30"></td>
				</tr>
			</table>
			<table
				style="width: 40%; height: 50px; margin: auto; text-align: center; font-size: 15px;">
				<tr>
					<td type="checkbox"><input type="checkbox" value="checked">아이디
						저장</td>
					<td type="button"><a href="findUser1.jsp">아이디 찾기 ㅣ 비밀번호 찾기</a></td>
					<td type="button"><a href="signUp1.jsp">회원가입</a></td>
				</tr>
			</table>

			<table id="form">
				<tr style="width: 100%; heigth: 50px; margin: atuo">
					<td type="button" id="kakao">카카오톡</td>

					<td type="button" id="google">페이스북</td>
				</tr>
				<tr>
					<td id="facebook">구글</td>

					<td id="naver">네이버</td>
				</tr>


			</table>
		</div>
		<!--   <input type="submit" value="회원가입" style="height:100px; width:720px;">     -->
	</div>
	<%@include file="/views/common/footer.jsp"%>
</body>

</html>
