<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/dist/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.css">
    <style>
<%--<%@include file="css/bill.css"%>--%>
.body-main {
    background: #ffffff;
    border-bottom: 15px solid #1E1F23;
    border-top: 15px solid #1E1F23;
    margin-top: 30px;
    margin-bottom: 30px;
    padding: 40px 30px !important;
    position: relative ;
    box-shadow: 0 1px 21px #808080;
    font-size:10px;



}

.main thead {
    background: #1E1F23;
    color: #fff;
}
.img{
    height: 100px;}
h1{
    text-align: center;
}
.subtotal-column {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
}
    </style>
</head>
<body >
<jsp:include page="layout/header.jsp"></jsp:include>
<br>
<main style="margin-left: 450px">
    <div class="container" >
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 body-main">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">
                                <img class="img" alt="Invoce Template" src="http://pngimg.com/uploads/shopping_cart/shopping_cart_PNG59.png" />
                            </div>
                         <c:choose>
                             <c:when test="${sessionScope.account != null}">
                            <div class="col-md-8 text-right">
                                <h4 style="color: #F81D2D;"><strong>Khách hàng: ${hoaDon.tenNguoiNhan}</strong></h4>
                                <p>Số điện thoại: ${hoaDon.sdt}</p>
                                <p>Email: ${email}</p>
                                <p>Địa chỉ: ${hoaDon.diaChi}</p>

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h2>Hóa đơn thanh toán</h2>
                                <h5><fmt:formatNumber value="${soHoaDon}" pattern="##########"></fmt:formatNumber></h5>
                            </div>
                        </div>
                        <br />
                        <div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th><h5>Sản phẩm</h5></th>
                                    <th><h5>Số lượng</h5></th>
                                    <th><h5>Thành tiền</h5></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sanPhamMua}" var="sp">
                                    <tr>
                                        <td class="col-md-6 " >${sp.chiTietSP.sanPham.ten}</td>
                                        <td class="col-md-3 " >${sp.soLuong}</td>
                                        <td class="col-md-auto " style="margin-left: 20px"><fmt:formatNumber value="${sp.chiTietSP.giaBan * sp.soLuong}" pattern="###,###"></fmt:formatNumber> VND</td>
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td class="text-right">
                                        <p>
                                            <strong>Tổng tiền sản phẩm: </strong>
                                        </p>
                                        <p>
                                            <strong>VAT: </strong>
                                        </p>  <p>
                                        <strong>Shipping: </strong>
                                    </p>
                                        <p>
                                            <strong>Tổng thanh toán: </strong>
                                        </p>
                                    </td>
                                    <td class="col-md-12 subtotal-column" style="margin-left: 50px">
                                        <p>
                                            <strong> <fmt:formatNumber value="${tongTienHang}" pattern="###,###"></fmt:formatNumber> VND</strong>
                                        </p>
                                        <p>
                                            <strong> 10%</strong>
                                        </p>
                                        <p>
                                            <strong> 20,000 VND</strong>
                                        </p>
                                        <p>
                                            <strong><fmt:formatNumber value="${tongTienHang + ((tongTienHang*10)/100) + 20000}"  pattern="###,###"></fmt:formatNumber> VND</strong>
                                        </p>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                             </c:when>
                        <c:otherwise>
                        <div class="col-md-8 text-right">
                            <h4 style="color: #F81D2D;"><strong>Khách hàng: ${hoaDon.tenNguoiNhan}</strong></h4>
                            <p>Số điện thoại: ${hoaDon.sdt}</p>
                            <p>Email: ${email}</p>
                            <p>Địa chỉ: ${hoaDon.diaChi}</p>

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h2>Hóa đơn thanh toán</h2>
                            <h5><fmt:formatNumber value="${soHoaDon}" pattern="##########"></fmt:formatNumber></h5>
                        </div>
                    </div>
                    <br />
                    <div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th><h5>Sản phẩm</h5></th>
                                <th><h5>Số lượng</h5></th>
                                <th><h5>Thành tiền</h5></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${sanPhamMua}" var="sp">
                                <tr>
                                    <td class="col-md-6 " >${sp.key.sanPham.ten}</td>
                                    <td class="col-md-3 " >${sp.value}</td>
                                    <td class="col-md-auto " style="margin-left: 20px"><fmt:formatNumber value="${sp.key.giaBan * sp.value}" pattern="###,###"></fmt:formatNumber> VND</td>
                                </tr>
                            </c:forEach>

                            <tr>
                                <td class="text-right">
                                    <p>
                                        <strong>Tổng tiền sản phẩm: </strong>
                                    </p>
                                    <p>
                                        <strong>VAT: </strong>
                                    </p>  <p>
                                    <strong>Shipping: </strong>
                                </p>
                                    <p>
                                        <strong>Tổng thanh toán: </strong>
                                    </p>
                                </td>
                                <td class="col-md-12 subtotal-column" style="margin-left: 50px">
                                    <p>
                                        <strong> <fmt:formatNumber value="${tongTienHang}" pattern="###,###"></fmt:formatNumber> VND</strong>
                                    </p>
                                    <p>
                                        <strong> 10%</strong>
                                    </p>
                                    <p>
                                        <strong> 20,000 VND</strong>
                                    </p>
                                    <p>
                                        <strong><fmt:formatNumber value="${tongTienHang + ((tongTienHang*10)/100) + 20000}"  pattern="###,###"></fmt:formatNumber> VND</strong>
                                    </p>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                        </c:otherwise>
                         </c:choose>

                        <div>
                            <div class="col-md-12">
                                <p><b>Date :</b> ${time}</p>
                                <br />
                                <p><b>Signature</b></p>
                            </div>
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
</body>
</html>