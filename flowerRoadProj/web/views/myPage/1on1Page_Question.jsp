<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-1:1 문의</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="<%=request.getContextPath() %>/resources/images/title_image.png" type="image/ico" />
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/jquery-1.12.2.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
            /*네비바 배경색 조정*/
             .navbar-default { background-color: rgba(255, 254, 254,0.9); }
             /*네비바 가운데 정렬*/
            .navbar .navbar-nav {
            display: inline-block;
            float: none;
            }
            .product_img{
            display: block;
            max-width: 100%;
            height: 400px;
            }

            
        </style>
    </head>
    <body>
        <!-- 상단의 nav 바 -->
        <nav class="navbar navbar-fixed-top navbar-default">
            <div class="container-fluid">
                    <div class="col-xs-3">
                      <ul class="nav navbar-nav navbar-left">
                        <li><a href="#">즐겨찾기</a></li>
                        <!-- 즐겨찾기가 가능한가? 주소는 어디로 해야되나-->
                      </ul>
                    </div>
                      <div class="col-xs-6" style="text-align:center; display:inline-block;">
                          <img src="<%=request.getContextPath() %>/resources/images/mainImage2.jpg" style="width:120px; height:80px"alt="">
                      </div>
                    <div class="col-xs-3">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">로그인</a></li>
                            <li><a href="#">회원가입</a></li>
                            <li><a href="#">장바구니</a></li>
                            <li><a href="#">고객센터</a></li>
                          </ul>
                    </div>
                  </div>
        </nav>
        <!-- 마이페이지 카테고리  -->
        <br><br><br><br><br><br><br><br><br><br>
        <div class="container-fluid">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="category col-sm-2 col-md-2 col-lg-2" 
                style="font-weight:bold; text-decoration: underline;" id="info" onclick="info();">내 정보</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="check" onclick="orderChk();">주문 조회</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <div class="col-sm-3 col-md-3 col-lg-3"></div> 
        </div>

        <br><br><br><br><br><br><br>

        <!-- 1:1 문의
        <div class="container-fluid">
        <div class="col-sm-6 col-md-6 col-lg-6"></div>
        <div class="col-sm-1 col-md-1 col-lg-1"><h2>1:1 문의</h2></div>
        <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
        <br><br><br> -->

        <!-- 1:1 문의하기 -->
        <div class="container-fluid">
            <div>
            <div class="info container">
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
                <div class="col-sm-8 col-md-8 col-lg-8" id="questionBoard">
                        <form class="form-horizontal">
                            <br><br>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputLarge">이름</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="nameBoard" value="홍길동" disabled>
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">이메일</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="mailBoard" value="na@email.com">
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">핸드폰</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="phoneBoard" value="010-2222-3333">
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">제목</label>
                                  <div class="col-sm-10">
                                    <input class="form-control" type="text" id="titleBoard">
                                  </div>
                                </div>
                                <div class="form-group form-group-sm">
                                  <label class="col-sm-2 control-label" for="formGroupInputSmall">내용</label>
                                  <div class="col-sm-10">
                                    <textarea id="contentBoard" cols="83" rows="10"></textarea>
                                  </div>
                                </div>
                              </form>
                </div>
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
            </div>
        </div>
        <!-- 수정 및 탈퇴 버튼 -->
        <div class="container-fluid">
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">
                <input type="submit" id="mailSend"value="문의하기">
            </div>
            
            <div class="col-sm-2 col-md-2 col-lg-2">
                <button class="grayBtn" onclick="viewBoard();"><b>목록 보기</b></button>
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4"></div>
        </div>
    </body>
</html>