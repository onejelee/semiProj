<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-관심 상품</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="<%=request.getContextPath() %>/resources/images/title_image.png" type="image/ico" />
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/jquery-1.12.2.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
        <!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
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
            <div class="category col-sm-3 col-md-3 col-lg-3" id="info" onclick="info();">내 정보</div>
            <div class="category col-sm-3 col-md-3 col-lg-3" id="check" onclick="orderChk();">주문 조회</div>
            <div class="category col-sm-3 col-md-3 col-lg-3" 
            style="font-weight:bold; text-decoration: underline;" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-3 col-md-3 col-lg-3" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <!-- <div class="col-sm-2 col-md-2 col-lg-2"></div> -->
        </div>

        <br><br><br><br><br>

        <!-- 관심 상품 창 -->
        <div class="container-fluid">
                <div class="col-sm-4 col-md-4 col-lg-4"><h4><i>관심 상품</i> 
                    <small>: 회원님의 관심상품 보관함 내역입니다.</small></h4></div>
                <div class="col-sm-8 col-md-8 col-lg-8"></div>
        </div>
        <div>
                <div class="info">
                       
                        <table class="table table-hover">
                            <tr style="background-color: lightgray;">
                                <th><input type="checkbox" disabled></th>
                                <th>사진</th>
                                <th>수량</th>
                                <th>재고상황</th>
                                <th>가격</th>
                                <th>장바구니</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox" style="padding:50px;"></td>
                                <td><img src="../../images/flower1.jpg" width="60px;" height="60px;"></td>
                                <td><input type="number" value="1">개</td>
                                <td>재고 있음</td>
                                <td>3000원</td>
                                <td><input type="submit" value="장바구니"><br><input type="button" value="삭제하기"></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" style="padding:50px;"></td>
                                <td><img src="../../images/flower2.jpg" width="60px;" height="60px;"></td>
                                <td><input type="number" value="3">개</td>
                                <td style="color:red;">재고 없음</td>
                                <td>4000원</td>
                                <td><input type="submit" value="장바구니"><br><input type="button" value="삭제하기"></td>
                            </tr>
                        </table>
                    
                </div>
        </div>
        

        <!-- 버튼 -->
        <div class="container-fluid">
                
                <div class="col-sm-2 col-md-2 col-lg-2">
                    <button style="width:100px; height:30px; margin-top:20px;">
                        전체 삭제</button>
                </div>
                <div class="col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-sm-2 col-md-2 col-lg-2">
                        <nav style="color:midnightblue;">
                                <ul class="pagination">
                                  <li><a href="#"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                                  <li><a href="#">1</a></li>
                                  <li><a href="#">2</a></li>
                                  <li><a href="#">3</a></li>
                                  <li><a href="#">4</a></li>
                                  <li><a href="#">5</a></li>
                                  <li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                                </ul>
                              </nav>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
        </div>

    </body>
</html>