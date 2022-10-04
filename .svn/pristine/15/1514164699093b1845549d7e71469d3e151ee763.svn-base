<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="../common/head.jsp"/>

    <style>
        .map_wrap {position:relative;width:100%;height:350px;}
        .title {font-weight:bold;display:block;}
        .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
        #centerAddr {display:block;margin-top:2px;font-weight: normal;}
        .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    </style>
</head>

<body>
    <jsp:include page="../common/nav.jsp"/>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">My page</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!--====== Checkout Form Steps Part Start ======-->

    <section class="checkout-wrapper section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="checkout-steps-form-style-1 mt-5">
                        <ul id="accordionExample">

                            <li>
                                <h6 class="title" data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                    aria-expanded="true" aria-controls="collapseThree">Member Personal Details
                                </h6>

                                <section class="checkout-steps-form-content collapse show" id="collapseThree"
                                    aria-labelledby="headingThree" data-bs-parent="#accordionExample">

                                    <form name="modify-form" method="post">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="single-form form-default">
                                                    <label>ID</label>
                                                    <div class="form-input form">
                                                        <input type="text" name="id" readonly value="${member.id}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form form-default">
                                                    <label>Password</label>
                                                    <div class="form-input form">
                                                        <input type="text" name="password">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form form-default">
                                                    <label>Nickname</label>
                                                    <div class="form-input form">
                                                        <input type="text" name="nickname" value="${member.nickname}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form form-default">
                                                    <label>Name</label>
                                                    <div class="form-input form">
                                                        <input type="text" name="name" value="${member.name}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form form-default">
                                                    <label>Resident Number</label>
                                                    <div class="form-input form">
                                                        <input type="text" name="resident" value="${member.resident}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form form-default">
                                                    <label>Point</label>
                                                    <div class="form-input form">
                                                        <input type="text" name="point" value="${member.point}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form form-default">
                                                    <label>Grade</label>
                                                    <div class="form-input form">
                                                        <input type="text" name="auth" value="${member.auths[0].auth}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <button class="btn btn-warning">Modify</button>
                                        <hr>
                                    </form>

                                    <div class="col-md-12">
                                        <div class="single-form button">
                                            <button class="btn" data-bs-toggle="collapse"
                                                data-bs-target="#collapseFour" aria-expanded="false"
                                                aria-controls="collapseFour">next
                                            </button>
                                        </div>
                                    </div>

                                </section>
                            </li>

                            <li>
                                <h6 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour"
                                    aria-expanded="false" aria-controls="collapseFour">Address</h6>
                                <section class="checkout-steps-form-content collapse" id="collapseFour"
                                    aria-labelledby="headingFour" data-bs-parent="#accordionExample">

                                    
                                    <div class="row">                                        
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Zipcode</label>
                                                <div class="form-input form">
                                                    <input type="text" value="${member.zipcode}" name="zipcode" id="zipcode" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Road Address</label>
                                                <div class="form-input form">
                                                    <input type="text" value="${member.roadAddress}" name="roadAddress" id="roadAddress" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Address</label>
                                                <div class="form-input form">
                                                    <input type="text" value="${member.address}" name="address" id="address" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Detail Address</label>
                                                <div class="form-input form">
                                                    <input type="text" value="${member.detailAddress}" name="detailAddress" id="detailAddress">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <!-- <label>latitude</label> -->
                                                <div class="form-input form">
                                                    <input type="hidden" value="${member.latitude}" name="latitude" id="latitude">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <!-- <label>longitude</label> -->
                                                <div class="form-input form">
                                                    <input type="hidden" value="${member.longitude}" name="longitude" id="longitude">
                                                </div>
                                            </div>
                                        </div>

                                        <button type="button" id="btnAddr" class="mb-3 mt-2 btn btn-sm btn-secondary">주소검색</button>

                                        <div id="map" style="width:500px;height:350px;margin: 10px auto; border:1px solid; display:none"></div> <!-- 지도틀 -->

                                        <hr>
                                        
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Bookmark List</label>
                                                <div class="select-items">
                                                    <select class="form-control">
                                                        <option value="0">Bookmark</option>
                                                        <option value="1">ADDR1</option>
                                                        <option value="2">ADDR2</option>
                                                        <option value="2">ADDR3</option>
                                                    </select>
                                                </div>

                                                <div class="btn-group">
                                                    <button class="btn btn-sm btn-secondary mt-3" type="button">Add</button>
                                                    <button class="btn btn-sm btn-secondary mt-3" type="button">Modify</button>
                                                    <button class="btn btn-sm btn-secondary mt-3" type="button">Remove</button>
                                                </div>

                                            </div>
                                            <hr>
                                        </div>
                                        

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                
                                                <div>
                                                    <button class="btn btn-sm btn-secondary mb-3" type="button">Address Search</button>
                                                </div>

                                                <div class="form-input form">
                                                    <input type="text">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Result</label>
                                                <div class="form-input form my-1">
                                                    <input type="text" readonly>
                                                </div>
                                                <div class="form-input form my-1">
                                                    <input type="text" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="steps-form-btn button">
                                                <button class="btn" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseThree" aria-expanded="false"
                                                    aria-controls="collapseThree">Prev
                                                </button>
                                                <button class="btn" data-bs-toggle="collapse"
                                                    data-bs-target="#collapsefive" aria-expanded="false"
                                                    aria-controls="collapseFour">next
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </li>

                            <li>
                                <h6 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapsefive"
                                    aria-expanded="false" aria-controls="collapsefive">Certification</h6>
                                <section class="checkout-steps-form-content collapse" id="collapsefive"
                                    aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="checkout-payment-form">
                                                <div class="single-form form-default">
                                                    <label>Account</label>
                                                    <div class="form-input form">
                                                        <input type="text" value="${member.account}" readonly>
                                                    </div>
                                                </div>
                                                <div class="single-form form-default">
                                                    <label>Phone Number</label>
                                                    <div class="form-input form">
                                                        <input type="text" value="${member.phone}" readonly>
                                                    </div>
                                                </div>
                                                <div class="single-form form-default">
                                                    <label>Email</label>
                                                    <div class="form-input form">
                                                        <input type="text" value="${member.email}" readonly>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="single-form button">
                                                        <button class="btn" data-bs-toggle="collapse"
                                                            data-bs-target="#collapseFour" aria-expanded="false"
                                                            aria-controls="collapseFour">prev
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </li>

                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!--====== Checkout Form Steps Part Ends ======-->

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53c384805130c9bc4f683d53b2fe930a&libraries=services"></script>

    <script>
        $("#btnAddr").click(function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    
                    new kakao.maps.services.Geocoder().addressSearch(data.roadAddress, function(result, status){
                        if(status === kakao.maps.services.Status.OK) {
                            $("#roadAddress").val(data.roadAddress);
                            $("#address").val(data.jibunAddress);
                            $("#zipcode").val(data.zonecode);
                            $("#latitude").val(result[0].y);	            		
                            $("#longitude").val(result[0].x);	
                                                        
                           $("#map").slideDown(200, function() {
                              var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = {
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                };  
                                var map = new kakao.maps.Map(mapContainer, mapOption);
                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
                               // 결과값으로 받은 위치를 마커로 표시합니다
                               var marker = new kakao.maps.Marker({
                                   map: map,
                                   position: coords
                               });
    
                               // 인포윈도우로 장소에 대한 설명을 표시합니다
                               var infowindow = new kakao.maps.InfoWindow({
                                   content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ data.roadAddress +'</div>'
                               });
                               infowindow.open(map, marker);
    
                               // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                               map.setCenter(coords);
    
                               var geocoder = new kakao.maps.services.Geocoder();
                            
                               kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                                    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                                        if (status === kakao.maps.services.Status.OK) {
                                            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                                            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                                            
                                            var content = '<div class="bAddr">' +
                                                            '<span class="title">법정동 주소정보</span>' + 
                                                            detailAddr + 
                                                        '</div>';
    
                                            // 마커를 클릭한 위치에 표시합니다 
                                            marker.setPosition(mouseEvent.latLng);
                                            marker.setMap(map);
    
                                            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                            infowindow.setContent(content);
                                            infowindow.open(map, marker);
                                            data.roadAddress = result[0].road_address;
                                                var coords = new kakao.maps.Coords(mouseEvent.latLng.La, mouseEvent.latLng.Ma);
                                                if(result[0].road_address) {
                                                    $("#roadAddress").val(result[0].road_address.address_name);
                                                    $("#zipcode").val(result[0].road_address.zone_no);
                                                    
                                                } else {
                                                    $("#roadAddress").val("");
                                                    $("#zipcode").val("");
                                                }
    
                                                 $("#address").val(result[0].address.address_name);
                                                    $("#latitude").val(coords.Ma);	            		
                                                    $("#longitude").val(coords.La);	
                                        }   
                                    });
                                });
    
                                function searchAddrFromCoords(coords, callback) {
                                    // 좌표로 행정동 주소 정보를 요청합니다
                                    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
                                }
    
                                function searchDetailAddrFromCoords(coords, callback) {
                                    // 좌표로 법정동 상세 주소 정보를 요청합니다
                                    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                                }
                           }); // 맵 관련 끝
                           
                        }
                    })
                }
            }).open();
    
        })
    </script>

	<jsp:include page="../common/footer.jsp"/>
</body>

</html>
