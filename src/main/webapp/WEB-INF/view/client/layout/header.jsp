<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <h1 class="text-primary display-6">Laptopshop</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white justify-content-between mx-5" id="navbarCollapse">
                        <div class="navbar-nav">
                            <a href="/" class="nav-item nav-link active">Trang Chủ</a>
                            <a href="/products" class="nav-item nav-link">Sản Phẩm</a>

                        </div>
                        <div class="d-flex m-3 me-0">
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <a href="/cart" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span
                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;" id="sumCart">
                                        ${sessionScope.sum}
                                    </span>
                                </a>
                                <div class="dropdown my-auto">
                                    <a href="#" class="dropdown d-flex align-items-center text-decoration-none" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.avatar and sessionScope.avatar != ''}">
                                                <img src="${sessionScope.avatar.startsWith('http') ? sessionScope.avatar : '/images/avatar/'.concat(sessionScope.avatar)}" class="rounded-circle shadow-sm" style="width: 40px; height: 40px; object-fit: cover; border: 2px solid var(--bs-primary);" alt="Avatar">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="rounded-circle bg-light shadow-sm d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; border: 2px solid var(--bs-primary);">
                                                    <i class="fas fa-user text-primary"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="ms-2 fw-bold text-dark d-none d-md-block"><c:out value="${sessionScope.fullName}" /></span>
                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-3" aria-labelledby="dropdownMenuLink" style="min-width: 250px; border-radius: 12px; padding: 0;">
                                        <li class="d-flex align-items-center flex-column p-4 bg-light" style="border-radius: 12px 12px 0 0;">
                                            <c:choose>
                                                <c:when test="${not empty sessionScope.avatar and sessionScope.avatar != ''}">
                                                    <img src="${sessionScope.avatar.startsWith('http') ? sessionScope.avatar : '/images/avatar/'.concat(sessionScope.avatar)}" class="rounded-circle shadow" style="width: 80px; height: 80px; object-fit: cover; border: 3px solid white;" alt="Avatar">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="rounded-circle bg-white shadow d-flex align-items-center justify-content-center" style="width: 80px; height: 80px; border: 3px solid white;">
                                                        <i class="fas fa-user fa-3x text-secondary"></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="text-center mt-3">
                                                <h6 class="mb-0 fw-bold"><c:out value="${sessionScope.fullName}" /></h6>
                                                <small class="text-muted"><c:out value="${sessionScope.email}" /></small>
                                            </div>
                                        </li>
                                        <li><hr class="dropdown-divider m-0"></li>
                                        <li><a class="dropdown-item py-2 px-3 mt-2" href="#"><i class="fas fa-user-cog me-2 text-muted"></i>Quản lý tài khoản</a></li>
                                        <li><a class="dropdown-item py-2 px-3" href="/order-history"><i class="fas fa-history me-2 text-muted"></i>Lịch sử mua hàng</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                            <form method="post" action="/logout" class="m-0 p-0 mb-2">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <button class="dropdown-item text-danger py-2 px-3 fw-bold"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" class="a-login position-relative me-4 my-auto">
                                    Đăng nhập
                                </a>
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->