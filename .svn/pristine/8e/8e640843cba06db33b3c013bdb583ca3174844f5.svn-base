<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html class="no-js" lang="ko">

<head>
    <jsp:include page="../common/head.jsp"/>
</head>

<body>
    <jsp:include page="../common/nav.jsp"/>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs text-center">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Shop Grid</h1>
                        
                        <div class="single-widget condition ">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">
                                <label class="form-check-label" for="flexCheckDefault1">
                                    가전제품
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
                                <label class="form-check-label" for="flexCheckDefault2">
                                    가구
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3">
                                <label class="form-check-label" for="flexCheckDefault3">
                                    패션
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault4">
                                <label class="form-check-label" for="flexCheckDefault4">
                                    기타
                                </label>
                            </div>
                            
                            <div>
                            <sec:authorize access="isAuthenticated()">
                            	<a href="register"><button class="btn btn-secondary">글쓰기</button></a>
                            </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    <!-- Start Product Grids -->
    <section class="product-grids section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-12">
                    <div class="product-grids-head">
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                                aria-labelledby="nav-grid-tab">
                                <div class="row blist">
                                    <%-- <div class="col-lg-4 col-md-6 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="product-image">
                                                <img src="https://via.placeholder.com/335x335" alt="#">
                                                <div class="button">
	                                                <a href="get?bno=${board.bno}&category=${board.category}" class="product-info" style="opacity:0.4; ">
		                                                <p class="title">
		                                                    ${board.title}
		                                                <p>
	                                                    <p class="content">${board.content}</p>
	                                                	<div class="price">
	                                                    	<span>${board.price}원</span>
	                                                	</div>
	                                            	</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div> --%>
                                        <!-- End Single Product -->
                                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Product Grids -->

    <jsp:include page="../common/footer.jsp"/>
    <script src="/resources/js/board.js"></script>
    <script >
    	$(function () {
	    	var category = document.location.href.split("category=");
			console.log(category[1]);
			
    		// 단일 댓글 생성
			function getBoardStr(board){
    			var price = board.price + "";
				var str = "";
					if(category[1] == 1 && board.category == 1) {
						str += '<div class="col-lg-4 col-md-6 col-12" data-bno="' + board.bno +'">' ;
						str += '<div class="single-product">' ;
						str += '<div class="product-image">' ;
						str += '<img src="display?path='+ board.attachs[0].path +'&uuid='+ board.attachs[0].uuid +'">' ;
						str += '<div class="button">' ;
						str += '<a href="get?bno=' + board.bno + '&category=' + board.category + '" class="product-info" style="opacity:0.4;" >' ;
						str += '	<p class="title">' + board.title +'</p>' ;
						str += '	<p class="content">' + board.content +'</p>' ;
						str += '	<div class="price"><span>' + price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원</div>' ;
						str += '			</a>' ;
						str += '			</div>' ;
						str += '		</div>' ;
						str += '	</div>' ;
						str += '</div>' ;
					} else if(category[1] == 2 && board.category == 2) {
						console.log(board.category);
						str += '<tr class="blist" data-bno="' + board.bno +'">' ;
						str += '<td><a href="#">' + board.title +' </a></td>' ;
						str += '<td>' + board.writer + '</td>' ;
						str += '<td>' + board.regdate + '</td>' ;
						str += '</tr>' ;
					}
						
					return str;
			}
    		
    		// 목록 조회
			var lastBno;
			var amount; // undefinded
			

			function showList(lastBno, amount) {
				var param = {lastBno: lastBno, amount: amount}
				boardService.getList(param, function(result) {
					console.log(result);
					var str = '';
					for(var i in result){
						str += getBoardStr(result[i]);
						
					}
					$(".blist").html(str);
				})
			}
			showList(lastBno,amount);
    		
			// 무한 스크롤 이벤트
			$(document).scroll(function(){
				var dh = $(document).height();
				var wh = $(window).height();
				var wst = $(window).scrollTop();

				if(dh == wh + wst){
					var lastBno = $(".blist > .col-12").last().data("bno");
					var param = {lastBno:lastBno};

					boardService.getList(param, function(result) {
						var str = '';
						for(var i in result){
							str += getBoardStr(result[i]);
						}
						$(".blist").append(str);
					})
				}
			})
			
		});
    </script>
</body>

</html>