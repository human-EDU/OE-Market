<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">

<head>
    <jsp:include page="../common/head.jsp"/>
    <script src="/resources/assets/ckeditor/ckeditor.js"></script>
</head>

<body>
    <jsp:include page="../common/nav.jsp"/>

    <!-- Start Blog Singel Area -->
    <section class="section blog-single">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="single-inner">
                        <div class="post-details">
                            <div class="main-content-head imglist">
                            <form method="post">
                                <div class="meta-information">
                                    <h2 class="post-title">
                                        <a href="blog-single.html">${board.title}</a>
                                        <p>${user.nickname}</p>
                                    </h2>
                                    <!-- End Meta Info -->
                                    <ul class="meta-info">
                                        <li>
                                            <a href="/member/profile/${board.id}"> <i class="lni lni-user"></i> 
                                               ${board.writer}</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">
	                                            <i class="lni lni-calendar"></i>
	                                            <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)"><i class="lni lni-tag"></i> ${board.price}원</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)"><i class="fas fa-map-marker-alt">
                                            </i> ${board.distance == '0m' ? '본인게시물' : board.distance}</a>
                                        </li>
                                        <sec:authorize access="isAuthenticated() && principal.username != #board.id">
	                                        <c:if test="${!board.transcom}">
	                                        	<li>
	                                        		<button id="reqChat" style="border: none; background-color: white">채팅 요청</button>
	                                        	</li>
	                                        </c:if>
                                        </sec:authorize>
                                        <c:if test="${board.transcom}">
                                        	<li>
                                        		<p style="color: red">판매완료</p>
                                        	</li>
                                        </c:if>
                                    </ul>
                                    <!-- End Meta Info -->
                                </div>
                                <div class="detail-inner">
                                    <textarea id="pContent" readonly="readonly">${board.content}</textarea>
                                </div>
                                <div class="float-end">
                                <sec:authorize access="isAuthenticated() && principal.username == #board.id">
                                <a class="btn btn-warning btn-sm" href="modify?bno=${board.bno}">수정</a>
                                </sec:authorize>
                                <a class="btn btn-secondary btn-sm " href="list?category=${board.category}">목록</a>
                                </div>
                            </form>
                            </div>
                            <!-- Comments -->
                            
                            
                            <div class="card shadow mb-4">
		                        <div class="card-header py-3">
		                            <h6 class="m-0 font-weight-bold text-primary float-left">Files</h6>
		                        </div>
		                        <div class="card-body">
		                        	<ul class="list-group small container px-1 upload-files">
		                        	
									</ul>
									<div class="container pt-3 px-1">
										<div class="row thumbs">
										  				
										</div>
									</div>
		                        </div>
		                    </div>
                            
                            
                            <div>
                            </div>
                            <div class="post-comments">
                                <h3 class="comment-title"><span>Replies</span></h3>
                                <sec:authorize access="isAuthenticated()">
	                                <div class="input-group p-3 reply-register-area">
	                        			<textarea class="form-control" style="resize:none"></textarea>
                        				<button type="button" class="btn btn-secondary">댓글 작성</button>
	                        			<div class="input-group-append">
		                        		</div>
		                        	</div>
		                        </sec:authorize>	
                                <ul class="comments-list rlist">
                                
                                    <li>
										<div class="comment-desc rrlist" data-rno="1234">
											<div class="desc-top">
												<h6>작성자</h6>
												<span class="date">날짜</span>
												<a class="dropdown-item btn-reply-modify" href="#">수정</a>
												<a class="dropdown-item btn-reply-remove" href="#">삭제</a>
											</div>
											
											
						                    
											<div class="reply-content">
												<p style="white-space:pre-line">댓글</p>
											</div>
											
											<div class="reply-content">
												<p style="white-space:pre-line">댓글</p>
												<div class="input-group d-none">
													<textarea class="form-control rounded-0" style="resize:none"></textarea>
													<div class="input-group-append">'
														<button type="button" class="btn btn-warning rounded-0">수정</button>
													</div>
												</div>
											</div>
										</div>
									</li>
									
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Blog Singel Area -->
	<script src="/resources/js/chat.js"></script>
    <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="replyer"/>
	</sec:authorize>
    <script src="/resources/js/reply.js"></script>
	<script>
	var bno ='${board.bno}'
	var replyer = '${replyer}';
	var headerName = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");	
	var masterId = '${board.id}';
	/* $(document).ajaxSend(function(e, xhr) {
	xhr.setRequestHeader(headerName, token);
	})  */
		$(function () {
			$("#reqChat").click(function() {
				event.preventDefault();
				console.log(replyer)
				console.log(masterId)
				console.log(bno)
				var chatRoom = {userId : replyer, masterId : masterId, bno : bno}
				if(replyer) {
					chattingService.check(chatRoom, function(result) {
						console.log(result)
					})
				} else {
					alert('로그인이 필요한 서비스 입니다.')
				}
			})
			// 단일 댓글 생성
			function getReplyStr(reply){
				var str = "";
				
					str += '	<li>' ;
					str += '		<div class="comment-desc rrlist" data-rno="' + reply.rno +'" data-bno="' + reply.bno +'">' ;
					str += '			<div class="desc-top">' ;
					str += '				<h6>'+ reply.writer +'</h6>' ;
					str += '				<span class="date">' + replyService.displayTime(reply.regDate) +'</span>' ;
					
					if(replyer && reply.writer == replyer){
						
						str += '				<div class="float-end">' ;
						str += '				<a class="btn-reply-modify" href="#">수정</a>' ;
						str += '				<a class="btn-reply-remove" href="#">삭제</a>' ;
						str += '				</div>' ;
					}
					
					str += '			</div>' ;
					str += '			<div class="reply-content">' ;
					str += '				<h3 class="text-secondary">'+ reply.reply +'</h3>' ;
					str += '				<div class="input-group d-none">' ;
					str += '					<textarea class="form-control rounded-0" style="resize:none"></textarea>' ;
					str += '					<div class="input-group-append">' ;
					str += '					</div>' ;
					str += '						<button type="button" class="btn btn-secondary rounded-0">수정</button>' ;
					str += '				</div>' ;
					str += '			</div>' ;
					str += '		</div>' ;
					str += '	</li>' ;
					return str;
			}

			// 목록 조회
			var lastRno;
			var amount; // undefinded
			function showList(lastRno, amount) {
				var param = {bno:bno, lastRno: lastRno, amount: amount}
				replyService.getList(param, function(result) {
					var str = '';
					for(var i in result){
						str += getReplyStr(result[i]);
						
					}
					$(".rlist").html(str);
				})
			}
			showList(lastRno,amount);
			
			// 무한 스크롤 이벤트
			$(document).scroll(function(){
				var dh = $(document).height();
				var wh = $(window).height();
				var wst = $(window).scrollTop();

				if(dh == wh + wst){
					var lastRno = $(".rrlist").last().data("rno");
					var param = {bno:bno,lastRno:lastRno,amount: amount};
					console.log(lastRno);
					replyService.getList(param, function(result) {
						var str = '';
						for(var i in result){
							str += getReplyStr(result[i]);
							
							
						}
						$(".rlist").append(str);
					})
				}
				// console.log(dh,wh,wst);
			})
			
			// 이벤트
			$(".reply-register-area button").click(function() {
				var replyContent = $(".reply-register-area textarea").val();
				if(replyContent.trim().length == 0) {
					alert("댓글 내용을 작성하세요");
					$(".reply-register-area textarea").focus();
					return;
				}

				var reply = {bno:bno, reply:$(".reply-register-area textarea").val(), writer: replyer };
				replyService.add(reply, function(result) {
					alert("글 등록 성공");
					console.log(result); // 글 번호

					replyService.get(result, function(result) {
						// alert("글 조회 성공");
						console.log(result); // reply object
						$(".rlist").prepend(getReplyStr(result)); // 댓글 목록 자식 태그중 가장 첫번째 순서에 추가
					})
				});
			});
			
			// 댓글 삭제
			$(".rlist").on("click",".btn-reply-remove", function(){
					event.preventDefault();
					var $dom = $(this).closest(".rrlist");
					var rno = $dom.data("rno");
					replyService.remove(rno, function(result) {
						alert("글 삭제 성공");
						console.log(result);
						$dom.next().remove();
						$dom.remove();
				})
			}); 
			// 댓글 수정기능 활성화
			$(".rlist").on("click",".btn-reply-modify", function(){
					event.preventDefault();
					var $dom = $(this).closest(".rrlist");
					var rno = $dom.data("rno");
					
					$(".reply-content > p").show();
					$(".reply-content > div").addClass("d-none");

					$dom.find("p").hide();
					$dom.find("div").find("textarea").val($dom.find("p").text()).end().removeClass("d-none");
					
					
			}); 


			// 댓글 수정 반영
			$(".rlist").on("click",".reply-content button", function(){
				var $replyContent = $(this).closest(".reply-content");
				var $dom = $(this).closest(".rrlist");
				var bno = $dom.data("bno");
				var rno = $dom.data("rno");
				/* var rno = $replyContent.prev().data("rno"); */
				var content = $replyContent.find("textarea").val();
				var reply = {rno:rno, reply:content};
				
				console.log("$replyContent= "+$replyContent);
				console.log("rno= "+rno);
				console.log("bno= "+bno);
				console.log("content= "+content);
				console.log("reply= "+reply);
				

				replyService.update(reply,function(result) {
					// 성공
					$replyContent.find("p").text(content).show();
					$replyContent.find("div").addClass("d-none");
					
				});
			});

			// 첨부된 파일의 확인
			var showFiles = function() {
				$.getJSON("/board/attachs", {bno:bno})
				.done(function(result) {
					console.log ("1" + result)
					
					var str = "";
					var thumbStr = "";
					for(var i in result) {
						console.log("result[]" + result[i]);
						console.log("param = " + $.param(result[i]));
						str += '<li class="list-group-item" data-uuid="' + result[i].uuid + '" data-path="' + result[i].path + '" data-image="' + result[i].image + '" data-origin="' + result[i].origin + '">'
							+result[i].origin+'</a></li>';
						if(result[i].image) {
							var o = {...result[i]}; // clone
							o.uuid = 's_' + o.uuid;
							thumbStr += '<div class="col-6 col-sm-4 col-lg-3 col-xl-2" data-uuid="' + result[i].uuid + '" data-path="' + result[i].path + '" data-image="' + result[i].image + '" data-origin="' + result[i].origin + '">';
							thumbStr += '	<figure class="d-inline-block " style="position:relative; ">';
							thumbStr += '		<figcaption></figcaption> ';
							thumbStr += '		<a href="/board/display?'+ $.param(result[i]) + '" data-lightbox="img" data-title="' + o.origin + '"><img alt="" src="/board/display?path='+ result[i].path + '&uuid=s_'+ result[i].uuid + '" class="mx-1 my-2 img-thumbnail"></a>';
							thumbStr += '	</figure>';
							thumbStr += '</div>';
						}
					}
					$(".upload-files").append(str);
					$(".thumbs").append(thumbStr);
				})
			}
			
			showFiles();
			
			lightbox.option({
			    resizeDuration: 200,
			    wrapAround: true,
			    imageFadeDuration: 100
			})

			CKEDITOR.replace('pContent')

		});
	</script>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <jsp:include page="../common/footer.jsp"/>
</body>

</html>