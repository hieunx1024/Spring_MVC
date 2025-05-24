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
                    <meta name="description" content="Laptopshop - Dự án laptopshop" />
                    <meta name="author" content="Laptopshop" />
                    <title>Dashboard -Product</title>
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
                                    <div class="">
                                        <div class="row">
                                            <div class=" mx-auto">
                                                <h3>Table Product Detail</h3>
                                                <hr>
                                                <div class="card" style="width: 18rem;">
                                                    <div class="card-header">
                                                        Detail
                                                    </div>
                                                    <div class="card" style="width: 100%">
                                                        <img class="card-img-top" src="/images/product/${product.image}"
                                                            alt="Card image cap">

                                                        <div class="card-header">
                                                            Product infomation
                                                            <ul class="list-group list-group-flush">
                                                                <li class="list-group-item">ID: ${product.id}</li>
                                                                <li class="list-group-item">Name: ${product.name}</li>
                                                                <li class="list-group-item">
                                                                    Price:
                                                                    <fmt:formatNumber value="${product.price}"
                                                                        type="number" groupingUsed="true" /> VND
                                                                </li>
                                                                <li class="list-group-item">Factory: ${product.factory}
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <a href="/admin/product" class="btn btn-success mt-3">Back</a>

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