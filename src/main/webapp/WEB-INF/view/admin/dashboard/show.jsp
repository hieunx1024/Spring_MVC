<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Dashboard - Laptopshop</title>

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        window.addEventListener('load', function () {
            var ctx = document.getElementById("salesChart").getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: [
                        "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4",
                        "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8",
                        "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"
                    ],
                    datasets: [{
                        label: 'Doanh số (triệu VNĐ)',
                        data: [
                            <c:out value="${salesMonth1 != null ? salesMonth1 : 0}" />,
                            <c:out value="${salesMonth2 != null ? salesMonth2 : 0}" />,
                            <c:out value="${salesMonth3 != null ? salesMonth3 : 0}" />,
                            <c:out value="${salesMonth4 != null ? salesMonth4 : 0}" />,
                            <c:out value="${salesMonth5 != null ? salesMonth5 : 0}" />,
                            <c:out value="${salesMonth6 != null ? salesMonth6 : 0}" />,
                            <c:out value="${salesMonth7 != null ? salesMonth7 : 0}" />,
                            <c:out value="${salesMonth8 != null ? salesMonth8 : 0}" />,
                            <c:out value="${salesMonth9 != null ? salesMonth9 : 0}" />,
                            <c:out value="${salesMonth10 != null ? salesMonth10 : 0}" />,
                            <c:out value="${salesMonth11 != null ? salesMonth11 : 0}" />,
                            <c:out value="${salesMonth12 != null ? salesMonth12 : 0}" />
                        ],


                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
    </script>

</head>

<body class="sb-nav-fixed">
<jsp:include page="..\layout\header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="..\layout\sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">Số lượng tài khoản (${countUsers})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/user">Xem chi tiết</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">Số lượng sản phẩm (${countProducts})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/product">Xem chi tiết</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body">Số lượng đơn đặt hàng (${countOrders})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/order">Xem chi tiết</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Biểu đồ doanh số -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Thống kê doanh thu
                    </div>
                    <div class="card-body">
                        <canvas id="salesChart" width="100%" height="300"></canvas>
                    </div>
                </div>

            </div>
        </main>
        <jsp:include page="..\layout\footer.jsp" />
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>

</html>
