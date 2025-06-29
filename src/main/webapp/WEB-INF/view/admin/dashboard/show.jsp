<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Laptopshop</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script>

                    var colors = ['#007bff', '#28a745', '#333333', '#c3e6cb', '#dc3545', '#6c757d'];

                    /* large line chart */
                    var chLine = document.getElementById("chLine");
                    var chartData = {
                        labels: ["S", "M", "T", "W", "T", "F", "S"],
                        datasets: [{
                            data: [589, 445, 483, 503, 689, 692, 634],
                            backgroundColor: 'transparent',
                            borderColor: colors[0],
                            borderWidth: 4,
                            pointBackgroundColor: colors[0]
                        }

                        ]
                    };
                    if (chLine) {
                        new Chart(chLine, {
                            type: 'line',
                            data: chartData,
                            options: {
                                scales: {
                                    xAxes: [{
                                        ticks: {
                                            beginAtZero: false
                                        }
                                    }]
                                },
                                legend: {
                                    display: false
                                },
                                responsive: true
                            }
                        });
                    }

                    /* large pie/donut chart */
                    var chPie = document.getElementById("chPie");
                    if (chPie) {
                        new Chart(chPie, {
                            type: 'pie',
                            data: {
                                labels: ['Desktop', 'Phone', 'Tablet', 'Unknown'],
                                datasets: [
                                    {
                                        backgroundColor: [colors[1], colors[0], colors[2], colors[5]],
                                        borderWidth: 0,
                                        data: [50, 40, 15, 5]
                                    }
                                ]
                            },
                            plugins: [{
                                beforeDraw: function (chart) {
                                    var width = chart.chart.width,
                                        height = chart.chart.height,
                                        ctx = chart.chart.ctx;
                                    ctx.restore();
                                    var fontSize = (height / 70).toFixed(2);
                                    ctx.font = fontSize + "em sans-serif";
                                    ctx.textBaseline = "middle";
                                    var text = chart.config.data.datasets[0].data[0] + "%",
                                        textX = Math.round((width - ctx.measureText(text).width) / 2),
                                        textY = height / 2;
                                    ctx.fillText(text, textX, textY);
                                    ctx.save();
                                }
                            }],
                            options: { layout: { padding: 0 }, legend: { display: false }, cutoutPercentage: 80 }
                        });
                    }

                    /* bar chart */
                    var chBar = document.getElementById("chBar");
                    if (chBar) {
                        new Chart(chBar, {
                            type: 'bar',
                            data: {
                                labels: ["S", "M", "T", "W", "T", "F", "S"],
                                datasets: [{
                                    data: [589, 445, 483, 503, 689, 692, 634],
                                    backgroundColor: colors[0]
                                },
                                {
                                    data: [639, 465, 493, 478, 589, 632, 674],
                                    backgroundColor: colors[1]
                                }]
                            },
                            options: {
                                legend: {
                                    display: false
                                },
                                scales: {
                                    xAxes: [{
                                        barPercentage: 0.4,
                                        categoryPercentage: 0.5
                                    }]
                                }
                            }
                        });
                    }

                    /* 3 donut charts */
                    var donutOptions = {
                        cutoutPercentage: 85,
                        legend: { position: 'bottom', padding: 5, labels: { pointStyle: 'circle', usePointStyle: true } }
                    };

                    // donut 1
                    var chDonutData1 = {
                        labels: ['Bootstrap', 'Popper', 'Other'],
                        datasets: [
                            {
                                backgroundColor: colors.slice(0, 3),
                                borderWidth: 0,
                                data: [74, 11, 40]
                            }
                        ]
                    };

                    var chDonut1 = document.getElementById("chDonut1");
                    if (chDonut1) {
                        new Chart(chDonut1, {
                            type: 'pie',
                            data: chDonutData1,
                            options: donutOptions
                        });
                    }

                    // donut 2
                    var chDonutData2 = {
                        labels: ['Wips', 'Pops', 'Dags'],
                        datasets: [
                            {
                                backgroundColor: colors.slice(0, 3),
                                borderWidth: 0,
                                data: [40, 45, 30]
                            }
                        ]
                    };
                    var chDonut2 = document.getElementById("chDonut2");
                    if (chDonut2) {
                        new Chart(chDonut2, {
                            type: 'pie',
                            data: chDonutData2,
                            options: donutOptions
                        });
                    }

                    // donut 3
                    var chDonutData3 = {
                        labels: ['Angular', 'React', 'Other'],
                        datasets: [
                            {
                                backgroundColor: colors.slice(0, 3),
                                borderWidth: 0,
                                data: [21, 45, 55, 33]
                            }
                        ]
                    };
                    var chDonut3 = document.getElementById("chDonut3");
                    if (chDonut3) {
                        new Chart(chDonut3, {
                            type: 'pie',
                            data: chDonutData3,
                            options: donutOptions
                        });
                    }

                    /* 3 line charts */
                    var lineOptions = {
                        legend: { display: false },
                        tooltips: { interest: false, bodyFontSize: 11, titleFontSize: 11 },
                        scales: {
                            xAxes: [
                                {
                                    ticks: {
                                        display: false
                                    },
                                    gridLines: {
                                        display: false,
                                        drawBorder: false
                                    }
                                }
                            ],
                            yAxes: [{ display: false }]
                        },
                        layout: {
                            padding: {
                                left: 6,
                                right: 6,
                                top: 4,
                                bottom: 6
                            }
                        }
                    };

                    var chLine1 = document.getElementById("chLine1");
                    if (chLine1) {
                        new Chart(chLine1, {
                            type: 'line',
                            data: {
                                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
                                datasets: [
                                    {
                                        backgroundColor: '#ffffff',
                                        borderColor: '#ffffff',
                                        data: [10, 11, 4, 11, 4],
                                        fill: false
                                    }
                                ]
                            },
                            options: lineOptions
                        });
                    }
                    var chLine2 = document.getElementById("chLine2");
                    if (chLine2) {
                        new Chart(chLine2, {
                            type: 'line',
                            data: {
                                labels: ['A', 'B', 'C', 'D', 'E'],
                                datasets: [
                                    {
                                        backgroundColor: '#ffffff',
                                        borderColor: '#ffffff',
                                        data: [4, 5, 7, 13, 12],
                                        fill: false
                                    }
                                ]
                            },
                            options: lineOptions
                        });
                    }

                    var chLine3 = document.getElementById("chLine3");
                    if (chLine3) {
                        new Chart(chLine3, {
                            type: 'line',
                            data: {
                                labels: ['Pos', 'Neg', 'Nue', 'Other', 'Unknown'],
                                datasets: [
                                    {
                                        backgroundColor: '#ffffff',
                                        borderColor: '#ffffff',
                                        data: [13, 15, 10, 9, 14],
                                        fill: false
                                    }
                                ]
                            },
                            options: lineOptions
                        });
                    }
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
                                            <div class="card-body">Số lượng tài khoản</div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link" href="/admin/user">Xem chi tiết</a>
                                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-md-6">
                                        <div class="card bg-success text-white mb-4">
                                            <div class="card-body">Số lượng sản phẩm</div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link" href="/admin/product">Xem chi tiết</a>
                                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-md-6">
                                        <div class="card bg-danger text-white mb-4">
                                            <div class="card-body">Số lượng đơn đặt hàng</div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link" href="/admin/order">Xem chi tiết</a>
                                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
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
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="assets/demo/chart-area-demo.js"></script>
                <script src="assets/demo/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>