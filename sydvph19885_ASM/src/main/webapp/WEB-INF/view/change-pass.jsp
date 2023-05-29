<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/dist/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
        <%@include file="../view/css/chang-pass.css"%>
    </style>
</head>
<body>
<jsp:include page="../view/layout/header.jsp"></jsp:include>
<br>
<h1 style="text-align: center">Change Password</h1>
<br>
<form action="/change-password" class="container"
      style="display: flex;justify-content: center;align-items: center;margin-left: 440px" method="post">
    <div class="container bootstrap snippets bootdey">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6 separator social-login-box"><br>
                                <img style="width: 400px;height: 350px" alt="" class="img-thumbnail"
                                     src="../../static/${sessionScope.account.image}">
                            </div>
                            <div style="margin-top:80px;" class="col-xs-6 col-sm-6 col-md-6 login-box">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span
                                                class="glyphicon glyphicon-lock"></span>
                                        </div>
                                        <input class="form-control" name="currentPass" required type="password"
                                               placeholder="Current Password" value="${sessionScope.currentPass}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span
                                                class="glyphicon glyphicon-log-in"></span>
                                        </div>
                                        <input class="form-control" type="password" name="newPass" required
                                               placeholder="New Password" value="${sessionScope.newPass}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span
                                                class="glyphicon glyphicon-log-in"></span>
                                        </div>
                                        <input class="form-control" type="password" name="confirmPass" required
                                               placeholder="Confirm Password" value="${sessionScope.confirmPass}">
                                    </div>
                                    <p style="color: red">${thongBao}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6"></div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <button class="btn icon-btn-save btn-success" type="submit">
                                    <span class="btn-save-label"><i class="fa fa-floppy-o"
                                                                    aria-hidden="true"></i></span>Save
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<br>
<jsp:include page="../view/layout/footer.jsp"></jsp:include>


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