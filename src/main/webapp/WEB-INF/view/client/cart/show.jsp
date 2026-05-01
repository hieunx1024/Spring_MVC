<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Giỏ hàng - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Chi Tiết Giỏ Hàng</li>
                                    </ol>
                                </nav>
                            </div>
                            <c:choose>
                                <c:when test="${empty cartDetails}">
                                    <div class="text-center py-5 bg-white rounded-4 shadow-sm my-5" style="border: 2px dashed #e2e8f0;">
                                        <div class="mb-4 mt-3">
                                            <i class="fas fa-shopping-cart text-muted" style="font-size: 80px; opacity: 0.3;"></i>
                                        </div>
                                        <h3 class="text-dark fw-bold mb-3">Giỏ hàng của bạn đang trống</h3>
                                        <p class="text-secondary mb-4">Chưa có sản phẩm nào trong giỏ hàng. Hãy quay lại cửa hàng để chọn mua nhé!</p>
                                        <a href="/" class="btn btn-primary rounded-pill py-3 px-5 fw-bold mb-3 shadow-sm">
                                            <i class="fas fa-shopping-bag me-2"></i>Tiếp tục mua sắm
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="table-responsive bg-white rounded-4 shadow-sm p-4 mb-5">
                                        <table class="table table-hover align-middle">
                                            <thead class="bg-light">
                                                <tr>
                                                    <th scope="col" class="text-uppercase text-secondary text-sm font-weight-bolder">Sản phẩm</th>
                                                    <th scope="col" class="text-uppercase text-secondary text-sm font-weight-bolder">Tên</th>
                                                    <th scope="col" class="text-uppercase text-secondary text-sm font-weight-bolder">Giá cả</th>
                                                    <th scope="col" class="text-uppercase text-secondary text-sm font-weight-bolder">Số lượng</th>
                                                    <th scope="col" class="text-uppercase text-secondary text-sm font-weight-bolder">Thành tiền</th>
                                                    <th scope="col" class="text-uppercase text-secondary text-sm font-weight-bolder">Xử lý</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="d-flex align-items-center">
                                                                <img src="${cartDetail.product.image.startsWith('http') ? cartDetail.product.image : '/images/product/'.concat(cartDetail.product.image)}"
                                                                    class="img-fluid rounded"
                                                                    style="width: 80px; height: 80px; object-fit: contain;" alt="">
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <p class="mb-0 fw-bold text-dark">
                                                                <a href="/product/${cartDetail.product.id}" target="_blank" class="text-decoration-none text-dark">
                                                                    ${cartDetail.product.name}
                                                                </a>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 text-danger fw-semibold">
                                                                <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <div class="input-group quantity" style="width: 120px;">
                                                                <div class="input-group-btn">
                                                                    <button
                                                                        class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                        <i class="fa fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <input type="text"
                                                                    class="form-control form-control-sm text-center border-0 bg-transparent fw-bold"
                                                                    value="${cartDetail.quantity}"
                                                                    data-cart-detail-id="${cartDetail.id}"
                                                                    data-cart-detail-price="${cartDetail.price}"
                                                                    data-cart-detail-index="${status.index}">
                                                                <div class="input-group-btn">
                                                                    <button
                                                                        class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 text-danger fw-bold" data-cart-detail-id="${cartDetail.id}">
                                                                <fmt:formatNumber type="number"
                                                                    value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button class="btn btn-danger btn-sm rounded-circle shadow-sm" style="width: 35px; height: 35px;">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="mt-4 row g-4 justify-content-end">
                                        <div class="col-12 col-md-6 col-lg-5">
                                            <div class="bg-white rounded-4 shadow-sm p-4">
                                                <h3 class="display-6 mb-4 fs-4 fw-bold text-dark border-bottom pb-3">Thông Tin Đơn Hàng</h3>
                                                <div class="d-flex justify-content-between mb-3">
                                                    <h5 class="mb-0 text-secondary fs-6">Tạm tính:</h5>
                                                    <p class="mb-0 fw-semibold text-dark" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="mb-0 text-secondary fs-6">Phí vận chuyển:</h5>
                                                    <p class="mb-0 fw-semibold text-dark">Miễn phí</p>
                                                </div>
                                                <div class="py-3 mb-4 border-top border-bottom d-flex justify-content-between align-items-center">
                                                    <h5 class="mb-0 text-dark fw-bold">Tổng số tiền:</h5>
                                                    <p class="mb-0 text-danger fs-4 fw-bold" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>
                                                <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <div style="display: none;">
                                                        <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                            varStatus="status">
                                                            <div class="mb-3">
                                                                <div class="form-group">
                                                                    <form:input class="form-control" type="hidden"
                                                                        value="${cartDetail.id}"
                                                                        path="cartDetails[${status.index}].id" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <form:input class="form-control" type="hidden"
                                                                        value="${cartDetail.quantity}"
                                                                        path="cartDetails[${status.index}].quantity" />
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                    <button class="btn btn-primary w-100 rounded-pill py-3 fw-bold text-uppercase shadow-sm">
                                                        Xác nhận thanh toán
                                                    </button>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <!-- Cart Page End -->


                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>