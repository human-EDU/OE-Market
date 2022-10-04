/**
 * 
 */
var tradeService = (function() {
	var get = function(cno, callback, error) {
		$.ajax({
			url:"/trade/" + cno,
			type:"get",
			dataType:"json",
			success : function(result, status, xhr) {
				if(callback) callback(result);
			},
			error : function(xhr, status, er) {
				if(error) error(er);
			}
		})
	}
	var setAmount = function(trno, price, callback, error) {
		$.ajax({
			url: "/trade/" + trno,
			type: "post",
			data:JSON.stringify(price),
			dataType:"json",
			contentType:"application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) callback(result);
			},
			error : function(xhr, status, er) {
				if(error) error(er);
			}
		})
	}
	var updateBuyerStatus = function(trno, callback, error) {
		$.ajax({
			url: "/trade/" + trno + "/updateBuyerStatus",
			type: "get",
			dataType:"json",
			success : function(result, status, xhr) {
				if(callback) callback(result);
			},
			error : function(xhr, status, er) {
				if(error) error(er);
			}
		})
	}
	var updateSellerStatus = function(trno, callback, error) {
		$.ajax({
			url: "/trade/" + trno + "/updateSellerStatus",
			type: "get",
			dataType:"json",
			success : function(result, status, xhr) {
				if(callback) callback(result);
			},
			error : function(xhr, status, er) {
				if(error) error(er);
			}
		})
	}
	
	var updateComplete = function(trno, callback, error) {
		$.ajax({
			url: "/trade/" + trno + "/updateComplete",
			type: "get",
			dataType:"json",
			success : function(result, status, xhr) {
				if(callback) callback(result);
			},
			error : function(xhr, status, er) {
				if(error) error(er);
			}
		})
	}
	
	var cancelTrade = function(trno, callback, error) {
		$.ajax({
			url: "/trade/" + trno + "/cancelTrade",
			type: "get",
			dataType:"json",
			success : function(result, status, xhr) {
				if(callback) callback(result);
			},
			error : function(xhr, status, er) {
				if(error) error(er);
			}
		})
	}
	
	
	function displayTime(timeValue) {
		moment.locale('ko');
		return moment(timeValue).fromNow();
	}		
	return {
		displayTime : displayTime,
		get : get,
		setAmount : setAmount,
		updateBuyerStatus : updateBuyerStatus,
		updateSellerStatus : updateSellerStatus,
		updateComplete : updateComplete,
		cancelTrade : cancelTrade
	};

})();