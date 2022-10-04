<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="../common/head.jsp"/>
</head>

<body>
    <jsp:include page="../common/nav.jsp"/>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Profile</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start About Area -->
    <section class="about-us">
        <div class="container">
            <div class="row align-items-center">
                <div class="mt-3">
                    <h2>${member.nickname} (${member.id})</h2>
                    <sec:authorize access="isAuthenticated() && principal.username == #member.id">
                    	<h4>보유 포인트 : ${member.point}</h4>
                    </sec:authorize>
                    <h4>${member.address}</h4>
                    <hr>
                </div>
            </div>
        </div>
    </section>
    <!-- End About Area -->

    <!-- Start Team Area -->
    <section class="team section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp mt-3" data-wow-delay=".4s">Activity</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Team -->
                    <div class="single-team">
                        <h2 class="counter">${member.completeDeal}</h2>
                        <div class="content">
                            <div class="info">
                                <h3>Complete Deal</h3>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Team -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Team -->
                    <div class="single-team">
                        <h2 class="counter" id="score">${score}</h2>
                        <div class="content">
                            <div class="info">
                                <h3>Score</h3>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Team -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Team -->
                    <div class="single-team">
                        <h2 class="counter" id="post">${post}</h2>
                        <div class="content">
                            <div class="info">
                                <h3>History</h3>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Team -->
                </div>
            </div>
        </div>
    </section>
    <!-- End Team Area -->

	<jsp:include page="../common/footer.jsp"/>

    <script>
        $(function() {
            $('.counter').each(function () {
                $(this).prop('Counter',0).animate({
                Counter: $(this).text()}, {
                    duration: 4000, 
                    easing: 'swing', 
                    step: function (now) {
                        $(this).text(Math.ceil(now));
                    }
                });
            });
        });
    </script>
</body>

</html>
