<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .dropdown-toggle-no-caret::after {
        display: none !important;
    }

</style>
<section class="container" style="background-color: #d6cccc;height: 50px;border-radius: 50px">
    <div class="row">
        <div class="col-2"
             style="font-weight: bold;font-size: 30px;display: flex;justify-content: center;align-items: center"><a
                style="text-decoration: none;color: #100e0e" href="/home">ADIDAS</a></div>
        <div class="col-9" style="font-size: 20px">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="/contact">Contact</a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.account.role.equals('ADMIN')}">
                        <%--                        dropdown admin--%>
                        <div class="dropdown">
                            <a class="btn dropdown-toggle" type="button" data-toggle="dropdown"
                               style="font-size: 20px;color: #4f72e0">
                                Mange
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/manage-product">Manage Product</a></li>
                                <li><a class="dropdown-item" href="/thong-ke">Top 10 Best Sale</a></li>
                                <li><a class="dropdown-item" href="/top-10-long-stock">Top 10 Long In Stock</a></li>
                            </ul>
                        </div>
                        <%--                        dropdown admin--%>
                        <%--                        profile--%>
                        <div class="dropdown">
                            <a class="btn dropdown-toggle dropdown-toggle-no-caret" type="button"
                               data-toggle="dropdown">
                                <div class="d-flex justify-content-center align-items-center rounded-circle"
                                     style="width: 40px; height: 40px; background-color: gray;">
                                    <img src="../../../static/${sessionScope.account.image}" alt="Hình ảnh"
                                         class="rounded-circle"
                                         style="width: 100%; height: 100%; object-fit: cover;">
                                </div>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/profile">Profile</a></li>
                                <li><a class="dropdown-item" href="/don-mua">Đơn đã mua</a></li>
                                <li><a class="dropdown-item" href="/change-password">Change Password</a></li>
                                <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            </ul>
                        </div>
                        <%--Profile--%>
                    </c:when>
                    <c:when test="${sessionScope.account.role.equals('CLIENT')}">
                        <%--                        profile--%>
                        <div class="dropdown">
                            <a class="btn dropdown-toggle dropdown-toggle-no-caret" type="button"
                               data-toggle="dropdown">
                                <div class="d-flex justify-content-center align-items-center rounded-circle"
                                     style="width: 40px; height: 40px; background-color: gray;">
                                    <img src="../../../static/${sessionScope.account.image}" alt="Hình ảnh"
                                         class="rounded-circle"
                                         style="width: 100%; height: 100%; object-fit: cover;">
                                </div>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/profile">Profile</a></li>
                                <li><a class="dropdown-item" href="/don-mua">Đơn đã mua</a></li>
                                <li><a class="dropdown-item" href="/change-password">Change Password</a></li>
                                <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            </ul>
                        </div>
                        <%--Profile--%>

                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="/login">Login</a>
                        </li>
                    </c:otherwise>
                </c:choose>


            </ul>
        </div>
        <div class="col-1" style="margin-top: 5px">
            <a class="btn" href="/cart" type="button" style="background-color: white;border-radius: 30px">
                <i class="fa fa-shopping-cart" style="color: black"></i>
                <span class="badge badge-light" style="color: red">${soLuong}</span>
            </a></div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>


