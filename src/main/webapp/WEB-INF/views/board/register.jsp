<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            <div class="main-content-head">
                                <form method="post">
                                <div class="meta-information">
                                    <!-- End Meta Info -->
                                    <div class="meta-info">
	                                    <div >
	                                        <label for="title">title</label>
								    		<input type="text" class="form-control" placeholder="title" id="title" name="title">
	                                    </div >
                                        <div >
                                            <label for="category">게시판</label>
                                            <div class="select-position">
		                                        <select id="select1" name="category">
		                                            <option value="1">판매게시판</option>
		                                            <option value="2">구매게시판</option>
		                                            <option value="3">문의게시판</option>
		                                        </select>
                                    		</div>
                                        </div>
                                        <div >
                                            <label for="pno">제품분류</label>
                                            <div class="select-position">
		                                        <select id="select1" name="pno">
		                                            <option value="1">전자제품</option>
		                                            <option value="2">가구</option>
		                                            <option value="3">패션</option>
		                                            <option value="4">기타</option>
		                                        </select>
                                    		</div>
                                        </div>
                                        <div >
                                            <label for="price">price</label>
							    			<input type="text" class="form-control" placeholder="price" id="price" name="price">
                                        </div>
							    			
                                    </div>
                                    <!-- End Meta Info -->
                                </div>
                                <div class="detail-inner">
                                    <label for="content">content</label>
							    	<textarea  class="form-control" placeholder="content" id="pContent" name="content"></textarea>
                                </div>
                                <div class="form-group uploadDiv">
						    		<label for="attach" class="btn btn-success btn-sm">첨부</label>
						   			<input type="file" class="form-control d-none" placeholder="attach" id="attach" name="attach" multiple>
						  		</div>
						  		<ul class="list-group small container px-1 upload-files">
							  	</ul>
							  	<div class="container pt-3 px-1">
							    	<div class="row thumbs">
							    				
							  		</div>
							 	</div>
						  		
                                <input type="hidden" class="form-control"  id="id" name="id" value='<sec:authentication property="principal.username"/>'>
                                <input type="hidden" class="form-control"  id="writer" name="writer" value="${user.nickname}">
                                
                                <div>
                                <sec:csrfInput/>
                                <button class="btn btn-secondary btn-sm" type="submit" id="btnReg">글등록</button>
                                <a class="btn btn-secondary btn-sm" href="list">목록</a>
                                </div>
                                </form>
                            </div>
                            <!-- Comments -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Blog Singel Area -->

	
    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <jsp:include page="../common/footer.jsp"/>
    <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="userId"/>
	</sec:authorize>
	<script>
		$(function() {
			var category = document.location.href.split("category=");
			console.log(category);
			lightbox.option({
			    resizeDuration: 200,
			    wrapAround: true,
			    imageFadeDuration: 100
			})
			var $clone = $(".uploadDiv").clone();
			
			var regexp = /(.*?)\.(exe|sh|js|jsp)$/;
			var maxSize = 1024 * 1024 * 5;
			
			function validateFiles(fileName, fileSize) {
				if(fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				if(regexp.test(fileName)) {
					alert("해당 파일의 종류는 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			
			// 파일 첨부
			$(".uploadDiv").on("change", ":file", function() {
				var formData = new FormData();
				
				for(var i in this.files) {
					if(!validateFiles(this.files[i].name, this.files[i].size)) {
						return false;
					}
					formData.append("files", this.files[i]);
				}
				
				$.post({
					processData : false,
					contentType : false,
					data : formData,
					url : "/board/upload",
					dataType : "json"
				}).done(function(result) {
					console.log("re"+result);
					$(".uploadDiv").html($clone.html());
					var str = "";
					var thumbStr = "";
					for(var i in result) {
						console.log("result"+result[i]);
						console.log("result22"+$.param(result[i]));
						str += '<li class="list-group-item" data-uuid="' + result[i].uuid + '" data-path="' + result[i].path + '" data-image="' + result[i].image + '" data-origin="' + result[i].origin + '">'
							+result[i].origin+'</a><button type="button" class="close"><span>&times;</span></button></li>';
						if(result[i].image) {
							var o = {...result[i]}; // clone
							o.uuid = 's_' + o.uuid;
							thumbStr += '<div class="col-6 col-sm-4 col-lg-3 col-xl-2" data-uuid="' + result[i].uuid + '" data-path="' + result[i].path + '" data-image="' + result[i].image + '" data-origin="' + result[i].origin + '">';
							thumbStr += '	<figure class="d-inline-block " style="position:relative; ">';
							thumbStr += '		<figcaption><button type="button" class="close" style="position: absolute; top: 15px; right:8px"><span>&times;</span></button></figcaption> ';
							thumbStr += '		<a href="/board/display?'+ $.param(result[i]) + '" data-lightbox="img" data-title="' + o.origin + '"><img alt="" src="/board/display?path='+ result[i].path + '&uuid=s_'+ result[i].uuid + '" class="mx-1 my-2 img-thumbnail"></a>';
							thumbStr += '	</figure>';
							thumbStr += '</div>';
						}
					}
					$(".upload-files").append(str);
					$(".thumbs").append(thumbStr);
				})
			})
			// 파일 첨부 종료
			
			// 파일 삭제 이벤트
			$(".upload-files, .thumbs").on("click", ".close", function() {
				var $dom = $(this).closest("[data-uuid]");
				var uuid = $dom.data("uuid");
				var image = $dom.data("image");
				var path = $dom.data("path");
				console.log(uuid);
				$.post({
					url : "/board/deleteFile",
					data : {uuid:uuid, path:path, image:image},
					success : function(result) {
						console.log(result);
						$("[data-uuid='" + uuid + "']").remove();
					}
				})
			});
	
			// 게시글 등록 이벤트
			$("#btnReg").click(function() {
				event.preventDefault();
				var str = "";
				var attrArr = ['origin', 'uuid', 'path','bno','image'];
				$(".upload-files li").each(function(i) {
					for(var j in attrArr) {
						str += 
							$("<input>")
							.attr("type", "hidden")
							.attr("name", "attachs[" + i + "]." + attrArr[j])
							.attr("value", $(this).data(attrArr[j])).get(0).outerHTML + "\n";
					}
				});
				console.log(str);
				$(this).closest("form").append(str).submit();
			});
			
			CKEDITOR.editorConfig = function(config) {
				
	
	
	
			} 
			CKEDITOR.replace('pContent', {
				enterMode : CKEDITOR.ENTER_BR,
				shiftEnterMode : CKEDITOR.ENTER_P,
				filebrowserUploadUrl : "/board/ckupload.json"
			})
		})
	</script>
</body>

</html>