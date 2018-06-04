<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="..//lib/bootstrap.min.css">
    <script src="../lib/jquery-1.12.2.min.js"></script>
    <script src="../lib/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>회원가입</title>

    <script src="../sibar/js/jquery-3.3.1.min.js"></script>
    <style>
        .M_box {
            width: 50%;
            margin: auto;
            padding: auto;
        }

        #td1 {
            width: 130px;
            height: 50px;
        }

        #td2 {
            width: 350px;
            align-content: center;
            margin-left: auto;
            margin-right: auto;
        }

        #td3 {
            width: 130px;
            text-align: center;
        }

    </style>
    <script>
        $(document).ready(function() {

            $(window).on('resize load', function() {
                $('.contentwrap').css({
                    "padding-top": $(".navbar").height() + "px"
                });
            });

        });

    </script>

</head>

<body>
   <%@include file="/views/common/header.jsp" %>

    <br><br><br><br><br><br><br><br>
    <!-- <p class="txt_notice">정보를 정확히 입력해주셔야 아이디나 비밀번호 분실 시 찾으실 수 있습니다. </p> -->
    
    <div class="M_box">
        <div class="srh_top">

            <h2>&#9679;회원 가입</h2>
        </div>
        <table>
            <tr>
                <td id="td1"><label for="inputId" class="control-label">아이디</label></td>
                <td id="td2"><input type="id" class="form-control" id="inputId" placeholder="아이디"></td>
                <td id="td3">
                    <a class="btn btn-default" href="#" role="button" id="certBtn ">아이디 중복</a></td>
            </tr>
            <tr>
                <td id="td1"><label for="inputPassword" class="control-label">비밀번호</label></td>
                <td id="td2" colspan="2"><input type="password" class="form-control" id="inputPassword" placeholder="비밀번호"></td>
            </tr>
            <tr>
                <td id="td1"><label for="inputPasswordCheck" class="control-label">비밀번호 확인</label></td>
                <td id="td2" colspan="2"><input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인"></td>
            </tr>
            <tr>
                <td id="td1"><label for="inputName" class="control-label">이름</label></td>
                <td id="td2" colspan="2"><input type="text" class="form-control" id="inputName" placeholder="이름"></td>
            </tr>
            <tr>
                <td id="td1"><label for="gander" class="control-label">성별</label></td>
                <td id="td2" colspan="2">
                    <div class="col-lg-6 col-mg-6 col-sm-6"><input type="radio" name="gender" value="male">
                        <lable for="male">남성</lable>
                    </div>
                    <div class="col-lg-6 col-mg-6 col-sm-6"><input type="radio" name="gender" value="female">
                        <lable for="female">여성</lable>
                    </div>
                </td>
            </tr>
            <tr>
                <td id="td1"><label for="inputBirthday" class="control-label">생일</label></td>
                <td id="td2" colspan="2"><input type="date" class="form-control" id="inputBirthday" placeholder="생일"></td>
            </tr>
            <tr>
                <td id="td1"><label for="inputEmail" class="control-label">이메일</label></td>
                <td id="td2"><input type="email" class="form-control" id="inputEmail" required="required" placeholder="이메일"></td>
            </tr>

            <tr>
                <td id="td1"><label for="address" class="control-label">우편번호</label></td>
                <td id="td2"><input type="text" class="form-control" id="zipCode" name="zipCode"></td>
                <td id="td3"><a id="ckZip" onclick="addrSearch();">검색</a></td>
            </tr>
            <tr>
                <td id="td1"><label for="address1" class="control-label">주소</label></td>
                <td id="td2" colspan="2"><input type="text" id="address1" class="form-control" name="address1"></td>
            </tr>
            <tr>
                <td id="td1"><label for="address1" class="control-label">상세주소</label></td>
                <td id="td2" colspan="2"><input type="text" id="address2" class="form-control" name="address2"></td>
            </tr>

            <tr>
                <td id="td1"><label for="inputNumber" class="control-label">휴대폰번호</label></td>
                <td id="td2"><input type="text" class="form-control" id="inputNumber" placeholder="휴대폰번호"></td>
                <td id="td3"><a class="btn btn-default" href="#" role="button" id="certBtn">인증번호 전송</a></td>
            </tr>
            <tr>
                <td id="td1"><label for="inputNumberCheck" class="control-label">인증번호 확인</label></td>
                <td id="td2"><input type="text" class="form-control" id="inputNumberCheck" placeholder="인증번호 6자리"></td>
                <td id="td3"><a class="btn btn-default" href="#" role="button" id="confirmBtn">인증번호
				확인</a></td>
            </tr>
            <tr colspan="3">
                <td id="td1"></td>
                <td id="td3"><label for="inputAgree" class="control-label">약관 동의</label>
                    <input id="agree" type="checkbox">
                    <label><a href="/agreement">이용약관</a>에 동의합니다.</label></td>
                <td></td>
            </tr>
            <tr>
                <td id="td1"></td>
                <td id="td3"><button type="submit" class="btn btn-primary" href="./login1.jsp">회원가입</button></td>
                <td></td>
            </tr>
        </table>
    </div>
    <%@include file = "/views/common/footer.jsp" %>
</body>
<script>
            function addrSearch() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수

		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;

		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
		                
		                $('#address1').val(fullAddr);

		                // 커서를 상세주소 필드로 이동한다.
		                $('#address2').focus();
		            }
		        }).open();
		    };
            </script>
</html>
