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
    <style>

    </style>
</head>
<body style="background-color: #9a15d6">
<jsp:include page="layout/header.jsp"></jsp:include>
<br>
<main>
    <form method="post" action="/profile/update" enctype="multipart/form-data">
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div
                            class="d-flex flex-column align-items-center text-center p-3 py-5"
                    >
                        <img
                                class="rounded-circle mt-5"
                                width="150px"
                                src="../../static/${account.image}"
                        /><span class="font-weight-bold">${account.hoTen}</span
                    ><span class="text-black-50">${account.email}</span
                    ><span> </span>
                    </div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <div
                                class="d-flex justify-content-between align-items-center mb-3"
                        >
                            <h4 class="text-right">Profile Settings</h4>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="Last name"
                                        name="ho"
                                        value="${lastName}"
                                        required
                                />
                            </div>
                            <div class="col-md-6">
                                <input
                                        type="text"
                                        class="form-control"
                                        name="ten"
                                        placeholder="First name"
                                        value="${firstName}"
                                        required
                                />
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <input
                                        type="email"
                                        class="form-control"
                                        placeholder="Email"
                                        name="email"
                                        value="${sessionScope.account.email}"
                                        required
                                />
                            </div>
                            <br>
                            <br>
                            <div class="col-md-12">
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="Number phone"
                                        name="sdt"
                                        value="${sessionScope.account.sdt}"
                                        required
                                />
                            </div>
                            <br>
                            <br>
                            <div class="col-md-12">
                                <input
                                        type="file"
                                        class="form-control"
                                        placeholder="Image"
                                        name="image"
                                        required
                                />
                            </div>
                        </div>
                        <p style="color: red;text-align: center">${thongBao}</p>
                        <div class="mt-5 text-center">
                            <button class="btn btn-primary profile-button" type="submit">
                                Lưu thay đổi
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" style="margin-top: 60px;">
                    <div class="d-flex justify-content-center align-items-center rounded-circle"
                         style="width: 300px; height: 300px; background-color: gray;">
                        <img id="previewImage" src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="Hình ảnh"
                             class="rounded-circle" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </div>

            </div>
        </div>
    </form>
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