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
    <style>
        <%@include file="css/login.css"%>
    </style>
</head>
<body>
<main>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="/register" method="post" enctype="multipart/form-data">
                <h1>Create Account</h1>
                <br>
                <div class="row">
                    <div class="col-6"><input type="text" value="${ho}" name="hoDK" required
                                              placeholder="Last Name"/></div>
                    <div class="col-6"><input type="text" value="${ten}" name="hoTenDK" required
                                              placeholder="First Name"/></div>
                </div>

                <input type="email" value="${account.email}" name="emailDK" required
                       placeholder="Email"/>
                <input type="password" value="${account.matKhau}" name="passDK" required
                       placeholder="Password"/>
                <input type="file" name="image" value="${account.image}" required placeholder="Image"/>

                <button type="submit">ĐĂNG KÝ</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="/login" method="post">
                <h1>Sign in</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <%--                <span style="color: red">${thongBaoThanhCong}</span>--%>
                <%--                <span style="color: red">${thongBao}</span>--%>
                <input type="email" required name="email" value="${emails}" placeholder="Email"/>
                <input type="password" required name="pass" value="${passs}" placeholder="Password"/>
                <a href="/forgot-pass">Forgot your password?</a>
                <button type="submit">Login</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>Đăng nhập để nhận nhiều ưu đãi !</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello Babby Boy!</h1>
                    <p>Mình cùng đăng ký tài khoản nào</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    alert("${thongBao}")
</script>
<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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