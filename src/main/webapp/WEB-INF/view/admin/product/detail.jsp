<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Laptopshop - Dự án laptopshop" />
    <meta name="author" content="Laptopshop" />
    <title>Dashboard - Product Detail</title>

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
                    <li class="breadcrumb-item active">Product Detail</li>
                </ol>

                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <h3 class="text-center mb-4">Product Detail</h3>

                            <div class="card shadow">
                                <img class="card-img-top" src="${product.image.startsWith('http') ? product.image : '/images/product/'' += product.image}" alt="Product image">

                                <div class="card-body">
                                    <h5 class="card-title">${product.name}</h5>
                                    <ul class="list-group list-group-flush mb-3">
                                        <li class="list-group-item"><strong>ID:</strong> ${product.id}</li>
                                        <li class="list-group-item"><strong>Price:</strong>
                                            <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" /> VND
                                        </li>
                                        <li class="list-group-item"><strong>Factory:</strong> ${product.factory}</li>
                                    </ul>

                                    <a href="/admin/product" class="btn btn-success">Back</a>
                                </div>
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
