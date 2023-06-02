<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MANAGE PRODUCT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/dist/bootstrap-icons.min.css">
    <style>
        .rectangle {
            width: 400px;
            height: 250px;
            border-radius: 0 0 50px 0;
            border-radius: 50px 0 0 0;
            overflow: hidden;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 500px;
        }

        .rectangle img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 0 0 50px 0;
        }

    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<br>
<section
        style="height: 300px;background-color: #693b15;text-align: center;font-weight: bold;font-size: 40px;color: #fcfcfc;display: flex;justify-content: center;align-items: center">
    <br>
    <h1>
        MANAGE PRODUCT</h1>
    <br>
</section>
<br>
<main>
    <br>
    <div class="container ">
        <div class="rectangle ">
            <img width="500px" height="350px" id="previewImage"
                 src="https://www.freeiconspng.com/thumbs/photography-icon-png/photo-album-icon-png-14.png"
                 class="img-fluid rounded-pill"
                 alt="Townhouses and Skyscrapers"
            />
        </div>
    </div>

    <form method="post" class="container" action="/manage-product/add" enctype="multipart/form-data">
        <div class="row">
            <div class="col-6">
                <br>
                <div class="input-group flex-nowrap">
                    <span class="input-group-text" id="addon-wrapping">Tên sản phẩm</span>
                    <input type="text" class="form-control" value="${ctsp.sanPham.ten}" required
                           placeholder="Tên sản phẩm" name="tenSanPham"
                           aria-describedby="addon-wrapping">
                </div>
                <br>
                <div class="row">
                    <div class="col-10">
                        Nhà sản xuất
                        <select class="form-select" aria-label="Default select example" name="nsx">
                            <c:forEach items="${nsx}" var="nsx">
                                <option ${ctsp.nhaSanXuat.id == nsx.id?"selected":""}
                                        value="${nsx.id}">${nsx.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-2">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn" style="border: 1px solid black;margin-top: 25px"
                                data-bs-toggle="modal" data-bs-target="#nsx">
                            +
                        </button>
                    </div>
                </div>
                <br>
                <div class="row">

                    <div class="col-10">
                        Màu sắc
                        <select class="form-select" aria-label="Default select example" name="mauSac">
                            <c:forEach items="${mauSac}" var="ms">
                                <option ${ctsp.mauSac.id == ms.id?"selected":""} value="${ms.id}">${ms.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-2">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn" style="border: 1px solid black;margin-top: 25px"
                                data-bs-toggle="modal" data-bs-target="#mauSac">
                            +
                        </button>
                    </div>
                </div>

                <br>
                Size
                <select class="form-select" aria-label="Default select example" name="size">
                    <option value="35">35</option>
                    <option value="36">36</option>
                    <option value="37">37</option>
                    <option value="38">38</option>
                    <option value="39">39</option>
                    <option value="40">40</option>
                    <option value="41">41</option>
                    <option value="41">42</option>
                    <option value="43">43</option>
                </select>
                <br>
                <div class="input-group flex-nowrap">
                    <span class="input-group-text" id="addon-wrapping">Mô tả</span>
                    <textarea type="text" class="form-control" required placeholder="Mô tả" name="moTa"
                              aria-describedby="addon-wrapping">${ctsp.moTa}</textarea>
                </div>

                <p style="color: red;text-align: center">${thongBaoImg}</p>
            </div>
            <div class="col-6">
                <br>
                <div class="row">
                    <div class="col-9">
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Năm bảo hành</span>
                            <input type="number" class="form-control" value="${ctsp.namBH}" required
                                   placeholder="Năm bảo hành"
                                   name="namBH"
                                   aria-describedby="addon-wrapping">
                        </div>
                    </div>
                    <div class="col-3" style="margin-top: 5px"><p style="color: red;font-weight: bold">${namBhss}</p>
                    </div>
                </div>


                <br>
                <div class="row">
                    <div class="col-9">
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Số lượng</span>
                            <input type="number" class="form-control" value="${ctsp.soLuongTon}" required
                                   placeholder="Số lượng"
                                   name="soLuong"
                                   aria-describedby="addon-wrapping">
                        </div>
                    </div>
                    <div class="col-3" style="margin-top: 5px"><p style="color: red;font-weight: bold">${soLuongss}</p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-9">
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Giá nhập</span>
                            <input type="number" class="form-control" value="${ctsp.giaNhap}" required
                                   placeholder="Giá nhập"
                                   name="giaNhap"
                                   aria-describedby="addon-wrapping">
                        </div>
                    </div>
                    <div class="col-3" style="margin-top: 5px"><p style="color: red;font-weight: bold">${giaNhapss}</p>
                    </div>
                </div>

                <br>
                <div class="row">
                    <div class="col-9">
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Giá bán</span>
                            <input type="number" class="form-control" value="${ctsp.giaBan}" required
                                   placeholder="Giá bán"
                                   name="giaBan"
                                   aria-describedby="addon-wrapping">
                        </div>
                    </div>
                    <div class="col-3" style="margin-top: 5px"><p style="color: red;font-weight: bold">${giaBanss}</p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-9">
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Voucher</span>
                            <input type="number" class="form-control" value="${ctsp.voucher}" required
                                   placeholder="voucher %"
                                   name="voucher"
                                   aria-describedby="addon-wrapping">
                            <span class="input-group-text" id="addon-wrapping">%</span>
                        </div>
                    </div>
                    <div class="col-3" ><p style="color: red;font-weight: bold">${voucherss}</p>
                    </div>
                </div>
                <br>


                <br>
                <div class="row">
                    <div class="col-2">Ảnh</div>
                    <div class="col-10"><input type="file" value="${ctsp.image}"
                                               name="file"></div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <div style="display: flex;justify-content: center;align-items: center">
            <c:choose>
                <c:when test="${ctsp== null}">
                    <button type="button" class="btn btn-primary" style="width: 300px" data-bs-toggle="modal"
                            data-bs-target="#xacNhan">
                        Thêm
                    </button>
                </c:when>
                <c:otherwise>
                    <button type="button" class="btn btn-primary" style="width: 300px" data-bs-toggle="modal"
                            data-bs-target="#xacNhan">
                        Update
                    </button>
                </c:otherwise>
            </c:choose>

            <br>
            <br>


            <br>
            <div class="modal fade" id="xacNhan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn!
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <br>
    <br>
    <c:choose>
        <c:when test="${chiTietSp.size()==0}"><h1>Bạn chưa có sản phẩm nào!</h1></c:when>
        <c:otherwise>
            <table class="table table-header table-bordered">
                <thead>
                <tr>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Nhà sản xuất</th>
                    <th scope="col">Màu sắc</th>
                    <th scope="col">Dòng sản phẩm</th>
                    <th scope="col">Năm bảo hành</th>
                    <th scope="col">Image</th>
                    <th scope="col">Giá nhập</th>
                    <th scope="col">Giá bán</th>
                    <th scope="col">Voucher(%)</th>
                    <th scope="col">Số lượng tồn</th>
                    <th scope="col">Mô tả</th>
                    <th scope="col">Acction</th>
                </tr>
                </thead>
                <c:forEach items="${chiTietSp}" var="sp">
                    <tbody>
                    <tr>
                        <td>${sp.sanPham.ten}</td>
                        <td>${sp.nhaSanXuat.ten}</td>
                        <td>${sp.mauSac.ten}</td>
                        <td>${sp.dongSanPham.ten}</td>
                        <td>${sp.namBH}</td>
                        <td>${sp.image}</td>
                        <td><fmt:formatNumber value="${sp.giaNhap}" pattern="###,###"></fmt:formatNumber></td>
                        <td><fmt:formatNumber value="${sp.giaBan}" pattern="###,###"></fmt:formatNumber></td>
                        <td>${sp.voucher}</td>
                        <td>${sp.soLuongTon}</td>
                        <td>${sp.moTa}</td>
                        <td>
                            <a href="/manage-product/detail/${sp.id}" class="btn"><i class="fa fa-eye"
                                                                                     aria-hidden="true"></i></a>
                            <a type="button" href="/manage-product/delete/${sp.id}"
                               onclick="return confirm('BẠN CÓ CHẮC CHẮN THỰC HIỆN THAO TÁC!')" class="btn"><i
                                    class="fa fa-trash"
                                    aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                    </tbody>

                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <br>
    <%--    phan trang--%>
    <section class="container" style="display: flex;justify-content: center;align-items: center">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <c:choose>
                        <c:when test="${trangHienTai -1 < 0}">
                            <a class="page-link" href="/manage-product/${tongSoTrangCo}" aria-label="Next">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="/manage-product/${trangHienTai }" aria-label="Next">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <c:forEach items="${soTrang}" var="page">
                    <c:choose>
                        <c:when test="${page.equals(trangHienTai) }">
                            <li class="page-item active"><a class="page-link" href="/manage-product/${page+1}"><c:out
                                    value="${page+1}"></c:out></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="/manage-product/${page+1}"><c:out
                                    value="${page+1}"></c:out></a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item">
                    <c:choose>
                        <c:when test="${trangHienTai +2 > tongSoTrangCo}">
                            <a class="page-link" href="/manage-product/1" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="/manage-product/${trangHienTai+2}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </li>
            </ul>
        </nav>
    </section>
    <%--    dong san pham--%>
    <section>
        <!-- Modal -->
        <form method="post" action="/manage-product/dong-sp/add">
            <div class="modal fade" id="dongSanPham" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Nhập tên dòng sản phẩm</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="input-group flex-nowrap">
                                <input type="text" class="form-control" placeholder="Tên dòng sản phẩm"
                                       name="tenDongSanPham" required aria-describedby="addon-wrapping">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </section>
    <%--    mau sac--%>
    <section>
        <!-- Modal -->
        <form method="post" action="/manage-product/mau-sac/add">
            <div class="modal fade" id="mauSac" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Nhập tên màu sắc </h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="input-group flex-nowrap">
                                <input type="text" class="form-control" required placeholder="Tên màu sắc"
                                       name="tenMauSac"
                                       aria-describedby="addon-wrapping">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </section>
    <%--    NHA SAN XUAT--%>
    <section>
        <!-- Modal -->
        <form method="post" action="/manage-product/nsx/add">
            <div class="modal fade" id="nsx" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Nhập tên nhà sản xuất</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="input-group flex-nowrap">
                                <input type="text" class="form-control" required placeholder="Tên nhà sản xuất"
                                       name="tenNsx"
                                       aria-describedby="addon-wrapping">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </section>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<script>
    function previewFile() {
        var preview = document.getElementById('previewImage');
        var file = document.querySelector('input[type=file]').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "https://bootdey.com/img/Content/avatar/avatar2.png";
        }
    }

    document.querySelector('input[type=file]').addEventListener('change', previewFile);
</script>
</body>
</html>