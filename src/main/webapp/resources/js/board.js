/**
 * 
 */

console.log("board Module");
var boardService = (function(){
	
    var add = function(board, callback, error){
        console.log("add()...");
        $.ajax({
            url:"/board/register",
            type:"post",
            data:JSON.stringify(board),
            dataType:"json",
            contentType:"application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback) callback(result);
            },
            error :  function(xhr,status,er){
                if(error) error(er);
            }
        })
    }

    var getList = function(param, callback, error, before,after){
        var lastBno = param.lastBno || 99999999;
        var amount = param.amount || 9;
        console.log(param);
        console.log(lastBno);
        console.log(amount);
        console.log("getList()...");
        var url = "/board/pages/" + lastBno + "/" + amount
        $.ajax({
            url:url,
            type:"get",
            dataType:"json",
            beforeSend : function(){
            	if(before){
            		before()
            	}
            },
            success : function(result, status, xhr) {
                if(callback) {
                	callback(result);
                	
                }
                if(after){
                	after(result);
                }
            },
            error :  function(xhr,status,er){
                if(error) error(er);
            }
        })
    }

    var remove = function (bno, callback, error) {
        console.log("remove()...");
        $.ajax({
            url:'/board/' + bno,
            type:"delete",
            success : function(result, status, xhr) {
                if(callback) callback(result);
            },
            error :  function(xhr,status,er){
                if(error) error(er);
            }
        })
    }

    function update(board, callback, error) {
        console.log("update()...");
        $.ajax({
            url:"/board/" + board.bno,
            type:"put",
            data:JSON.stringify(board),
            contentType:"application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback) callback(result);
            },
            error :  function(xhr,status,er){
                if(error) error(er);
            }
        })
    }

    function get(rno, callback, error) {
        console.log("get()...");
        $.ajax({
            url:'/board/' + bno,
            type:"get",
            dataType:"json",
            success : function(result, status, xhr) {
                if(callback) callback(result);
            },
            error :  function(xhr,status,er){
                if(error) error(er);
            }
        })
    }

    function displayTime(timeValue) {
        console.log("displayTime()...");
        moment.locale('ko');
        return moment(timeValue).fromNow();

    }

    return {
        add: add,
        getList: getList,  
        remove: remove,
        get: get,
        update: update,
        displayTime: displayTime
    };
})();

