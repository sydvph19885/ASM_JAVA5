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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
        <%@include file="css/shipping-infor.css"%>
    </style>
</head>
<body style="background-color: #0e8ce4">
<jsp:include page="layout/header.jsp"></jsp:include>
<br>
<main>
    <div class="row mt-3 mx-3" style="margin-top:25px ;">
        <div class="col-md-3">
            <div style="margin-top: 50px; margin-left: 10px;" class="text-center">
                <i id="animationDemo" data-mdb-animation="slide-right" data-mdb-toggle="animation"
                   data-mdb-animation-reset="true" data-mdb-animation-start="onScroll"
                   data-mdb-animation-on-scroll="repeat" class="fas fa-3x fa-shipping-fast text-white"></i>
                <h3 class="mt-3 text-white">Welcome</h3>
                <p class="white-text">You are 30 seconds away from compleating your order!</p>
            </div>
            <div class="text-center">
                <a href="/cart" type="submit" class="btn btn-white btn-rounded back-button">Go back</a>
            </div>


        </div>
        <div class="col-md-9 justify-content-center">
            <div class="card card-custom pb-4">
                <div class="card-body mt-0 mx-5">
                    <div class="text-center mb-3 pb-2 mt-3">
                        <h4 style="color: #495057 ;">Thông tin nhận hàng</h4>
                    </div>
                    <br>
                    <form class="mb-0" method="post" action="/hoa-don/add">

                        <div class=" mb-4">
                            <div class="form-outline">
                                <label class="form-label" for="form9Example1">Name</label>
                                <input type="text" id="form9Example1" required placeholder="${account.hoTen}"
                                       value="${account.hoTen}"
                                       name="tenKhachHang"
                                       class="form-control input-custom"/>

                            </div>
                        </div>
                        <div class=" mb-4">
                            <div class="form-outline">
                                <label class="form-label" for="form9Example3">Phone</label>
                                <input type="text" id="form9Example3"  required name="sdt" placeholder="${account.sdt}"
                                       value="${account.sdt}"
                                       class="form-control input-custom"/>

                            </div>
                        </div>
                        <div class=" mb-4">
                            <div class="form-outline">
                                <label class="form-label" for="form9Example3">Email</label>
                                <input type="text" id="form9Example3" required name="email" placeholder="${account.email}"
                                       value="${account.email}"
                                       class="form-control input-custom"/>

                            </div>
                        </div>
                        <div class=" mb-4">
                            <div class="form-outline">
                                <label class="form-label" for="form9Example6">Address</label>
                                <textarea type="text" required id="form9Example6" name="diaChi"
                                          class="form-control input-custom"></textarea>

                            </div>
                        </div>

                        <div class="float-end ">
                            <!-- Submit button -->
                            <button type="button" class="btn btn-primary btn-rounded" data-bs-toggle="modal"
                                    data-bs-target="#datHang"
                                    style="background-color: #0062CC ;">Đặt hàng
                            </button>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="datHang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắn chắn đặt hàng?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <div class="xacNhan">
                                            <div class="text-center">
                                                <!-- Button HTML (to Trigger Modal) -->
                                                <button id="xacNhanBtn" type="submit" href="#myModal" class="btn btn-secondary" data-toggle="modal">Xác nhận</button>
                                            </div>
                                            <!-- Modal DAT HANG -->
                                            <div id="myModal" class="modal fade">
                                                <div class="modal-dialog modal-confirm">
                                                    <div class="modal-content">
                                                        <div class="modal-header justify-content-center">
                                                            <div class="icon-box">
                                                                <i class="material-icons">&#xE876;</i>
                                                            </div>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body text-center">
                                                            <h4>Great!</h4>
                                                            <p>Bạn đã đặt hàng thành công.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

</main>
<br>
<jsp:include page="layout/footer.jsp"></jsp:include>

<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $('#xacNhanBtn').click(function() {--%>
<%--            setTimeout(function() {--%>
<%--                $('form').submit();--%>
<%--            }, 10000);--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
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