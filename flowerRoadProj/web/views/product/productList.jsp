<%@page import="com.fr.jsp.product.model.vo.ProductSimple"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* ,com.fr.jsp.product.model.vo.Product,com.fr.jsp.common.PageInfo"%>
    
<% ArrayList<ProductSimple> list = (ArrayList<ProductSimple>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int reviewCount = (Integer)request.getAttribute("reviewCount");
	String category = (String)request.getAttribute("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
    
	<title>상품목록</title>
	<style>		
		@media (max-width: 767px){ 
                .container{
                    width: 760px;
                }
                .container-fluid{
                	width: 760px;
                }
            }
        
        .hrline{
        	background: black;
        } 
        .top-margin{
        	margin-top: 1.5em;
        }
        .linein{
        	display: inline;
        } 
        .test-border{
        	border: 1px solid black;
        }
        .rightAlign{
        	text-align: right;
        }
        .font-gray{
        	color: gray;
        }
        .border-gray{
        	border: 1px solid gray;
        }
        .font-big{
        	font-size: 1.2em;
        }
        .tag{
        	position: relative;
        	top: -3em;
        	right: -1em;
        }
        
        .thumbnail img:HOVER{
        
        	opacity: 0.5;
   			filter: alpha(opacity=50);
        	animation-name: opaque;
    		animation-duration: 10s;
        }
        
       
        .items{
        	width:300px;
        	height: 550px;
        }
        
        .test{
        	border:1px solid;
        }
        
	</style>


</head>
<body>




<%@include file="../common/header.jsp"%>
<br /><br /><br /><br /><br /><br />
 <div class="container-fluid" style="text-align:center;">
 	<div style="float:none;">
    <div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"></div>
    <div class=" col-xs-2 col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/1.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/2.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/3.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/4.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
      <img src="<%=request.getContextPath()%>/resources/images/5.PNG" class="img-responsive anniversary_Img">
    </div>
    <div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"></div>
    </div>
 </div>
   	
   <!-- 여기부터 내용을 넣겠다 -->
	<div class="container">
	<div class="col-lg-12 visible-lg " style="margin-top: 4em"></div>
		
		<div class="col-lg-12 top-margin"> <!-- 높은가격순? -->
			
			<div class="col-lg-12" ><!-- 여기에 상품 리스트. 사진들 들어갈거야 -->
				<!-- <div class="row"> -->
				<div class="linein"><button type="button" class="btn btn-primary">인기순</button></div>
				<div class="linein"><button type="button" class="btn btn-success">추천순</button></div>
				<div class="linein"><button type="button" class="btn btn-info">낮은가격순</button></div>
				<div class="linein"><button type="button" class="btn btn-warning">높은가격순</button></div>
				<hr class="col-lg-12 hrline" style="float:center;">
				
				<%if(list!=null){ %>
				<%for(int i=0;i<list.size();++i) {%>
				
  					<div class="col-sm-6 col-md-4 col-lg-4  test">
    					<div class="col-lg-12 thumbnail items">
    					<a href="<%=request.getContextPath()%>/productDetail.do?productNum=+<%=list.get(i).getProductNum()%>">
      						<img src="<%=request.getContextPath()%>/resources/images/product/<%=list.get(i).getImage()%>" alt="...">
      					</a>
      						<span class="label label-primary tag">Primary</span>
      						<span class="label label-success tag">success</span>
      						<div class="col-lg-12 caption">        						
        						<h4 class="col-lg-12"><span class="font-gray"><small>감사의 마음을 전하세요</small></span><br /><b class="font-big"><%=list.get(i).getProductName() %></b></h4>        						
        						<h4 class=" col-lg-12"><%=list.get(i).getProductPrice() %></h4>
        						<h5 class="col-lg-12 font-gray">리뷰 <span><%=list.get(i).getReviewCount() %></span></h5>  
        						<div class="col-lg-12 ">    						
        							<a class="col-lg-4 btn btn-default" role="button">장바구니</a> 
        							<%-- <%System.out.println(list.get(i).getProductNum()); %> --%>
        							<a class="col-lg-7 col-lg-offset-1 btn btn-primary" role="button" 
        							onclick="location.href='<%=request.getContextPath()%>/productDetail.do?productNum=+<%=list.get(i).getProductNum()%>'">바로구매</a>
        							 
      							</div>	 
      						</div>
    					</div>
  					</div>
  					<%} %>
  					<%} %>
  					
				<!-- </div> -->
			
			</div>
			

			
		</div>
		
   		
   	   
	</div>
	
	<!--페이지 네이션  -->
	<%if(pi!=null){ %>
	<div class="container" style="text-align: center;">
		
		<div class="col-lg-12" style="float:none;">
			<ul class="pagination">
   				<li>
      				<a href="<%=request.getContextPath()%>/categorizedProduct.do?category=<%=category%>&currPage=<%=pi.getStartPage() %>" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    	
			    	<%
			    		System.out.println(list);
						System.out.println(pi);
						System.out.println(pi.getStartPage()+"     "+pi.getEndPage());
					
			
					%>
    	
    			<%if(pi.getCurrPage()<=pi.getStartPage()){ %>
    				<li class="disabled"><a href="" >&lt;</a></li>
    			<%} else{ %>
    				<li><a href="<%=request.getContextPath()%>/categorizedProduct.do?category=<%=category%>&currPage=<%=pi.getCurrPage()-1%>">&lt;</a></li>
    			<%} %>
    			
    				<%for(int i=pi.getStartPage();i<=pi.getEndPage();++i){ %>
    			
    					<%if(i==pi.getCurrPage()){ %>
    						<li class="active"><a><%=i%></a></li>
    					<%} else { %>
    						<li><a href="<%=request.getContextPath()%>/categorizedProduct.do?category=<%=category%>&currPage=<%=i%>"><%=i%></a></li>
    				<%} %>
    			<%} %>
    			
    			<%if(pi.getCurrPage()>=pi.getMaxPage()){ %>
    				<li class="disabled"><a href="" >&gt;</a></li>
    			<%}else{ %>
    				<li><a href="<%=request.getContextPath()%>/categorizedProduct.do?category=<%=category%>&currPage=<%=pi.getCurrPage()+1%>">&gt;</a></li>
    			<% } %>
    			<li>
     				<a href="<%=request.getContextPath()%>/categorizedProduct.do?category=<%=category%>&currPage=<%=pi.getEndPage()%>" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
  			</ul>
		
		
		</div>
	
	</div>
   <%} %>
 
   
   

<%@include file="../common/footer.jsp"%>


</body>
</html>