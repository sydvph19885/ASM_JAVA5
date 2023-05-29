<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1,maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/dist/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.css">

<%--    <style>--%>
<%--        .range-value {--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--        }--%>

<%--        #minValue,--%>
<%--        #maxValue {--%>
<%--            margin-top: 5px;--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body style="background-color: #0e8ce4 ">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div id="priceRange" data-min-value="0" data-max-value="100"></div>
            <div class="text-center mt-3">
                <span id="selectedPriceMin" >20</span>%--------------
                <span id="selectedPriceMax">80</span>%
            </div>
        </div>
    </div>
</div>

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
            to: function(value) {
                return Math.round(value);
            },
            from: function(value) {
                return Number(value);
            }
        }
    });

    // Cập nhật giá trị hiển thị khi thanh trượt thay đổi
    priceRange.noUiSlider.on('update', function(values, handle) {
        if (handle === 0) {
            selectedPriceMin.textContent = values[handle];
        }
        if (handle === 1) {
            selectedPriceMax.textContent = values[handle];
        }
    });
</script>


<%--<div class="container">--%>
<%--    <h1>Range Slider</h1>--%>
<%--    <div id="price-slider"></div>--%>
<%--    <div class="range-value">--%>
<%--        <span id="minValue" value="500000"></span>--%>
<%--        <span id="maxValue" value="9000000"></span>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>--%>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        var minValue = $("#minValue");--%>
<%--        var maxValue = $("#maxValue");--%>
<%--        var defaultMinValue = parseInt(minValue.attr("value"));--%>
<%--        var defaultMaxValue = parseInt(maxValue.attr("value"));--%>

<%--        $("#price-slider").slider({--%>
<%--            range: true,--%>
<%--            min: defaultMinValue,--%>
<%--            max: defaultMaxValue,--%>
<%--            values: [defaultMinValue, defaultMaxValue],--%>
<%--            step: 100000,--%>
<%--            slide: function (event, ui) {--%>
<%--                minValue.text(ui.values[0]);--%>
<%--                maxValue.text(ui.values[1]);--%>
<%--            },--%>
<%--        });--%>

<%--        minValue.text($("#price-slider").slider("values", 0));--%>
<%--        maxValue.text($("#price-slider").slider("values", 1));--%>
<%--    });--%>
<%--</script>--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>
