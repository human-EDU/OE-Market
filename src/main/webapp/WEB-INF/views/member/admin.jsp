<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

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
                        <h1 class="page-title">Admin</h1>
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
                                    aria-expanded="true" aria-controls="collapseThree">Member
                                </h6>

                                <section class="checkout-steps-form-content collapse show" id="collapseThree"
                                    aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <!-- ${member} -->

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="single-form form-default">
                                                    <label>Member List</label>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-hover table-sm">
                                                            <thead>
                                                                <tr class="table-secondary">
                                                                    <!-- <th>State</th> -->
                                                                    <th>ID</th>
                                                                    <th>Nickname</th>
                                                                    <th>Point</th>
                                                                    <th>Name</th>
                                                                    <th>Resident</th>
                                                                    <th>Phone</th>
                                                                    <th>Account</th>
                                                                    <th>Email</th>
                                                                    <th>Zipcode</th>
                                                                    <th>RoadAddress</th>
                                                                    <th>Address</th>
                                                                    <th>DetailAddress</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${member}" var="m">
                                                                <tr>
                                                                	<!-- <c:if test="${m.enabled == false}">
                                                                    <td>정상 회원</td>
                                                                	</c:if>
                                                                	<c:if test="${m.enabled == true}">
                                                                    <td>정지된 회원</td>
                                                                	</c:if> -->
                                                                    <!-- <td>${m.enabled}</td> -->
                                                                    <td>${m.id}</td>
                                                                    <td>${m.nickname}</td>
                                                                    <td>${m.point}</td>
                                                                    <td>${m.name}</td>
                                                                    <td>${m.resident}</td>
                                                                    <td>${m.phone}</td>
                                                                    <td>${m.account}</td>
                                                                    <td>${m.email}</td>
                                                                    <td>${m.zipcode}</td>
                                                                    <td>${m.roadAddress}</td>
                                                                    <td>${m.address}</td>
                                                                    <td>${m.detailAddress}</td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>    
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form form-default">
                                                    <label>Member Auth List</label>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered table-hover table-sm">
                                                            <thead>
                                                                <tr class="table-secondary">
                                                                    <th>ID</th>
                                                                    <th>Auth</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${auth}" var="a">
                                                                <tr>
                                                                    <td>${a.id}</td>
                                                                    <c:if test="${a.auth == 'ROLE_MEMBER'}">
                                                                    <td>Member</td>
                                                                    </c:if>
                                                                    <c:if test="${a.auth == 'ROLE_MANAGER'}">
                                                                    <td>Manager</td>
                                                                    </c:if>
                                                                    <c:if test="${a.auth == 'ROLE_ADMIN'}">
                                                                    <td>Admin</td>
                                                                    </c:if>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>    
                                                </div>
                                            </div>

                                            <form name="moidfy-auth" method="post">
                                                <div class="col-md-12">
                                                    <div class="single-form form-default">
                                                        <label>Auth Modify</label>
                                                        <select class="form-select form-select-sm" name="auth">
                                                            <option>변경할 등급을 선택하세요</option>
                                                            <option value="ROLE_MEMBER">Member</option>
                                                            <option value="ROLE_MANAGER">Manager</option>
                                                        </select>
                                                        <div class="form-input form mt-3">
                                                            <input type="text" name="id" placeholder="등급을 변경할 회원의 id를 입력하세요">
                                                        </div>
                                                        <button type="submit" class="btn btn-sm btn-warning mt-3" formaction="modify">modify</button>
                                                    </div>
                                                </div>
                                            </form>
                                            
                                            <form name="delete-member" method="post">
                                                <div class="col-md-12 mt-4">
                                                    <div class="single-form form-default">
                                                        <label>Auth Deactivate</label>
                                                        <div class="form-input form">
                                                            <input type="text" name="id" placeholder="활동정지할 회원의 id를 입력하세요">
                                                        </div>
                                                        <button type="submit" class="btn btn-sm btn-danger my-3" formaction="remove">deactivate</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>

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
                                    aria-expanded="false" aria-controls="collapseFour">Board</h6>
                                <section class="checkout-steps-form-content collapse" id="collapseFour"
                                    aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Post List</label>
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-sm">
                                                        <thead>
                                                            <tr class="table-secondary">
                                                                <th>Select</th>
                                                                <th>bno</th>
                                                                <th>title</th>
                                                                <th>content</th>
                                                                <th>id</th>
                                                                <th>writer</th>
                                                                <th>category</th>
                                                                <th>regDate</th>
                                                                <th>transcom</th>
                                                                <th>pno</th>
                                                                <th>price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>01</td>
                                                                <td>A</td>
                                                                <td>abcede</td>
                                                                <td>John</td>
                                                                <td>Doe</td>
                                                                <td>판매</td>
                                                                <td>20220511</td>
                                                                <td>완료</td>
                                                                <td>001</td>
                                                                <td>10000</td>
                                                            </tr>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>02</td>
                                                                <td>B</td>
                                                                <td>abcede</td>
                                                                <td>Mary</td>
                                                                <td>Moe</td>
                                                                <td>구매</td>
                                                                <td>20220511</td>
                                                                <td>미완료</td>
                                                                <td>002</td>
                                                                <td>10000</td>
                                                            </tr>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>03</td>
                                                                <td>C</td>
                                                                <td>abcede</td>
                                                                <td>July</td>
                                                                <td>Dooley</td>
                                                                <td>구매</td>
                                                                <td>20220511</td>
                                                                <td>미완료</td>
                                                                <td>003</td>
                                                                <td>10000</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div> 
                                            </div>
                                        </div>
                                        
                                        <div>
                                            <button class="btn btn-sm btn-danger mb-3" id="post-remove">Post Remove</button>
                                        </div>

                                        <hr>

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Review List</label>
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-sm">
                                                        <thead>
                                                            <tr class="table-secondary">
                                                                <th>Select</th>
                                                                <th>rno</th>
                                                                <th>reply</th>
                                                                <th>writer</th>
                                                                <th>bno</th>
                                                                <th>regDate</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>01</td>
                                                                <td>abcede</td>
                                                                <td>John</td>
                                                                <td>01</td>
                                                                <td>20220511</td>
                                                            </tr>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>02</td>
                                                                <td>abcede</td>
                                                                <td>Mary</td>
                                                                <td>02</td>
                                                                <td>20220511</td>
                                                            </tr>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>03</td>
                                                                <td>abcede</td>
                                                                <td>July</td>
                                                                <td>03</td>
                                                                <td>20220511</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div> 
                                            </div>
                                        </div>
                                        
                                        <div>
                                            <button class="btn btn-sm btn-danger mb-3" id="review-remove">Post Review</button>
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
                                    aria-expanded="false" aria-controls="collapsefive">Trade</h6>
                                <section class="checkout-steps-form-content collapse" id="collapsefive"
                                    aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Trade Complete List</label>
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-sm">
                                                        <thead>
                                                            <tr class="table-secondary">
                                                                <th>Select</th>
                                                                <th>bno</th>
                                                                <th>title</th>
                                                                <th>content</th>
                                                                <th>id</th>
                                                                <th>writer</th>
                                                                <th>category</th>
                                                                <th>regDate</th>
                                                                <th>transcom</th>
                                                                <th>pno</th>
                                                                <th>price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>01</td>
                                                                <td>A</td>
                                                                <td>abcede</td>
                                                                <td>John</td>
                                                                <td>Doe</td>
                                                                <td>판매</td>
                                                                <td>20220511</td>
                                                                <td>완료</td>
                                                                <td>001</td>
                                                                <td>10000</td>
                                                            </tr>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>02</td>
                                                                <td>B</td>
                                                                <td>abcede</td>
                                                                <td>Mary</td>
                                                                <td>Moe</td>
                                                                <td>구매</td>
                                                                <td>20220511</td>
                                                                <td>완료</td>
                                                                <td>002</td>
                                                                <td>10000</td>
                                                            </tr>
                                                            <tr>
                                                                <td><input type="checkbox" name="check-delete"></td>
                                                                <td>03</td>
                                                                <td>C</td>
                                                                <td>abcede</td>
                                                                <td>July</td>
                                                                <td>Dooley</td>
                                                                <td>구매</td>
                                                                <td>20220511</td>
                                                                <td>완료</td>
                                                                <td>003</td>
                                                                <td>10000</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div> 
                                            </div>
                                        </div>
                                        
                                        <div>
                                            <button class="btn btn-sm btn-danger mb-3" id="trans-post-remove">Post Remove</button>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>Trade Information</label>
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-sm">
                                                        <thead>
                                                            <tr class="table-secondary">
                                                                <th>bno</th>
                                                                <th>title</th>
                                                                <th>content</th>
                                                                <th>id</th>
                                                                <th>writer</th>
                                                                <th>category</th>
                                                                <th>regDate</th>
                                                                <th>transcom</th>
                                                                <th>pno</th>
                                                                <th>price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>01</td>
                                                                <td>A</td>
                                                                <td>abcede</td>
                                                                <td>John</td>
                                                                <td>Doe</td>
                                                                <td>판매</td>
                                                                <td>20220511</td>
                                                                <td>완료</td>
                                                                <td>001</td>
                                                                <td>10000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>02</td>
                                                                <td>B</td>
                                                                <td>abcede</td>
                                                                <td>Mary</td>
                                                                <td>Moe</td>
                                                                <td>구매</td>
                                                                <td>20220511</td>
                                                                <td>완료</td>
                                                                <td>002</td>
                                                                <td>10000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>03</td>
                                                                <td>C</td>
                                                                <td>abcede</td>
                                                                <td>July</td>
                                                                <td>Dooley</td>
                                                                <td>구매</td>
                                                                <td>20220511</td>
                                                                <td>완료</td>
                                                                <td>003</td>
                                                                <td>10000</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div> 
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
                                </section>
                            </li>

                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!--====== Checkout Form Steps Part Ends ======-->

	<jsp:include page="../common/footer.jsp"/>
</body>

</html>
