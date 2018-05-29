<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.* , com.fr.jsp.board.model.vo.*,com.fr.jsp.product.model.vo.* ,com.fr.jsp.common.PageInfo"%>

<%
	ArrayList<ReviewBoard> reviewList = (ArrayList<ReviewBoard>) request.getAttribute("reviewList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Product p = (Product)request.getAttribute("product");
%>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>상품 페이지</title>

<!-- 부트스트랩 -->
<link href="../../resources/css/bootstrap.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<script src="../../resources/js/bootstrap.js"></script>


<style>
/*xs 사이즈 이하면 컨테이너 사이즈 고정*/
@media ( max-width :769px) {
	.container {
		width: 700px;
	}
}

@
-moz-document url-prefix () {fieldset { display:table-cell;
	
}

}

/*select 텍스트 중앙 정렬*/
select {
	text-align-last: center;
}

option {
	margin-top: 10px;
}

.popover * {
	text-align: center;
}

/*선택 옵션 스타일*/
.selected_option {
	height: 24px;
	font-size: 18px;
	color: #4a4a4a;
	padding-left: 0;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-bottom: 25px;
}

.rating_star {
	color: gold;
	font-size: 1.2em;
}

.rating_star_empty{
	color:grey;
	font-size:1.2em;
}

.review_divider{
	border-color: grey;
}
</style>

<script>
	//로드할 때 실행되야 하는 함수들 모음
	$(function() {

		/* //리뷰 가져오기
		location.href="../../selectReviewList.do" */

		//상품 이름 가격 세팅
		product_price = <%=p.getProductPrice()%>;
		product_name = '<%=p.getProductName()%>';
		console.log(product_price+"   "+product_name);
		
		
		$('#product_name').text(product_name);
		$('#product_price').text(product_price + "원");

		//캐러셀 적용
		$('#imageCarousel').carousel();

		//처음 시작시 옵션상품이 아무것도 선택 안되어 있으므로 안됐다고 표시해주는 함수 실행
		if ($('#optionDiv').children().length == 0) {
			showNoOptionProductInfo();
		}

		//팝오버 함수와 템플릿 수정
		$('#product_info')
				.popover(
						{
							template : '<div class="popover" style="width:400px"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
						});

		//팝오버에 들어가는 내용들 설정
		var product_type = '<%=p.getProductCategoryName()%>';
		var product_origin = '<%=p.getProductOriginName()%>';
		var shipping_fee = "지역별상이";
		$('#product_info')
				.attr(
						"data-content",
						"<table class='table table-striped table-bordered table-condensed'><tbody><tr><th class='active'>상품타입</th><td>"
								+ product_type
								+ "</td><th class='active'>원산지</th><td>"
								+ product_origin
								+ "</td></tr><tr><th class='active'>제조원</th><td>꽃길</td><th class='active'>배송비</th><td>"
								+ shipping_fee
								+ "</td></tr><tr><th class='active'>기타</th><td colspan='3'>일부지역에 한하여 배송비가 추가될 수 있습니다.</td></tr></tbody></table>");

	});

	/*리뷰 작성 취소시 폼 입력 초기화*/
	function review_cancle() {

		$("[name=userName]").val("");
		$("[name=userEmail]").val("");
		$("[name=review]").val("");

		$("#reviewCollapse").collapse('hide');

	}

	/*옵션을 셀렉트로 선택했을때 붙이기*/
	function onChangeOption() {

		if ($('#option_product option:selected').val() == "none")
			return;

		var shoudAdd = true;

		$("#optionDiv").children('[name*=selected_option_row]').each(
				function() {

					if ($(this).attr("name").indexOf(
							$('#option_product option:selected').text()) > 0) {
						shoudAdd = false;
						showDuplicationWarning();
						return;
					}

				});

		if (shoudAdd) {
			$('#optionDiv').append(set_selected_option_row());
			$('#infoMessage').hide();
			calcTotalPrice();
			setTotalPrice();
		}

		$("#option_product").val('none');
	}

	/*선택된 옵션 상품 붙이는거 만드는 함수*/
	function set_selected_option_row() {

		var $temp = $('[name=selected_option_row]').clone(true, true);

		$temp.attr("name", "selected_option_row_"
				+ $('#option_product option:selected').text());

		$temp.children("[name=selected_name]").text(
				$('#option_product option:selected').text());
		$temp.children("[name=selected_price]").text(
				$('#option_product option:selected').val() + " 원");

		return $temp;
	}

	/*중복선택 오류 메시지 창 나타내는 함수*/
	function showDuplicationWarning() {
		$('#infoMessage').removeClass('alert-info');
		$('#infoMessage').addClass('alert alert-warning').text(
				"옵션상품은 개당 1개씩만 선택 가능합니다.").show().fadeOut(3000);
	}

	/*옵션 상품을 선택 안했을때 메시지 나타내는 함수*/
	function showNoOptionProductInfo() {
		$('#infoMessage').removeClass('alert-warning');
		$('#infoMessage').addClass('alert alert-info').text("선택된 상품이 없습니다.")
				.show();
	}

	/*총 가격 계산*/
	function calcTotalPrice() {

		var totalPrice = 0;
		$("#optionDiv div[name=selected_price]").each(function(i, element) {
			totalPrice += parseInt($(element).text());
		});
		return product_price + totalPrice;
	}

	/*상품가격과 총 가격을 표시*/
	function setTotalPrice() {

		if ($("#optionDiv div[name='total_Price']").length == 0) {

			$('#optionDiv')
					.append(
							$("<div class='offset-sm-1 col-7 col-sm-7 selected_option' name='total_product_name'>"
									+ product_name + "</div>"));
			$('#optionDiv')
					.append(
							$("<div class='col-4 col-sm-3 selected_option' name='total_product_price'>"
									+ product_price + "원" + "</div>"));

			$('#optionDiv')
					.append(
							$("<div class='offset-sm-1 col-7 col-sm-7 selected_option' name='total_PriceName'>총 가격</div>"));
			$('#optionDiv')
					.append(
							$("<div class='col-4 col-sm-3 selected_option' name='total_Price'>"
									+ calcTotalPrice() + "원" + "</div>"));

		} else {

			$("#optionDiv [name*=total]").remove();

			$('#optionDiv')
					.append(
							$("<div class='offset-sm-1 col-7 col-sm-7 selected_option' name='total_product_name'>"
									+ product_name + "</div>"));
			$('#optionDiv')
					.append(
							$("<div class='col-4 col-sm-3 selected_option' name='total_Price'>"
									+ product_price + "원" + "</div>"));

			$('#optionDiv')
					.append(
							$("<div class='offset-sm-1 col-7 col-sm-7 selected_option' name='total_PriceName'>총 가격</div>"));
			$('#optionDiv')
					.append(
							$("<div class='col-4 col-sm-3 selected_option' name='total_product_price'>"
									+ calcTotalPrice() + "원" + "</div>"));

		}

	}
	/*옵션 상품 취소*/
	function clickOptionCancle(obj) {
		$(obj).parents("[name*=selected_option_row]").remove();

		calcTotalPrice();
		setTotalPrice();

		if ($('#optionDiv').children("[name*=selected_option_row]").length == 0) {
			$("#optionDiv [name*=total]").each(function() {
				$(this).remove();
			});
			showNoOptionProductInfo();
		}
	}

	/*리뷰 등록*/

	function submitReview() {

		location.href = "/flowerRoadProj/insertReviewBoard.do"

	}
</script>
</head>

<body>

	<%@include file="../common/header.jsp"%>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<!--상품 사진과 옵션 선택-->
	<div class="container ">

		<div class="row">

			<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
				<img src="<%=request.getContextPath()%>/resources/images/product/<%=p.getImages().get(0)%>"
					class="img-responsive center-block" alt="">

				<div class="row ">
					<div class="btn-group col-md-6 col-sm-6 col-xs-6 col-lg-6">
						<button class="btn btn-default btn-sm glyphicon glyphicon-heart"
							style="color: red"></button>
						<button class="btn btn-default btn-sm glyphicon glyphicon-share"
							style="color: black"></button>
						<a id="product_info" onclick="popover();" tabindex="0"
							class="btn btn-sm btn-default glyphicon glyphicon-question-sign"
							role="button" data-toggle="popover" data-trigger="hover"
							title="상세 정보" data-html="true"></a>
					</div>

				</div>
			</div>


			<div class="col-xs-6 col-md-6 col-sm-6 col-lg-6 thumbnail">
				<div class="caption">
					<h3 id="product_name" class="thumbnail-label "></h3>
					<h4 id="product_price" class="thumbnail-label"></h4>
				</div>


				<form action="" class="form-horizontal col-xs-12 ">
					<div class="form-group">
						<label for="option_product" class="control-label">옵션상품</label> <select
							name="option_product" id="option_product"
							class="form-control input-lg" onchange="onChangeOption();">
							<option value="none">---상품 선택---</option>
							<option value="1000">프리미엄 사랑 카드</option>
							<option value="2000">유리화병 medium</option>
							<option value="3000">마카롱 10 개입</option>
						</select>

					</div>
					<div class="row">
						<div class="col-xs-12" id="optionDiv"></div>
					</div>

					<div class="row text-center" style="text-align: center">
						<div class="col-xs-offset-1 alert col-xs-10" id="infoMessage">
							asdf</div>
					</div>

					<hr>

					<div class="form-group col-xs-12">

						<label for="to_basket" class="control-label sr-only">장바구니</label>
						<button class="btn btn-lg btn-default col-xs-offset-1 col-xs-4"
							id="to_basket">장바구니</button>
						<label for="to_purchase" class="control-label sr-only">구매하기</label>
						<button class="btn btn-primary btn-lg col-xs-offset-1 col-xs-6"
							type=submit id="to_purchase">구매하기</button>
					</div>
				</form>

			</div>

		</div>


	</div>


	<div class="container">
		<hr style="width: 90%; height: 2px;">
	</div>



	

	<div class="container" style="margin-top: 10px">
		<hr style="width: 90%; height: 2px;">
	</div>

	<!--상품 설명-->
	<div class="container">
		<p class="text-left" style="line-height: 2em;">
			STORY.<br> 나랑 사랑한다.. 사랑하지 않는다... 나의 사랑이 당신보다도 깊어서 항상 걱정이예요.<br>
			괴테의 희곡 '파우스트'에서 마가렛이란 소녀가 .<br> 꽃잎을 한 장씩 떼어내면서 '나를 사랑한다..사랑하지
			않는다'를 반복하면서 .<br> 최후의 한장이 남았을 때 사랑하는지, 사랑하지 않는지 알아맞추는 사랑점을 하는
			장면이 있습니다. .<br> 그 때 마가렛이 사용한 꽃이 바로 이 과꽃이예요. '나의 사랑이 당신의 사랑보다
			깊다'는 식의 걱정은 .<br> 동서고금을 막론하고 사랑하는 연인에게 공통된 고민인 듯 해요. .<br>
			오늘 이 과꽃을 연인에게 선물하면서 메세지를 보내보세요. .<br> 내가 당신을 더 사랑하는 것 같아
			걱정이라고... .<br> 아마 그 분도 피식 웃으며 당신의 걱정을 이해할 거예요. .<br> 왜냐하면 그
			분도 같은 생각을 하고 있을 테니까요.
		</p>

	</div>
	
	<!--상품 사진-->
	<div class="container">
		<div class="row">
			<div style="text-align: center;">

				<img src="../../images/baiolres_f_01.jpg" alt=""
					class=" col-10 col-sm-10 " style="float: none;">
			</div>

		</div>
	</div>

	<div class="container" style="margin-top: 10px">
		<hr style="width: 90%; height: 2px;">
	</div>

	<!--배송 관련 글 -->
	<div class="container">
		<div class="row">
			<div class="col-xs col-lg col-md col-sm">
				<h4>
					<b>배송알림 메시지</b>
				</h4>
				배송상태가 변경된 경우 알림톡(카카오톡)을 통해 알려드립니다. <br> 카카오톡이 설치되어 있지 않은 고객님께는
				SMS로 메시지가 발송됩니다. <br> 해외번호를 사용하시는 고객님께는 이메일로 알림을 드립니다. <br>
				<br>
				<h4>
					<b>배송 가능 시간</b>
				</h4>
				월-토 am11시 - pm 7:30 <br> <br>
				<h4>
					<b>배송비 안내</b>
				</h4>
				서울 전 지역 무료 1만원 추가지역 : 구리 / 하남 / 성남 / 과천 / 의왕 / 군포 / 안양 / 광명 / 부천 <br>
				2만원 추가 지역 : 김포 / 고양 / 파주 / 양주 / 광주 / 용인 / 남양주 / 오산 / 화성 / 안산 / 시흥 /
				인천 / 수원 / 의정부 <br> <br> 불명확한 주소를 기재하여 수령인께 전달이 안되었을 경우,
				당사에서 책임을 지지 않습니다. <br> 정확한 주소와 연락처를 기재해 주시기 바랍니다. <br> <br>
				<h4>
					<b>결제 안내</b>
				</h4>
				가상계좌 입금이 확인되지 않으면 취소될 수 있습니다. <br> 주문 취소/변경 (콜센터 02-512-8180) <br>
				<br>
				<h4>
					<b>교환 및 환불 안내</b>
				</h4>
				꽃은 식물이기 때문에 배송된 이후에는 변심 및 훼손에 의한 환불이 불가한 점 양해 부탁드립니다. <br> 배송된
				상품의 신선도나 구성품 누락시 원모먼트의 책임인 경우 새로운 구성으로 교환해 드립니다. <br> 교환 및 환불
				문의 (콜센터 02-512-8180)<br>

			</div>
		</div>

	</div>
	<div class="container" style="margin-top: 10px">
		<hr style="width: 90%; height: 2px;">
	</div>


	<!--리뷰 게시판 -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<table>
					<%
						if (reviewList!=null) {
					%>

					<%
						for (int i = 0; i < reviewList.size(); ++i) {
					%>
					
					<div class="col-xs-8">
						
						<div>
						<%for(int j=0;j<reviewList.get(i).getRating();++j){ %>
							<span class="glyphicon glyphicon-star rating_star" ></span> 
						<%}%>
						
						<%for(int j=0;j<(5-reviewList.get(i).getRating());++j ){%>
							<span class="glyphicon glyphicon-star rating_star_empty" ></span>
						<%} %>
						
						
						<h4><%=reviewList.get(i).getSubmitDate() %></h4>
						<h3><%=reviewList.get(i).getbTitle() %></h3>
						<h4><%=reviewList.get(i).getbContent() %></h4>
						<br />
						<hr class="review_divider"/>
						</div>
					</div>
					<%
						}
					%>
					<%
						} else {
					%>

					<span class="lead">이 상품의 리뷰가 존재하지 않습니다.</span>

					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
	
	
	<%if(reviewList!=null&&reviewList.size()!=0){ %>
	<!--페이지 네이션  -->
	<div class="container">
		<div class="col-lg-5 col-lg-offset-5">
			<ul class="pagination">
   				<li>
      				<a href="selectReviewList.do?currPage=<%=pi.getStartPage() %>&productNum=<%=p.getProductNum()%>" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    			
    			<%System.out.println(pi.getCurrPage()+" "+pi.getEndPage()); %>
    			
    			<%if(pi.getCurrPage()<=pi.getStartPage()){ %>
    				<li class="disabled"><a href="" >&lt;</a></li>
    			<%} else{ %>
    				<li><a href="selectReviewList.do?currPage=<%=pi.getCurrPage()-1%>&productNum=<%=p.getProductNum()%>">&lt;</a></li>
    			<%} %>
    				<%for(int i=pi.getStartPage();i<=pi.getEndPage();++i){ %>
    			
    					<%if(i==pi.getCurrPage()){ %>
    						<li class="active"><a  href="selectReviewList.do?currPage=<%=i%>&productNum=<%=p.getProductNum()%>"><%=i%></a></li>
    					<%} else { %>
    						<li><a href="selectReviewList.do?currPage=<%=i%>&productNum=<%=p.getProductNum()%>"><%=i%></a></li>
    				<%} %>
    			<%} %>
    			
    			<%if(pi.getCurrPage()>=pi.getMaxPage()){ %>
    				<li class="disabled"><a href="" >&gt;</a></li>
    			<%}else{ %>
    				<li><a href="selectReviewList.do?currPage=<%=pi.getCurrPage()+1%>&productNum=<%=p.getProductNum()%>">&gt;</a></li>
    			<% } %>
    			<li>
     				<a href="selectReviewList.do?currPage=<%=pi.getEndPage()%>&productNum=<%=p.getProductNum()%>" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
  			</ul>
		
		
		</div>
	
	</div>
	<%} %>

	<!--리뷰 폼-->
	<div class="container">

		<div class="row">
			<a class="btn btn-primary btn-lg col-xs-3" data-toggle="collapse"
				href="#reviewCollapse" id="reviewBtn">리뷰 남기기</a>


			<div class="collapse col-xs-10 col-md-10 col-sm-10 col-lg-10"
				id="reviewCollapse">
				<form class="form-horizontal" action="insertReview.do" method="get">

					<div class="form-group">
						<label for="title" class="control-label" style="font-size: 1.3em">제목<span
							style="color: red">*</span></label> <input class="form-control input-lg"
							type="text" name="title" placeholder="">
					</div>

					<!-- <div class="form-group">
                        <label for="email" class="control-label" style="font-size: 1.3em">이메일<span style="color: red">*</span></label>
                        <input class="form-control input-lg" type="email" name="userEmail" placeholder="">
                    </div> -->


					<div class="form-group">
						<label for="review" class="control-label" style="font-size: 1.3em">내용<span
							style="color: red">*</span></label>
						<textArea class="form-control input-lg" type="text" name="content"
							placeholder="100자 이내로 입력해 주세요"></textArea>
						<input type="hidden" name="member_num" value="A002" /> <input
							type="hidden" name="product_num" value="<%=p.getProductNum() %>" />
					</div>

					<div class="form-group">
						<label for="" class="control-label" style="font-size: 1.3em">평가<span
							style="color: red">*</span></label><br> <label class="radio-inline"><input
							type="radio" name="rating" value="1"> 1</label> <label
							class="radio-inline"><input type="radio" name="rating"
							value="2"> 2</label> <label class="radio-inline"><input
							type="radio" name="rating" value="3" checked> 3</label> <label
							class="radio-inline"><input type="radio" name="rating"
							value="4"> 4</label> <label class="radio-inline"><input
							type="radio" name="rating" value="5"> 5</label>

					</div>

					<div class="form-group">
						<button class="btn btn-primary" type="submit">등록</button>
						<button class="btn btn-warning" type="button"
							onclick="review_cancle();">취소</button>
					</div>


				</form>
			</div>

		</div>

	</div>

	<div class="container" style="margin-top: 10px">
		<hr style="width: 90%; height: 2px;">
	</div>



	<!--관련 상품 캐러셀-->

	<div class="container">
		<div>
			<h3>관련 상품</h3>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div id="imageCarousel" class="carousel slide" data-pause="hover"
					data-interval="5000">
					<ol class="carousel-indicators">
						<li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#imageCarousel" data-slide-to="1"></li>
					</ol>

					<div class="carousel-inner">

						<div class="item active">
							<div class="row">
								<div class="col-xs-4">
									<img src="../../images/tiramisu_o_01.jpg"
										class="img-responsive thumbnail" alt="">
									<div class="carousel-caption">
										<h3>당근케이크</h3>
										<p>맛있음</p>
									</div>
								</div>

								<div class="col-xs-4">
									<img src="../../images/carrot-cake_o_01.jpg"
										class="img-responsive thumbnail" alt="">
									<div class="carousel-caption">
										<h3>당근케이크</h3>
										<p>맛있음</p>
									</div>
								</div>

								<div class="col-xs-4">
									<img src="../../images/chocolate-cake_o_01.jpg"
										class="img-responsive thumbnail" alt="">
									<div class="carousel-caption">
										<h3>당근케이크</h3>
										<p>맛있음</p>
									</div>
								</div>
							</div>
						</div>

						<div class="item">
							<div class="row">
								<div class="col-xs-4">
									<img src="../../images/tiramisu_o_01.jpg"
										class="img-responsive thumbnail" alt="">
									<div class="carousel-caption">
										<h3>당근케이크</h3>
										<p>맛있음</p>
									</div>
								</div>

								<div class="col-xs-4">
									<img src="../../images/carrot-cake_o_01.jpg"
										class="img-responsive" alt="">
									<div class="carousel-caption">
										<h3>당근케이크</h3>
										<p>맛있음</p>
									</div>
								</div>

								<div class="col-xs-4">
									<img src="../../images/chocolate-cake_o_01.jpg"
										class="img-responsive thumbnail" alt="">
									<div class="carousel-caption">
										<h3>당근케이크</h3>
										<p>맛있음</p>
									</div>
								</div>
							</div>
						</div>

					</div>

					<a href="#imageCarousel" class="carousel-control left"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a href="#imageCarousel" class="carousel-control right"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>
	</div>



	<!--clone용 html 태그들 (보이지는 않음)-->
	<div class="container" style="display: none">

		<div class="row">

			<div name="selected_option_row">
				<div class="offset-sm-1 col-7 col-sm-7  selected_option"
					name='selected_name'></div>
				<div class='col-4 col-sm-3 selected_option' name='selected_price'></div>
				<div class='col-1 col-sm-1'>
					<span class='btn btn-default btn-xs glyphicon glyphicon-remove'
						onclick='clickOptionCancle(this);'></span>
				</div>
			</div>

		</div>


		<div name="review_article">
			<div class="row">
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span>
			</div>
			<div class="row lead">꽃이 너무 예뻐요 !!</div>
			<div class="row">d</div>
			<div class="row">f</div>

		</div>

	</div>


	<%@include file="../common/footer.jsp"%>


</body>

</html>
