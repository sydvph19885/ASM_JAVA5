<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li class="nav-item">
                            <a class="nav-link" href="/manage-product">Manage Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/thong-ke">Statistical</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="/change-password">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Logout</a>
                        </li>

                        <%--Profile--%>
                        <a href="/profile">
                                    <div class="d-flex justify-content-center align-items-center rounded-circle"
                                         style="width: 40px; height: 40px; background-color: gray;">
                                        <img src="../../../static/${sessionScope.account.image}" alt="Hình ảnh"
                                             class="rounded-circle"
                                             style="width: 100%; height: 100%; object-fit: cover;">
                                    </div>
                        </a>
                        <%--Profile--%>
                    </c:when>
                    <c:when test="${sessionScope.account.role.equals('CLIENT')}">
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="/change-password">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Logout</a>
                        </li>
                        <%--Profile--%>
                        <a href="/profile">
                            <div class="d-flex justify-content-center align-items-center rounded-circle"
                                 style="width: 40px; height: 40px; background-color: gray;">
                                <img src="../../../static/${sessionScope.account.image}" alt="Hình ảnh"
                                     class="rounded-circle"
                                     style="width: 100%; height: 100%; object-fit: cover;">
                            </div>
                        </a>
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

<%--    <ul class="pagination">--%>
<%--        <c:if test="${sanPham.number > 0}">--%>
<%--            <li class="page-item">--%>
<%--                <a class="page-link" href="?page=${sanPham.number - 1}">Trang trước</a>--%>
<%--            </li>--%>
<%--        </c:if>--%>

<%--        <c:forEach var="page" begin="${sanPham.number - 2}" end="${sanPham.number + 2}"--%>
<%--                   varStatus="loop">--%>
<%--            <c:if test="${page >= 0 && page < sanPham.totalPages}">--%>
<%--                <li class="page-item ${page == sanPham.number ? 'active' : ''}">--%>
<%--                    <a class="page-link" href="?page=${page}">${page + 1}</a>--%>
<%--                </li>--%>
<%--            </c:if>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${sanPham.hasNext}">--%>
<%--            <li class="page-item">--%>
<%--                <a class="page-link" href="?page=${sanPham.nextPageable.pageNumber}">Trang sau</a>--%>
<%--            </li>--%>
<%--        </c:if>--%>
<%--    </ul>--%>

<%--//            if (!fileName.isEmpty()) {--%>
<%--//                String fileAnh = fileName.getOriginalFilename();--%>
<%--//                String url = servletContext.getRealPath("/WEB-INF/view/image/product/");--%>
<%--//                File file = new File(url + fileAnh);--%>
<%--//                fileName.transferTo(file);--%>
<%--////                String fileAnh = fileName.getOriginalFilename();--%>
<%--////                Resource resource = resourceLoader.getResource("classpath:/static/image/");--%>
<%--////               String directory = resource.getFile().getAbsolutePath();--%>
<%--////               File destinationFolder = new File(directory);--%>
<%--////               if(!destinationFolder.exists()){--%>
<%--////                   destinationFolder.mkdirs();--%>
<%--////               }--%>
<%--////               File destinationFile = new File(destinationFolder.getAbsolutePath());--%>
<%--////               fileName.transferTo(destinationFile);--%>
<%--//            }--%>