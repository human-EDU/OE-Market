<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.bundle.min.js" integrity="sha512-sH8JPhKJUeA9PWk3eOcOl8U+lfZTgtBXD41q6cO/slwxGHCxKcW45K4oPCUhHG7NMB4mbKEddVmPuTXtpbCbFA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css" integrity="sha512-Ez0cGzNzHR1tYAv56860NLspgUGuQw16GiOOp/I2LuTmpSK9xDXlgJz3XN4cnpXWDmkNBKXR/VDMTCnAaEooxA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<jsp:include page="../common/head.jsp"/>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="userId"/>
</sec:authorize>
<!-- Start Header Area -->
    <header class="header navbar-area">
        <!-- Start Topbar -->
        <div class="topbar">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-2 col-12">
                        <div class="top-left">
                        <a class="navbar-brand" href="/">
                            <h3 style="color: white">오-이 마켓</h3>
                        </a>
                        </div>
                    </div>
                    <div class="col-lg-10 col-md-10 col-12" >
                        <div class="top-end ">
	                        <div class="main-menu-search user col-13">
							</div>
						<div class="middle-right-area user">
                            <div class="navbar-cart">
                                <div class="cart-items">
                                    <a href="/chat/rooms" class="main-btn chatRooms">
                                        <i class="far fa-comments"></i>
                                        <span class="total-items">2</span>
                                    </a>
                                    <!-- Shopping Item -->
                                    <div class="shopping-item" style="width: 600px">
                                        <ul class="shopping-list room" style="float: left;">
                                        	
                                        </ul>
                                        <div style="float: left">
	                                    	<div class="chat" style="height: 270px; overflow: auto; color: #222; visibility: hidden">
								
											</div>
											<div class="chatRoom" style="visibility: hidden">
											
											</div>
                                        </div>
										<div style="color: black; visibility: hidden">
											<div class="trade" >
											</div>
											<div class="trade2" style="visibility: hidden">
												<input type="number" placeholder="금액을 입력" id="price" name="price">
												<button id="setAmount" type="button">입금</button>
											</div>
										</div>
                                        
                                        <div class="bottom">
                                            <div class="button">
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ End Shopping Item -->
                                </div>
                            </div>
                        </div>
                            <div class="user">
                                <i class="lni lni-user"></i>                       
                            </div>

                            <sec:authorize access="isAnonymous()">
                                <ul class="user-login">
                                    <li>
                                        <a href="/member/login">Login</a>
                                    </li>
                                    <li>
                                        <a href="/member/join">Join</a>
                                    </li>
                                </ul>
                            </sec:authorize>

                            <sec:authorize access="isAuthenticated()">
                                <ul class="user-login">
                                    <li>
                                        <a href="/member/profile/${userId}">profile</a>
                                    </li>
                                    <li>
                                        <a href="/member/mypage">mypage</a>
                                    </li>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <li>
                                            <a href="/member/admin">admin</a>
                                        </li>
                                    </sec:authorize>
                                    <li>
                                        <form action="/logout" method="post" onsubmit="return confirm('로그아웃하시겠습니까?')">
                                            <button>Logout</button>
                                        <sec:csrfInput/>
                                        </form>
                                    </li>
                                </ul>
                            </sec:authorize>

                            
                            <!-- Start Mega Category Menu -->
                        <div class="mega-category-menu user">
                            <span class="cat-button user"><i class="lni lni-menu"></i></span>
                            <ul class="sub-category ">
	                            <ul class="inner-sub-category">
	                                <li><a href="/board/list?category=1">판매 게시판</a></li>
	                                <li><a href="/board/list?category=2">구매 게시판</a></li>
	                                <li><a href="/board/list?category=3">자유 게시판</a></li>
	                                <li><a href="/board/list?category=4" >문의 게시판</a></li>
	                            </ul>
                            </ul>
                        </div>
                        <!-- End Mega Category Menu -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- End Topbar -->
        <!-- Start Header Middle -->
        <div class="header-middle">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-7 d-xs-none float- end">
                        <!-- Start Main Menu Search -->
                        <div class="main-menu-search">
                            <!-- navbar search start -->
                            <div class="navbar-search search-style-5">
                                <div class="search-select">
                                    <div class="select-position">
                                        <select id="select1">
                                            <option selected>All</option>
                                            <option value="1">option 01</option>
                                            <option value="2">option 02</option>
                                            <option value="3">option 03</option>
                                            <option value="4">option 04</option>
                                            <option value="5">option 05</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="search-input">
                                    <input type="text" placeholder="Search">
                                </div>
                                <div class="search-btn">
                                    <button><i class="lni lni-search-alt"></i></button>
                                </div>
                            </div>
                            <!-- navbar search Ends -->
                        </div>
                        <!-- End Main Menu Search -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header Middle -->
        <!-- End Header Middle -->
	<script src="/resources/js/chat.js"></script>
	<script src="/resources/js/trade.js"></script>
	<script src="/resources/js/board.js"></script>
	<script>
	var userId = '${userId}';
	var cno = 0;
	var str2 = '' 
		str2 += '<textarea rows="3" cols="30"></textarea>'
		str2 += '<button>전송</button>'
	var interval;
	var tradeInterval;
	$(function() {
		$(".chatRooms").click(function() {
			event.preventDefault();
			clearInterval(interval);
			if(userId) {
				$(".shopping-item").css("visibility", "visible");
				chattingService.getChatRooms(userId, function(result) {
					var str = '';
					str += '<li><button type="button" id="chatClose" style="border:none; background-color: white;">X</button></li>';
					for(var i in result) {
						console.log(str);
						console.log(result[i]);
						str += getChatRoomsStr(result[i]);
					}
					$(".room").html(str);
				})
			}
		})
		function getMessageStr(message) {
			var str = "";
			str += '<div id="cno" data-cno="' + message.cno + '">';
			str += '	<strong>' + message.userId + '</strong>';
			if(message.userId == userId) {
				str += '<p style="color: blue">' + message.message + '</p>';
			} else {
				str += '<p>' + message.message + '</p>';
			}
			str += '	<small>' + chattingService.displayTime(message.regDate) + '</small>';
			str += '</div>';
			str += '<hr>';
			return str;
		}
		function getChatRoomsStr(chatRooms) {
			var str = "";
			str += '<li>';
			str += '	<a data-cno="' +chatRooms.cno + '" href="rooms/' + chatRooms.cno + '">' + chatRooms.cno + ' || ' + chatRooms.masterId + '</a>';
			str += '</li>';
			str += '<hr>';
			return str;
		}
		function getTradeStr(trade) {
			console.log(trade.buyerStatus);
			var str = "";
			str += '<div id="trno" data-trno="' + trade.trno + '">';
			str += '	<strong>상품 가격 : ' + trade.price + ' 원</strong>';
			str += '	<strong class="amount">입금 금액 : ' + trade.amount + ' 원</strong>';
			if(trade.buyerId == userId) {
				str += '<p class="buyerPoint">' + trade.buyerPoint + ' 원 보유중</p>';
				str += '<label for="price"></label>';
				if(trade.buyerStatus) {
					str += '<button id="setAmount" type="button" disabled>입금 완료</button>';
				}
				str += '<hr>';
				if(trade.sellerStatus) {
					str += '<button type="button" style="color: red" readonly>판매자 거래확인 완료</button>';
				}else {				
					str += '<button type="button" readonly>판매자 거래확인 중</button>';
				}
			} else {
				str += '<hr>';
				if(trade.buyerStatus && !trade.sellerStatus) {
					str += '<button type="button" class="completeTrade">거래 확인</button>';
					str += '<button type="button" class="cancelTrade">거래 취소</button>';
				} else if(!trade.buyerStatus){
					str += '<p style="color: stealblue">판매자 입금 대기 중</p>';
				} else {
					str += '<p style="color: red">거래 완료</p>';
				}
			}
			str += '</div>';
			str += '<hr>';
			return str;
		}
		
		var j = 1;
		// 채팅창 활성화
		$(document).on("click", ".room a", function() {
			cno = $(this).data("cno");
			event.preventDefault();
			clearInterval(interval);
			tradeService.get(cno, function(result) {
				console.log(result.buyerStatus)
				if(userId == result.buyerId && !result.buyerStatus) $(".trade2").css("visibility", "visible");
			})
			interval = setInterval(function() {
				chattingService.getList(cno, function(result) {
					var str = '';
					for(var i in result) {
						str += getMessageStr(result[i]);
					}
					$(".chat").html(str);
		            $(".chat").scrollTop($(".chat")[0].scrollHeight);
				})				
			}, 1000);
			tradeInterval = setInterval(function() {
				tradeService.get(cno, function(result) {
					var str = '';
					str += getTradeStr(result);
					$(".trade").html(str);
				})
			}, 1000)
			$(".chat").css("visibility", "visible");
			$(".chatRoom").css("visibility", "visible");
			$(".trade").parent().css("visibility", "visible");
			$(".chatRoom").html(str2);

		})
		
		// 채팅 전송
		$(document).on("click", ".chatRoom button", function() {
			console.log(cno);
			var message = {cno : cno, userId : userId, message : $(".chatRoom textarea").val()}
			chattingService.add(message, function(result) {
				chattingService.get(cno, result, function(result) {
					$(".chat").append(getMessageStr(result));
				})
			})
			$(".chatRoom textarea").val('');
		})
		$(document).on("keydown", ".chatRoom textarea", function(keyNum){
			if(keyNum.keyCode == 13 && $(".chatRoom textarea").val()) { 
				event.preventDefault();
				$(".chatRoom button").click();
			}
		})

		
		// 채팅 닫기
		$(document).on("click", "#chatClose", function() {
			clearInterval(interval);
			clearInterval(tradeInterval);
			
			$(".chat").css("visibility", "hidden");
			$(".shopping-item").css("visibility", "hidden");
			$(".chatRoom").css("visibility", "hidden");
			$(".trade").css("visibility", "hidden");
			$(".trade2").css("visibility", "hidden");
		})
		
		var trno;
		var amount;
		// 구매자 가격 입력 후 입금
		$(document).on("click", "#setAmount", function() {
			trno = $("#trno").data("trno");
			amount = $("#price").val();
			console.log(trno);
			tradeService.setAmount(trno, amount, function(result) {
				if(result) {
					tradeService.updateBuyerStatus(trno, function(result) {
						if(result) {
							alert("입금이 완료되었습니다.");
							var str = '';
							str += getTradeStr(result);
							$(".trade").html(str);
							$(".trade2").css("visibility", "hidden");
						}
					})
				} else {
					alert("보유 포인트가 부족합니다.");
				}
			})
		})
		// 판매자 거래완료 버튼 클릭 시 거래 완료
		$(document).on("click", ".completeTrade", function() {
			trno = $("#trno").data("trno");
			tradeService.updateSellerStatus(trno, function(result) {
				var sellerId = result.sellerId;
				if(result) {
					tradeService.updateComplete(trno, function(result) {
						if(result) {
							alert("거래가 완료되었습니다.");
							console.log(sellerId);
							var str = '';
							str += getTradeStr(result);
							$(".trade").html(str);
							clearInterval(tradeInterval);
						}
					})
				} else {
					alert("재확인 요청")
				}
			})
		})
		
		$(document).on("click", ".cancelTrade", function() {
			trno = $("#trno").data("trno");
			tradeService.cancelTrade(trno, function(result) {
				if(result) {
					alert("거래를 취소하였습니다.")
				} else {
					alert("재확인 요청");
				}
			})
		})
	})
	</script>
    </header>
    <!-- End Header Area -->