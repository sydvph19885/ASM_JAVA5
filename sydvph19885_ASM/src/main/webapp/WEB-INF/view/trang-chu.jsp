<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HOME</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/dist/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.css">
    <style>
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<br>
<section style="height: 300px;background-color: #3a333b">
    <br>
    <div style="text-align: center;font-weight: bold;font-size: 40px;color: #ffffff">XIN CHÀO</div>
    <br>
    <form method="get" action="/search?trangSo=${trangHienTai+1}">
        <div class="input-group flex-nowrap container">
            <input type="text" class="form-control" placeholder="Tìm kiếm" name="tenSearch" aria-label="Username"
                   aria-describedby="addon-wrapping">
            <button type="submit" class="input-group-text" id="addon-wrapping" style="background-color: orangered"><i
                    class="fa fa-search"
                    aria-hidden="true"
                    style="color: white"></i></button>
        </div>
    </form>
    <br>
    <form class="container" method="get" action="/search-between-price">
        <div class="row">
            <div class="col-1" style="color: white;font-size: 30px;font-weight: bold;margin-top: 30px">Giá</div>
            <div class="col-10">
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div id="priceRange" style="margin-left: 60px" data-min-value="${giaMin}"
                                 data-max-value="${giaMax}" style="width: 500px;"></div>
                            <div class="text-center mt-3" style="color: white">
                                <span id="selectedPriceMin"></span> VND
                                <hr style="border-color: white; margin: 0 5px; height: 5px;width: 20px; display: inline-block;">
                                <span id="selectedPriceMax"></span> VND
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1" style="margin-top: 40px">
                <button type="submit" class="input-group-text" id="addon-wrapping" style="background-color: orangered">
                    <i class="fa fa-search" aria-hidden="true" style="color: white"></i>
                </button>
            </div>
        </div>
        <input type="hidden" id="selectedPriceMinInput" name="selectedPriceMin">
        <input type="hidden" id="selectedPriceMaxInput" name="selectedPriceMax">
    </form>
    <br>
    <br>
    <br>
    <div style="text-align: center;font-size: 40px;font-weight: bold;color: #a45709;">Sản phẩm giày leo núi</div>
</section>
<br>
<p style="text-align: center;color: red">${soLuongTon}</p>
<br>
<main class="py-5">
    <section class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${sanPham}" var="sp">
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="card card-pro mb-2" style="width: 269px">

                            <c:choose>
                                <c:when test="${sp.voucher != 0}">
                                <a href="/detail/${sp.id}" style="position: relative; display: inline-block;">
                                    <div style="position: relative; display: inline-block;">
                                        <img style="width: 269px; height: 300px; border-radius: 5px;" src="../../static/${sp.image}" alt="...">
                                        <div class="position-absolute top-0 start-0 translate-middle p-2 bg-danger text-white" style="border-radius: 5px 0 0 5px;margin-left: 23px;margin-top: 20px">
                                            ${sp.voucher}%
                                        </div>
                                    </div>
                                </a>


                                <div class="card-body">
                                    <a href="/detail/${sp.id}" style="text-decoration: none"><h5 style="; color: black"
                                                                                                 class="card-title">${sp.sanPham.ten}</h5>
                                    </a>
                                    <div class="row">
                                        <div class="col-6">
                                            <del><fmt:formatNumber value="${sp.giaBan}"
                                                                   pattern="###,###"></fmt:formatNumber>VND
                                            </del>
                                        </div>
                                        <div class="col-6">
                                            <p><fmt:formatNumber value="${sp.giaBan - ((sp.giaBan*sp.voucher)/100)}"
                                                                 pattern="###,###"></fmt:formatNumber>VND</p>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <a href="/detail/${sp.id}" style="position: relative; display: inline-block;">
                                        <div style="position: relative; display: inline-block;">
                                            <img style="width: 269px; height: 300px; border-radius: 5px;" src="../../static/${sp.image}" alt="...">
                                        </div>
                                    </a>


                                    <div class="card-body">
                                        <a href="/detail/${sp.id}" style="text-decoration: none"><h5 style="; color: black"
                                                                                                     class="card-title">${sp.sanPham.ten}</h5>
                                        </a>
                                    <p><fmt:formatNumber value="${sp.giaBan}"
                                                         pattern="###,###"></fmt:formatNumber>VND</p>
                                </c:otherwise>
                            </c:choose>

                            <div class="row">
                                <div class="col-6">
                                    <a href="/cart/add/${sp.id}"
                                       style="border: green solid 1px;background-color:green;color: white;border-radius: 50px"
                                       class="btn ">Add
                                        to cart</a>

                                </div>
                                <div class="col-6"><a href="/cart/buy-now/${sp.id}"
                                                      style="border: red solid 1px;background-color:red;color: white;border-radius: 50px"
                                                      class="btn">Buy now</a></div>
                            </div>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
    <br>
    <section class="container" style="display: flex;justify-content: center;align-items: center">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <c:choose>
                        <c:when test="${trangHienTai -1 < 0}">
                            <a class="page-link" href="/home/${tongSoTrangCo }" aria-label="Next">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="/home/${trangHienTai }" aria-label="Next">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </li>
                <c:forEach items="${soTrang}" var="page">
                    <c:choose>
                        <c:when test="${page.equals(trangHienTai) }">
                            <li class="page-item active"><a class="page-link" href="/home/${page}"><c:out
                                    value="${page+1}"></c:out></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="/home/${page}"><c:out
                                    value="${page+1}"></c:out></a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item">
                    <c:choose>
                        <c:when test="${trangHienTai +2 > tongSoTrangCo}">
                            <a class="page-link" href="/home/1" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="/home/${trangHienTai+2}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </li>
            </ul>
        </nav>
    </section>

</main>
<br>
<jsp:include page="layout/footer.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.js"></script>
<script>
    // Khởi tạo thanh range slider
    var priceRange = document.getElementById('priceRange');
    var selectedPriceMin = document.getElementById('selectedPriceMin');
    var selectedPriceMax = document.getElementById('selectedPriceMax');

    var minValue = parseInt(priceRange.getAttribute('data-min-value'));
    var maxValue = parseInt(priceRange.getAttribute('data-max-value'));

    noUiSlider.create(priceRange, {
        start: [minValue, maxValue], // Giá trị ban đầu của min và max
        connect: true, // Kết nối cả hai đầu của thanh trượt
        range: {
            'min': minValue,
            'max': maxValue
        },
        format: {
            to: function (value) {
                return Math.round(value);
            },
            from: function (value) {
                return Number(value);
            }
        }
    });


    // Cập nhật giá trị hiển thị khi thanh trượt thay đổi
    priceRange.noUiSlider.on('update', function (values, handle) {
        if (handle === 0) {
            selectedPriceMin.textContent = values[handle];
        }
        if (handle === 1) {
            selectedPriceMax.textContent = values[handle];
        }
    });

    priceRange.noUiSlider.on('update', function (values, handle) {
        if (handle === 0) {
            selectedPriceMin.textContent = values[handle];
            selectedPriceMinInput.value = values[handle];
        }
        if (handle === 1) {
            selectedPriceMax.textContent = values[handle];
            selectedPriceMaxInput.value = values[handle];
        }
    });
</script>
<script>
    // Định dạng giá trị hiển thị
    function formatPrice(value) {
        // Thực hiện định dạng giá trị thành định dạng mong muốn
        // Ví dụ: Thêm dấu phân cách hàng nghìn
        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // Cập nhật giá trị hiển thị khi thanh trượt thay đổi
    priceRange.noUiSlider.on('update', function (values, handle) {
        if (handle === 0) {
            selectedPriceMin.textContent = formatPrice(values[handle]);
        }
        if (handle === 1) {
            selectedPriceMax.textContent = formatPrice(values[handle]);
        }
    });
</script>
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