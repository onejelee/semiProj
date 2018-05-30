<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.fr.jsp.order.model.vo.*"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list"); 
%>
<!DOCTYPE>
<html>
    <head>
        <title>꽃길-주문 조회</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="<%=request.getContextPath() %>/resources/images/title_image.png" type="image/ico" />
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css">
        <script src="<%=request.getContextPath() %>/resources/js/jquery-1.12.2.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/myPage.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.css">
        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
        <!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<!-- // jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
    </head>
    <body>
    <%@ include file="/views/common/header.jsp" %>
        <!-- 마이페이지 카테고리  -->
        <br><br><br><br><br><br><br><br><br><br>
        <div class="container-fluid">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="info" onclick="info();">내 정보</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" 
                style="font-weight:bold; text-decoration: underline;" id="check" onclick="orderChk();">주문 조회</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="favarite" onclick="favorite();">관심 상품</div>
            <div class="category col-sm-2 col-md-2 col-lg-2" id="1on1" onclick="oneToOne();">1:1 문의</div>
            <div class="col-sm-3 col-md-3 col-lg-3"></div> 
        </div>
        <br><br><br><br><br>

        <!-- 주문 조회 창 -->
        <div class="container-fluid">
                <div class="col-sm-4 col-md-4 col-lg-4"><h4><i>주문 조회</i> 
                    <small>: 회원님의 주문내역을 조회하실수 있습니다.</small></h4></div>
                <div class="col-sm-8 col-md-8 col-lg-8"></div>
        </div>
        <div>
                <div class="info">
                    
                        <br>
                        
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2 input-group date" data-provide="datepicker">
                                <input type="text" class="form-control" placeholder="조회 기간 시작일" id="datepicker"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2 input-group date" data-provide="datepicker">
                                <input type="text" class="form-control" placeholder="조회 기간 종료일" id="datepicker"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <div class="col-sm-2 col-md-2 col-lg-2"> 
                            <input class="ordchk btn-default" type="button" id="search" onclick="search();" value="검색" style="color:white; background:midnightblue;">
                        </div>
                        <div class="col-sm-2 col-md-2 col-lg-2"> 
                            <input class="grayBtn ordchk" type="reset" value="초기화">
                        </div>
                        
                        <br><br><br><br>

    
                        <table class="table table-hover">
                            <tr style="background-color: lightgray;">
                                <th>주문번호</th>
                                <th>주문일자</th>
                                <th>상품명</th>
                                <th>결제금액</th>
                                <th>익명발송 여부</th>
                                <th>배송현황</th>
                            </tr>
                            <% int i = list.size();
				for(Order o : list){%>
					<tr>
						<td><%= i-- %></td>
						<td><%=o.getOrdered_date() %></td>
						<td><%=o.getProduct_num() %></td>
						<td><%=o.getProduct_cost() %></td>
						<td><%=o.getAnonymous_delivery() %></td>
						<td><%=o.getOrder_state_code() %></td>
					</tr>
				<% }  %>
                        </table>
                    
                </div>
        </div>
        

        <!-- 숫자 버튼창 -->
        <div class="container-fluid">
                <div class="col-sm-5 col-md-5 col-lg-5"></div>
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
        <%@ include file="/views/common/footer.jsp" %>
    </body>
    
</html>