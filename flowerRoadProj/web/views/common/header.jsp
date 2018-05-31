<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fr.jsp.member.model.vo.Member"%>
<%
   String memberNum = (String)session.getAttribute("memberNum");
	Member m = (Member)session.getAttribute("m");
	
%>
<!DOCTYPE html>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"><!-- 
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css"> -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/resources/images/FlowerRoadLogo.png" type="image/ico" />
    <style>
    
        .navbar-bottom-font {
            font-weight: bold;
        }

        @media (max-width: 768px) {
            #no1,
            #no2 {
                width: 750px;
            }
            .container {
                width: 750px;
            }
        }
    .navbar-default {
      background-color: rgba(255, 254, 254, 0.9);
    }
    .btn {cursor:pointer;}
    </style>
<%-- <script>
   function mainGo(){
      location.href="<%=request.getContextPath()%>/main.jsp";
   }

     $('#logo').on('click', function (e) {
       window.location.href="<%=request.getContextPath()%>/main.jsp";
    }); 
}
</script> --%>

<!-- <body style="height:5000px"> -->
   
    
    <br>
    <div class="visible-md">md</div>
    <div class="visible-sm">sm</div>
    <nav class="navbar navbar-default navbar-fixed-top" id="naaaaav">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="#" id="favorite">
                    <img src="<%=request.getContextPath()%>/resources/images/main/favorite.png" width="75px" height="75px">
                </a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="text-align:center; display:inline-block;">
                <div id="no1">
                    <a href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/resources/images/mainImage2.jpg" class="btn" style="width:120px; height:80px"></a>
                </div>
                <div style="text-align:center; display:inline-block;" id="no2" class="col-sm-12 col-xs-12 col-lg-12 col-md-12">

                    <ul class="nav navbar-nav navbar-bottom-font col-sm-12 col-xs-12 col-lg-12 col-md-12">
                        <li class="col-sm-2 col-xs-2 col-sm-offset-1 col-xs-offset-1">
                            <a href="#">꽃다발</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">꽃바구니</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">플랜트</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">디저트</a>
                        </li>
                        <li class="col-sm-2 col-xs-2">
                            <a href="#">카테고리</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <div class="collapse navbar-collapse">
                   
                        <ul class="nav navbar-nav navbar-right">
                        <%if(memberNum==null){ %>
                            <li>
                                <a href="<%=request.getContextPath()%>/views/mainPage/login.jsp">로그인</a>
                            </li>
                            <li>
                                <a href="#">회원가입</a>
                            </li>
                            <%}else{ %>
                            <li>
                                <a href="<%= request.getContextPath() %>/logout.me">로그아웃</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/infoMain.me">마이페이지</a>
                            </li>
                            <%} %>
                            <li>
                                <a href="#">장바구니</a>
                            </li>
                        </ul>
                    
                    <br><br><br><br>
                        <!-- <form class="navbar-form navbar-right" role="search" style="width:310px">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="검색">
                                <button type="submit" class="btn btn-default">검색</button>
                            </div>
                        </form> -->
                  
                </div>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    