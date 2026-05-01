<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                    <meta name="author" content="Hỏi Dân IT" />
                    <title>Dashboard - Product</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Dashboard</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item "><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Product</li>
                                    </ol>
                                    <div>Product</div>
                                    <div class=" mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <h3 class="m-0 text-dark fw-bold">Danh sách Sản phẩm</h3>
                                                    <a href="/admin/product/create" class="btn btn-primary px-4 py-2 fw-semibold shadow-sm">
                                                        <i class="fas fa-plus me-2"></i>Tạo sản phẩm mới
                                                    </a>
                                                </div>
                                                
                                                <div class="table-responsive bg-white rounded-4 shadow-sm p-4">
                                                    <table class="table table-hover align-middle mb-0">
                                                        <thead class="bg-light">
                                                            <tr>
                                                                <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">ID</th>
                                                                <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">Name</th>
                                                                <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">Price</th>
                                                                <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">Unit</th>
                                                                <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">Factory</th>
                                                                <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7 text-center">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="product" items="${products}">
                                                                <tr>
                                                                    <th class="text-secondary">${product.id}</th>
                                                                    <td class="fw-medium text-dark">${product.name}</td>
                                                                    <td>
                                                                        <span class="badge bg-light text-dark border px-3 py-2">
                                                                            <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />
                                                                        </span>
                                                                    </td>
                                                                    <td class="text-secondary">VND</td>
                                                                    <td class="text-secondary">${product.factory}</td>
                                                                    <td>
                                                                        <div class="d-flex justify-content-center gap-2">
                                                                            <a href="/admin/product/view/${product.id}" class="btn btn-info btn-sm text-white px-3"><i class="fas fa-eye"></i> Xem</a>
                                                                            <a href="/admin/product/update/${product.id}" class="btn btn-warning btn-sm text-white px-3"><i class="fas fa-edit"></i> Sửa</a>
                                                                            <a href="/admin/product/delete/${product.id}" class="btn btn-danger btn-sm text-white px-3"><i class="fas fa-trash"></i> Xóa</a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item">
                                                <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                   href="/admin/product?page=${currentPage - 1}"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                <li class="page-item">
                                                    <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                       href="/admin/product?page=${loop.index + 1}">
                                                            ${loop.index + 1}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                   href="/admin/product?page=${currentPage + 1}"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>