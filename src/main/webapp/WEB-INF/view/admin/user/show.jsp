<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - User</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">User</li>
                                </ol>

                                <div class="mt-4">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <h3 class="m-0 text-dark fw-bold">Danh sách người dùng</h3>
                                                <a href="/admin/user/create" class="btn btn-primary px-4 py-2 fw-semibold shadow-sm">
                                                    <i class="fas fa-plus me-2"></i>Tạo người dùng mới
                                                </a>
                                            </div>
                                            
                                            <div class="table-responsive bg-white rounded-4 shadow-sm p-4">
                                                <table class="table table-hover align-middle mb-0">
                                                    <thead class="bg-light">
                                                        <tr>
                                                            <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">ID</th>
                                                            <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">Email</th>
                                                            <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">Họ tên</th>
                                                            <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7">Role</th>
                                                            <th class="border-bottom-0 text-uppercase text-secondary text-sm font-weight-bolder opacity-7 text-center">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="user" items="${users}">
                                                            <tr>
                                                                <th class="text-secondary">${user.id}</th>
                                                                <td class="text-dark fw-medium">${user.email}</td>
                                                                <td class="text-dark">${user.fullName}</td>
                                                                <td><span class="badge bg-secondary px-3 py-2">${user.role.name}</span></td>
                                                                <td>
                                                                    <div class="d-flex justify-content-center gap-2">
                                                                        <a href="/admin/user/view/${user.id}" class="btn btn-info btn-sm text-white px-3"><i class="fas fa-eye"></i> Xem</a>
                                                                        <a href="/admin/user/update/${user.id}" class="btn btn-warning btn-sm text-white px-3"><i class="fas fa-edit"></i> Sửa</a>
                                                                        <a href="/admin/user/delete/${user.id}" class="btn btn-danger btn-sm text-white px-3"><i class="fas fa-trash"></i> Xóa</a>
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