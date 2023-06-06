<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Form Thống kê</title>
    <!-- Thêm thư viện Bootstrap -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
    />
    <!-- Thêm thư viện Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container">
    <h1 class="mt-4">Form Thống kê</h1>

    <!-- Ô tổng tiền và ô tìm kiếm -->
    <div class="row mt-4">
        <div class="col-md-6">
            <h2 class="d-inline">
                Tổng ngày hôm nay: <span id="totalToday"></span>
            </h2>
        </div>
        <div class="col-md-6 text-end">
            <div class="d-inline-block bg-secondary text-white px-3 py-2">
                <label for="searchInput" class="m-0">Tìm kiếm:</label>
            </div>
            <input
                    type="text"
                    id="searchInput"
                    class="form-control d-inline-block"
                    placeholder="Nhập từ khóa tìm kiếm"
            />
            <button onclick="search()" class="btn btn-primary">Tìm</button>
        </div>
    </div>

    <!-- Biểu đồ cột danh sách sản phẩm -->
    <div class="mt-4">
        <canvas id="chart"></canvas>
    </div>
</div>

<script>
    // Dữ liệu mẫu cho biểu đồ
    <%--var danhSachSP = /*[[${thongKe}]]*/ [];--%>
    <%--var danhSachSP = JSON.parse(/*[[${thongKeJson}]]*/ '[]');--%>
    var danhSachSP = JSON.parse("[[${thongKe}]]");

    var data = {
        labels: danhSachSP.map(sp => sp.chiTietSP.sanPham.ten), // Tên sản phẩm
        datasets: [
            {
                label: "Số lượng",
                data: danhSachSP.map(sp => sp.soLuongTon), // Số lượng sản phẩm
                backgroundColor: "rgba(75, 192, 192, 0.2)",
                borderColor: "rgba(75, 192, 192, 1)",
                borderWidth: 1,
            },
        ],
    };

    // Khởi tạo biểu đồ cột
    var ctx = document.getElementById("chart").getContext("2d");
    var chart = new Chart(ctx, {
        type: "bar",
        data: data,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                },
            },
        },
    });

    // Tính tổng ngày hôm nay
    var totalToday = 100; // Thay thế bằng giá trị thực tế
    document.getElementById("totalToday").innerText = totalToday;

    // Hàm tìm kiếm
    function search() {
        var keyword = document.getElementById("searchInput").value;
        console.log(danhSachSP);
        // Thực hiện tìm kiếm với từ khóa `keyword` tại đây
        // Cập nhật biểu đồ cột với kết quả tìm kiếm
        // Ví dụ: chart.data.datasets[0].data = [5, 10, 8];
        //       chart.update();
    }
</script>
</body>
</html>
