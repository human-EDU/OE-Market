<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
                                    <div>
                                    	<label for="title">title</label>
                                        <input type="text" class="form-control" placeholder="title" id="title" name="title" value="${board.title}">
                                    </div>
                                    <div >
                                        <label for="category">게시판</label>
                                        <div class="select-position">
	                                      <select id="select" name="category">
	                                          <option value="1">판매게시판</option>
	                                          <option value="2">구매게시판</option>
	                                          <option value="3">문의게시판</option>
	                                      </select>
                                		</div>
                                    </div>
                                    <div >
                                        <label for="pno">제품분류</label>
                                        <div class="select-position">
	                                      <select id="select2" name="pno">
	                                          <option value="1">전자제품</option>
	                                          <option value="2">가구</option>
	                                          <option value="3">패션</option>
	                                          <option value="4">기타</option>
	                                      </select>
                                		</div>
                                    </div>
                                    <div >
                                    	<label for="price">price</label>
				    					<input type="text" class="form-control" placeholder="price" id="price" name="price" value="${board.price}">
                                    </div>
                                </div>
                                <div class="detail-inner">
                                	<label for="content">content</label>
                                    <textarea id="pContent" name="content" >${board.content}</textarea>
                                </div>
                                <input type="hidden" name="bno" value="${board.bno}">
                                <input type="hidden" id="id" name="id" value='<sec:authentication property="principal.username"/>'>
                                <input type="hidden" id="writer" name="writer" value="${board.writer}">
                                <div class="float-end">
                                <security:authorize access="isAuthenticated() && principal.username == #board.id">
                                <button type="submit" class="btn btn-warning btn-sm" formaction="modify" id="btnMod">수정</button>
								<button type="submit" class="btn btn-danger btn-sm" formaction="remove">삭제</button>
								<security:csrfInput/>
								</security:authorize>
                                <a class="btn btn-secondary btn-sm" href="list?category=${board.category}">목록</a>
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
		                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Blog Singel Area -->

	<script>
		$(function() {
			
			lightbox.option({
			    resizeDuration: 200,
			    wrapAround: true,
			    imageFadeDuration: 100
			})
			
			var bno = '${board.bno}';
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
			
			var showFiles = function(post) {
				var ajaxObj = {
						url: "/board/attachs",
						data : {bno:bno},
						method:'get',
						dataType:'json'
					};
				if(post){
					var formData = new FormData();
					
					for(var i in post.files) {
						if(!validateFiles(post.files[i].name, post.files[i].size)) {
							return false;
						}
						formData.append("files", post.files[i]);
					}
					console.log(post.files);
					ajaxObj.processData = false;
					ajaxObj.contentType = false;
					ajaxObj.data = formData;
					ajaxObj.method = "post"
					ajaxObj.url = '/board/upload';
				}
				
				$.ajax(ajaxObj)
				.done(function(result) {
					console.log(result);
					$(".uploadDiv").html($clone.html());
					var str = "";
					var thumbStr = "";
					for(var i in result) {
						// object >> queryString
						// result[i]
						console.log(result[i]);
						console.log($.param(result[i]));
						str += getAttachStr(result[i]);
						if(result[i].image){
							thumbStr += getThumbStr(result[i])
						}
					}
					$(".upload-files").append(str);
					$(".thumbs").append(thumbStr);
				})
			}
			showFiles();
			
			$(".uploadDiv").on("change", ":file", function() {
				showFiles(this);
			})
			
			// 파일 삭제 이벤트
			$(".upload-files, .thumbs").on("click", ".close", function() {
				var $dom = $(this).closest("[data-uuid]");
				var uuid = $dom.data("uuid");
				$("[data-uuid='" + uuid + "']").remove();
			});
			
			function getAttachStr(attach){
				var str = "";
				str += '<li class="list-group-item" data-uuid="' + attach.uuid + '" data-path="' + attach.path + '" data-image="' + attach.image + '" data-origin="' + attach.origin + '"><a href="/download?' + $.param(attach) + '">'
				 + attach.origin + '</a><button type="button" class="close"><span>&times;</span></button></li>';
				return str;
			}
			
			function getThumbStr(attach){
				var str = "";
				var o = {...attach};
				o.uuid = 's_' + o.uuid;
				str += '<div class="col-12 col-sm-6 col-xl-2 col-lg-3" data-uuid="' + attach.uuid + '" data-path="' + attach.path + '" data-image="' + attach.image + '" data-origin="' + attach.origin + '">';
				str += '	<figure class="d-inline-block" style="position:relative;">';
				str += '		<figcaption><button type="button" class="close" style="position:absolute; top:15px; right:8px"><span>&times;</span></button></figcaption>';
				str += '		<a href="/board/display?'+ $.param(attach) + '" data-lightbox="img" data-title="' + o.origin + '"><img alt="" src="/board/display?path='+ attach.path + '&uuid=s_'+ attach.uuid + '" class="mx-1 my-2 img-thumbnail"></a>';
				str += '	</figure>';
				str += '</div>';
				return str;
			}
			// 게시글 등록 이벤트
			$("#btnMod").click(function() {
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
    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <jsp:include page="../common/footer.jsp"/>
</body>

</html>