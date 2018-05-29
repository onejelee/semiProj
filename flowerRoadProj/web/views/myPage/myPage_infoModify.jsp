<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-정보 수정</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="<%=request.getContextPath() %>/resource/images/title_image.png" type="image/ico" />
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/bootstrap.min.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resource/js/jquery-1.12.2.min.js"></script>
        <script src="<%=request.getContextPath() %>/resource/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resource/js/myPage.js"></script>
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
                          <img src="../images/city1.PNG" style="width:120px; height:80px"alt="">
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
            <!-- <div class="col-sm-2 col-md-2 col-lg-2"></div> -->
            <div class="category col-sm-3 col-md-3 col-lg-3" 
                style="font-weight:bold; text-decoration: underline;" id="info" onclick="info();">내 정보</div>
            <div class="category col-sm-3 col-md-3 col-lg-3" id="check" onclick="orderChk();">주문 조회</div>
            <div class="category col-sm-3 col-md-3 col-lg-3" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-3 col-md-3 col-lg-3" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <!-- <div class="col-sm-2 col-md-2 col-lg-2"></div> -->
        </div>

        <br><br><br><br><br>

        <!-- 정보 수정 창 -->
        <div class="container-fluid">
                <div class="col-sm-2 col-md-2 col-lg-2"><h4><i>정보 수정</i></h4></div>
                <div class="col-sm-10 col-md-10 col-lg-10"></div>
        </div>

        <div>
                <div class="info">
                    
                        <br>
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>이름</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">홍길동</p></div>  <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>이메일</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><input type="text" id="emailModi" name="emailModi" placeholder="내용을 입력해주세요"></div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>주소</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><input type="text" id="addrModi" name="addrModi" placeholder="내용을 입력해주세요"></div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>문자 수신동의</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                                <label class="radio-inline">
                                        <input type="radio" name="smsInlineRadioOptions" id="inlineRadio1" value="option1"> <b>수신동의</b>
                                </label>
                                <label class="radio-inline">
                                        <input type="radio" name="smsInlineRadioOptions" id="inlineRadio1" value="option1"> <b>동의안함</b>
                                </label>
                        </div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>이메일 수신동의</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                                <label class="radio-inline">
                                        <input type="radio" name="emailInlineRadioOptions" id="inlineRadio2" value="option2"> <b>수신동의</b>
                                </label>
                                <label class="radio-inline">
                                        <input type="radio" name="emailInlineRadioOptions" id="inlineRadio2" value="option2"> <b>동의안함</b>
                                </label>
                        </div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>전화번호</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><input type="text" name="tel1" id="tel1" maxlength="3" size="3"/> -
                                                                <input type="text" name="tel2" id="tel2" maxlength="4" size="4"/> -
                                                                <input type="text" name="tel3" id="tel3" maxlength="4" size="4"/>
                        </div> <br><br><br>
    
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><b>가입날짜</b></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"><p class="text-muted" style="font-weight:bold;">2018-05-05 &nbsp;&nbsp;&nbsp;
                                                                                                                 12:34</p></div> <br><br><br>
                    
                </div>
            </div>
        

        <!-- 수정 확인 -->
        <div class="container-fluid">
            <div class="col-sm-5 col-md-5 col-lg-5"></div>
            <div class="col-sm-2 col-md-2 col-lg-2">>
                <button id="modify" onclick="modiComplete();"><b>수정완료</b></button>
            </div>
            <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>
    </body>
</html>