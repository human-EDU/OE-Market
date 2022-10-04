<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022. 5. 2.오후 11:24:01</title>
	<jsp:include page="../common/head.jsp"/>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<div>
		<div>
			<ul class="room">
				<c:forEach items="${rooms}" var="r">
				<li>
					<a data-cno="${r.cno}" href="rooms/${r.cno}">${r.cno} || ${r.masterId} || ${r.unReadCount}</a>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="chat">
		
		</div>
		<div class="chatRoom">
		
		</div>	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="userId"/>
	</sec:authorize>
	<script src="/resources/js/chat.js"></script>
	<script>
	var userId = '${userId}';
	var cno = 0;
	var str2 = '' 
		str2 += '<textarea rows="3" cols="30"></textarea>'
		str2 += '<button>전송</button>'
	$(function() {
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
			return str;
		}
		
		// 채팅창 활성화
		$(".room a").click(function() {
			cno = $(this).data("cno");
			event.preventDefault();
			setInterval(function() {
				chattingService.getList(cno, function(result) {
					console.log(result);
					var str = '';
					for(var i in result) {
						console.log(result[i].userId)
						str += getMessageStr(result[i]);
					}
					$(".chat").html(str);
				})				
			}, 1000);

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
	})
	</script>
</body>
</html>