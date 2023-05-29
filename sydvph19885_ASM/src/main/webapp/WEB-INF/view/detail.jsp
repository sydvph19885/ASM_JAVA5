<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/dist/bootstrap-icons.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    <style>
        <%@include file="css/detail.css"%>
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<br>
<main>
    <div class="container">
        <div class="card">
            <div class="container-fliud">
                <div class="wrapper row">
                    <div class="preview col-md-6">

                        <div class="preview-pic tab-content">
                            <div class="tab-pane active" id="pic-1"><img src="../../static/${detail.image}"/></div>
                            <div class="tab-pane" id="pic-2"><img src="../../static/${detail.image}"/></div>
                            <div class="tab-pane" id="pic-3"><img src="../../static/${detail.image}"/></div>
                            <div class="tab-pane" id="pic-4"><img src="../../static/${detail.image}"/></div>
                            <div class="tab-pane" id="pic-5"><img src="../../static/${detail.image}"/></div>
                        </div>
                        <ul class="preview-thumbnail nav nav-tabs">
                            <li class="active"><a data-target="#pic-1" data-toggle="tab"><img
                                    src="../../static/${detail.image}"/></a></li>
                            <li><a data-target="#pic-2" data-toggle="tab"><img src="../../static/${detail.image}"/></a>
                            </li>
                            <li><a data-target="#pic-3" data-toggle="tab"><img src="../../static/${detail.image}"/></a>
                            </li>
                            <li><a data-target="#pic-4" data-toggle="tab"><img src="../../static/${detail.image}"/></a>
                            </li>
                            <li><a data-target="#pic-5" data-toggle="tab"><img src="../../static/${detail.image}"/></a>
                            </li>
                        </ul>

                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${detail.sanPham.ten}</h3>
                        <div class="rating">
                            <div class="stars">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                            </div>
                            <span class="review-no">41 reviews</span>
                        </div>
                        <p class="product-description">${detail.moTa}</p>
                        <h4 class="price">current price: <span>
                            <fmt:formatNumber value="${detail.giaBan}" pattern="###,###"></fmt:formatNumber>VND
                            </span></h4>
                        <p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong>
                        </p>
                        <h5 class="sizes">sizes:
                            <span class="size" data-toggle="tooltip" title="small">${detail.size}</span>
                        </h5>
                        <h5 class="sizes">Producer:
                            <span class="size" data-toggle="tooltip" title="small">${detail.nhaSanXuat.ten}</span>
                        </h5>
                        <h5 class="colors">
                            <div class="row">
                                <div class="col-3">colors:</div>
                                <div class="col-9">
                                    <%--                                    <c:if test="${detail.mauSac.ten.contains('đỏ')}"></c:if>--%>
                                    <c:choose>
                                        <c:when test="${detail.mauSac.ten.contains('Đỏ')}">
                                            <i class="fa fa-circle " style="color: red" aria-hidden="true"></i>
                                        </c:when>
                                        <c:when test="${detail.mauSac.ten.contains('Nâu')}">
                                            <i class="fa fa-circle " style="color: #663105" aria-hidden="true"></i>
                                        </c:when>
                                        <c:when test="${detail.mauSac.ten.contains('Đen')}">
                                            <i class="fa fa-circle " style="color: #0a0a0a" aria-hidden="true"></i>
                                        </c:when>
                                        <c:when test="${detail.mauSac.ten.contains('Hồng')}">
                                            <i class="fa fa-circle " style="color: #e22bc8" aria-hidden="true"></i>
                                        </c:when>
                                        <c:when test="${detail.mauSac.ten.contains('Xanh')}">
                                            <i class="fa fa-circle " style="color: #4f72e0" aria-hidden="true"></i>
                                        </c:when>
                                        <c:when test="${detail.mauSac.ten.contains('Trắng')}">
                                            <i class="fa fa-circle " style="color: #fafafa" aria-hidden="true"></i>
                                        </c:when>
                                        <c:when test="${detail.mauSac.ten.contains('Vàng')}">
                                            <i class="fa fa-circle " style="color: #e7b51c" aria-hidden="true"></i>
                                        </c:when>
                                    </c:choose>

                                </div>

                            </div>
                        </h5>
                        <div class="action">
                            <a class="add-to-cart btn btn-default" href="/cart/add/${detail.id}" type="button">add to
                                cart</a>
                            <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
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
</body>
</html>