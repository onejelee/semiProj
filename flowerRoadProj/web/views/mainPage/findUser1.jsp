<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<script src="../sibar/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>아이디/비밀번호 찾기</title>
<style>
#container {
	width: 300px;
	height: 300px;
}

#login {
	margin: auto;
	padding: auto;
	width: 100%;
	text-align: center;
}

/*id_비밀번호 찾기*/
.content {
	width: 50%;
	overflow: hidden;
	margin: auto;
    padding: 10px;
}

.id_pw_srh {
	width: 100;
	overflow: hidden;
	list-style: none;
}

.srh_box or {
	box-sizing:
}

.id_pw_srh li {
	float: left;
	width: 50%
}

.id_pw_srh li .srh_box {
	padding: 23px 41px 34px
}

.id_pw_srh li .or {
	border-style: solid none solid solid;
	border-width: 1px 0 1px 1px;
	border-color: #d8d8d8;
	background: #fbfbfb url("../../common/img/img_arrow01.gif") no-repeat
		left top
}

.id_pw_srh li .or h2 {
	margin-bottom: 10px;
	font-size: 22px;
	font-weight: 900;
	color: #da6700
}

.id_pw_srh li .br h2 {
	margin-bottom: 10px;
	font-size: 22px;
	font-weight: 900;
	color: #816950
}

.id_pw_srh li .br {
	border-style: solid;
	border-width: 1px;
	border-color: #d8d8d8;
	background: #fbfbfb url("../../common/img/img_arrow02.gif") no-repeat
		left top
}

.id_pw_srh li .srh_box .srh_top {
	text-align: center;
	font-size: 13px
}

.id_pw_srh li .srh_box .info {
	margin-top: 24px;
	padding-top: 20px;
	border-top: 1px dashed #d2d2d2
}

.id_pw_srh li .srh_box .info label {
	display: inline-block;
	width: 83px;
	margin-right: 12px;
	vertical-align: middle;
	font-weight: 900;
	font-size: 13px;
	color: #333333
}

.id_pw_srh li .srh_box .info p {
	margin-bottom: 5px
}

.id_pw_srh li .srh_box .info p input {
	width: 167px;
	height: 21px;
	border: 1px solid #d4d6d6
}

.id_pw_srh li .or button {
	display: block;
	width: 145px;
	margin: 26px auto 0;
	padding: 7px 0;
	border: 1px solid #e1660b;
	background-color: #e27819;
	font-family: 'Malgun Gothic', '맑은 고딕';
	color: #FFFFFF
}

.id_pw_srh li .br button {
	display: block;
	width: 145px;
	margin: 26px auto 0;
	padding: 7px 0;
	border: 1px solid #6a5845;
	background-color: #82705e;
	font-family: 'Malgun Gothic', '맑은 고딕';
	color: #FFFFFF
}
</style>

</head>


<!--col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4  col-sm-offset-4-->

<body>
	<%@include file="/views/common/header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="wrap">

		<div class="content">
			<h1 style="text-align: center;">ID/비밀번호 찾기</h1>
			<div class="agree">
				<ul class="id_pw_srh">
					<li>
						<div class="srh_box or">
							<div class="srh_top">
								<h2>ID찾기</h2>
								내정보에 등록한 정보로<br> 아이디를 찾을 수 있습니다.
							</div>
							<div class="info">
								<form name="id_form" method="post" action="search_idpw.asp"
									onsubmit="return chk_idform(this)">
									<input type="hidden" name="s_type" value="id">
									<fieldset style="box-sizing: content-box;">
										<p>
											<label for="id_name">이름</label><input type="text"
												name="me_name" id="id_name" title="이름 입력">
										</p>
										<p>
											<label for="id_mobile">휴대폰번호</label> <select name="me_hp1">
												<option value="">선택</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> - <input type="text" name="me_hp2" id="id_mobile1"
												title="휴대폰번호 입력" style="width: 44px;"> - <input
												type="text" name="me_hp3" id="id_mobile2" title="휴대폰번호 입력"
												style="width: 43px;">
										</p>
										<p>
											<label for="id_mail">가입시 이메일</label> <input type="text"
												name="me_email" id="id_mail1" title="가입시 이메일 입력">
										</p>
										<button type="submit">찾기</button>
									</fieldset>
								</form>
							</div>
						</div>
					</li>
					<li>
						<div class="srh_box br">
							<div class="srh_top">
								<h2>비밀번호 찾기</h2>
								내정보에 등록한 정보로<br> 비밀번호를 재설정할 수 있습니다.
							</div>
							<div class="info">
								<form name="pw_form" method="post" action="search_idpw.asp"
									onsubmit="return chk_pwform(this)">
									<input type="hidden" name="s_type" value="pw">
									<fieldset>
										<p>
											<label for="pw_name">ID</label> <input type="text"
												name="me_id" id="pw_name" title="아이디 입력">
										</p>
										<p>
											<label for="pw_phone">이름</label> <input type="text"
												name="me_name" id="pw_phone" title="이름 입력">
										</p>
										<p>
											<label for="pw_mail">가입시 이메일</label> <input type="text"
												name="me_email" id="pw_mail2" title="가입시 이메일 입력">
										</p>
										<button type="submit">찾기</button>
									</fieldset>
								</form>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

	</div>
	<%@include file="/views/common/footer.jsp"%>
</body>

</html>
