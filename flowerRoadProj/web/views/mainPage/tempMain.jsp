<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>테스트페이지</title>

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

.test{
	border:1px solid;
}

</style>



</head>
<body>

	<button onclick="location.href='/flowerRoadProj/selectProduct.do'">테스트용!</button>
	<img
		src="/flowerRoadProj/web/resources/images/product/baiolres-gwaggoc_d_01.jpg"
		alt="" />
	<span>안녕하세요!</span>

	<div class="container-fluid" style="display: inline-block;">
		<div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"></div>
		<div class=" col-xs-2 col-sm-2 col-md-2 col-lg-2">
		<a href="<%=request.getContextPath()%>/categorizedProduct.do?category=생일">
			<img src="<%=request.getContextPath()%>/resources/images/1.PNG"
				class="img-responsive anniversary_Img">
		</a>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
		<a href="">
			<img src="<%=request.getContextPath()%>/resources/images/2.PNG"
				class="img-responsive anniversary_Img">
		</a>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
		<a href="">
			<img src="<%=request.getContextPath()%>/resources/images/3.PNG"
				class="img-responsive anniversary_Img">
				</a>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
		<a href="">
			<img src="<%=request.getContextPath()%>/resources/images/4.PNG"
				class="img-responsive anniversary_Img">
		</a>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
		<a href="">
			<img src="<%=request.getContextPath()%>/resources/images/5.PNG"
				class="img-responsive anniversary_Img">
		</a>
		</div>
		<div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"></div>
	</div>
	
	<div class="container-fluid">
	
		<button class="thumbnail">
			<div class="caption">
				<h6>#생일/축하</h6>
			</div>
			<img  class="test" src="<%=request.getContextPath() %>/resources/images/wedding-cake.png" alt="" />
		</button>
		
	</div>

</body>
</html>