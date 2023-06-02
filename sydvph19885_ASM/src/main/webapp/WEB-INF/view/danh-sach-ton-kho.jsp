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
<h1 style="text-align: center">TOP 10 SẢN PHẨM TỒN KHO LÂU NHẤT</h1>
<br>
<table class="table table-success table-striped table-hover table-bordered">
    <tr>
        <th>STT</th>
        <th>SẢN PHẨM</th>
        <th>NGÀY NHẬP (dd/MM/yyyy)</th>
        <th>THỜI GIAN TỒN KHO (Ngày)</th>
    </tr>
    <c:forEach items="${danhSach}" var="sp" varStatus="i">
        <tr>
            <td>${i.index}</td>
            <td>${sp.sanPham.ten}</td>
            <td><fmt:formatDate value="${sp.ngayNhap}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
            <td>${thoiGianTonKho.get(i.index)}</td>

        </tr>
    </c:forEach>

</table>
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