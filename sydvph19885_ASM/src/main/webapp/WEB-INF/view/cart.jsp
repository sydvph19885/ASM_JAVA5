<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CART</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/dist/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        <%@include file="css/cart.css"%>
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<br>
<main>
    <section class="h-100 h-custom" style="background-color: #eee;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="card">
                        <div class="card-body p-4">

                            <div class="row">
                                <h5 class="mb-3"><a href="/home" style="text-decoration: none" class="text-body"><i
                                        class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                <div class="col-lg-7" style="overflow-y: scroll;max-height: 700px">
                                    ${thongBaoHetHang}
                                    <hr>

                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div>
                                            <p class="mb-1">Shopping cart</p>
                                            <p class="mb-0">You have ${gioHang.size()} items in your cart</p>
                                            <p class="mb-0" style="color: red;font-weight: bold;font-size: 15px">${thongBaoSanPhamHetSoLuongTon}</p>
                                        </div>
                                        <div>
                                            <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                                                                                        class="text-body">price
                                                <i class="fas fa-angle-down mt-1"></i></a></p>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${sessionScope.account != null}">
                                            <c:forEach items="${gioHang}" var="gh">
                                                <form method="post" action="/cart/update/${gh.id}">
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-between">
                                                                <div class="d-flex flex-row align-items-center">
                                                                    <div>
                                                                        <img
                                                                                src="../../static/${gh.chiTietSP.image}"
                                                                                class="img-fluid rounded-3"
                                                                                alt="Shopping item"
                                                                                style="width: 65px;">
                                                                    </div>
                                                                    <div class="ms-3">
                                                                        <h5>${gh.chiTietSP.sanPham.ten}</h5>
                                                                        <p class="small mb-0">${gh.chiTietSP.nhaSanXuat.ten}, ${gh.chiTietSP.mauSac.ten}</p>
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex flex-row align-items-center">
                                                                    <div style="width: 50px;margin-left: 20px">
                                                                        <h5 class="fw-normal mb-0">
                                                                            <input value="${gh.soLuong}"
                                                                                   name="soLuongSP" style="width: 50px"
                                                                                   type="number">
                                                                        </h5>
                                                                    </div>
                                                                    <div style="width: 190px;">
                                                                        <h5 class="mb-0"><fmt:formatNumber
                                                                                value="${gh.donGia}"
                                                                                pattern="###,###"></fmt:formatNumber>VND
                                                                        </h5>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <a href="/cart/remove/${gh.id}"
                                                                               style="color: red;"><i
                                                                                    class="fas fa-trash-alt"></i></a>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <button type="submit"
                                                                                    style="color: green ; border: none;">
                                                                                <i class="fa fa-pencil-square-o"
                                                                                   aria-hidden="true"></i></button>
                                                                        </div>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${gioHang}" var="gh">
                                                <form method="post" action="/cart/update-user/${gh.key.id}">
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-between">
                                                                <div class="d-flex flex-row align-items-center">
                                                                    <div>
                                                                        <img
                                                                                src="../../static/${gh.key.image}"
                                                                                class="img-fluid rounded-3"
                                                                                alt="Shopping item"
                                                                                style="width: 65px;">
                                                                    </div>
                                                                    <div class="ms-3">
                                                                        <h5>${gh.key.sanPham.ten}</h5>
                                                                        <p class="small mb-0">${gh.key.nhaSanXuat.ten}, ${gh.key.mauSac.ten}</p>
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex flex-row align-items-center">
                                                                    <div style="width: 50px;margin-left: 20px">
                                                                        <h5 class="fw-normal mb-0">
                                                                            <input value="${gh.value}"
                                                                                   name="soLuongSP" style="width: 50px"
                                                                                   type="number">
                                                                        </h5>
                                                                    </div>
                                                                    <div style="width: 190px;">
                                                                        <h5 class="mb-0"><fmt:formatNumber
                                                                                value="${gh.value * gh.key.giaBan}"
                                                                                pattern="###,###"></fmt:formatNumber>VND
                                                                        </h5>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <a href="/cart/remove-user/${gh.key.id}"
                                                                               style="color: red;"><i
                                                                                    class="fas fa-trash-alt"></i></a>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <button type="submit"
                                                                                    style="color: green ; border: none;">
                                                                                <i class="fa fa-pencil-square-o"
                                                                                   aria-hidden="true"></i></button>
                                                                        </div>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>


                                </div>
                                <div class="col-lg-5">

                                    <div class="card bg-primary text-white rounded-3">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <h5 class="mb-0">Card details</h5>
                                                <img src="../../static/${sessionScope.account.image}"
                                                     class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                            </div>

                                            <p class="small mb-2">Card type</p>
                                            <a href="#!" type="submit" class="text-white"><i
                                                    class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                            <a href="#!" type="submit" class="text-white"><i
                                                    class="fab fa-cc-visa fa-2x me-2"></i></a>
                                            <a href="#!" type="submit" class="text-white"><i
                                                    class="fab fa-cc-amex fa-2x me-2"></i></a>
                                            <a href="#!" type="submit" class="text-white"><i
                                                    class="fab fa-cc-paypal fa-2x"></i></a>

                                            <form class="mt-4">
                                                <div class="form-outline form-white mb-4">
                                                    <input type="text" id="typeName"
                                                           class="form-control form-control-lg" siez="17"
                                                           placeholder="Cardholder's Name"/>
                                                    <label class="form-label" for="typeName">Cardholder's Name</label>
                                                </div>

                                                <div class="form-outline form-white mb-4">
                                                    <input type="text" id="typeText"
                                                           class="form-control form-control-lg" siez="17"
                                                           placeholder="1234 5678 9012 3457" minlength="19"
                                                           maxlength="19"/>
                                                    <label class="form-label" for="typeText">Card Number</label>
                                                </div>

                                                <div class="row mb-4">
                                                    <div class="col-md-6">
                                                        <div class="form-outline form-white">
                                                            <input type="text" id="typeExp"
                                                                   class="form-control form-control-lg"
                                                                   placeholder="MM/YYYY" size="7" id="exp" minlength="7"
                                                                   maxlength="7"/>
                                                            <label class="form-label" for="typeExp">Expiration</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-outline form-white">
                                                            <input type="password" id="typeText"
                                                                   class="form-control form-control-lg"
                                                                   placeholder="&#9679;&#9679;&#9679;" size="1"
                                                                   minlength="3" maxlength="3"/>
                                                            <label class="form-label" for="typeText">Cvv</label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </form>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">Subtotal</p>
                                                <p class="mb-2"><fmt:formatNumber value="${tongTienHang}"
                                                                                  pattern="###,###"></fmt:formatNumber>VND
                                                </p>
                                            </div>

                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">VAT</p>
                                                <p class="mb-2">10%</p>
                                            </div>

                                            <div class="d-flex justify-content-between mb-4">
                                                <p class="mb-2">Total(Incl. taxes)</p>
                                                <p class="mb-2"><fmt:formatNumber value="${vat}"
                                                                                  pattern="###,###"></fmt:formatNumber>VND</p>
                                            </div>

                                            <a href="/hoa-don" type="button" class="btn btn-info btn-block btn-lg">
                                                <div class="d-flex justify-content-between">
                                                    <span style="text-decoration: none">Checkout <i
                                                            class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                                </div>
                                            </a>

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
</main>
<br>
<br>
<br>
<jsp:include page="layout/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
</body>
</html>