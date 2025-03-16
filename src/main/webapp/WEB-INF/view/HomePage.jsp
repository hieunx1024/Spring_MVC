<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Tech Store - Cửa hàng laptop chính hãng</title>

            <!-- Bootstrap CSS -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
            <!-- Font Awesome -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

            <style>
                /* Custom CSS */
                :root {
                    --primary-color: #3498db;
                    --secondary-color: #2c3e50;
                    --accent-color: #e74c3c;
                }

                body {
                    font-family: 'Segoe UI', Arial, sans-serif;
                }

                .navbar-brand {
                    font-weight: 700;
                    font-size: 1.5rem;
                }

                .top-bar {
                    background-color: var(--secondary-color);
                    color: white;
                    font-size: 0.9rem;
                }

                .hero-section {
                    background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('/api/placeholder/1400/600') center/cover no-repeat;
                    color: white;
                    padding: 100px 0;
                }

                .hero-title {
                    font-size: 3rem;
                    font-weight: 700;
                }

                .btn-primary {
                    background-color: var(--primary-color);
                    border-color: var(--primary-color);
                }

                .btn-primary:hover {
                    background-color: #2980b9;
                    border-color: #2980b9;
                }

                .card {
                    transition: transform 0.3s, box-shadow 0.3s;
                    margin-bottom: 20px;
                }

                .card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                }

                .discount-badge {
                    position: absolute;
                    top: 10px;
                    right: 10px;
                    background-color: var(--accent-color);
                    color: white;
                    padding: 5px 10px;
                    border-radius: 3px;
                    font-weight: 600;
                }

                .brand-section {
                    background-color: #f8f9fa;
                }

                .brand-item {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    height: 100px;
                    opacity: 0.7;
                    transition: opacity 0.3s;
                }

                .brand-item:hover {
                    opacity: 1;
                }

                .feature-icon {
                    font-size: 2.5rem;
                    color: var(--primary-color);
                    margin-bottom: 15px;
                }

                footer {
                    background-color: var(--secondary-color);
                    color: white;
                }

                .category-item {
                    text-decoration: none;
                    color: #333;
                    display: block;
                    padding: 15px;
                    border-radius: 5px;
                    text-align: center;
                    transition: background-color 0.3s;
                }

                .category-item:hover {
                    background-color: #f1f1f1;
                    color: var(--primary-color);
                }

                .category-icon {
                    font-size: 2rem;
                    margin-bottom: 10px;
                    color: var(--primary-color);
                }

                .sale-timer {
                    background-color: var(--accent-color);
                    color: white;
                    padding: 20px;
                    border-radius: 5px;
                    text-align: center;
                    margin-bottom: 30px;
                }

                .timer-box {
                    background-color: white;
                    color: var(--accent-color);
                    font-weight: 700;
                    font-size: 1.5rem;
                    padding: 10px;
                    border-radius: 5px;
                    margin: 0 5px;
                    display: inline-block;
                    min-width: 60px;
                }

                .timer-label {
                    font-size: 0.8rem;
                    display: block;
                }
            </style>
        </head>

        <body>
            <!-- Top Bar -->
            <div class="top-bar py-2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <i class="fas fa-phone-alt me-2"></i> Hotline: 1900 1234
                            <span class="mx-3">|</span>
                            <i class="fas fa-envelope me-2"></i> Email: support@techstore.vn
                        </div>
                        <div class="col-md-6 text-end">
                            <a href="#" class="text-white me-3"><i class="fas fa-truck me-1"></i> Kiểm tra đơn hàng</a>
                            <a href="#" class="text-white"><i class="fas fa-map-marker-alt me-1"></i> Hệ thống cửa
                                hàng</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm">
                <div class="container">
                    <a class="navbar-brand" href="#">TECH<span class="text-primary">STORE</span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Trang chủ</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown">
                                    Sản phẩm
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Laptop Gaming</a></li>
                                    <li><a class="dropdown-item" href="#">Laptop Văn phòng</a></li>
                                    <li><a class="dropdown-item" href="#">Macbook</a></li>
                                    <li><a class="dropdown-item" href="#">Phụ kiện</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Khuyến mãi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Hỗ trợ</a>
                            </li>
                        </ul>
                        <div class="d-flex">
                            <div class="input-group me-3">
                                <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm...">
                                <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                            </div>
                            <a href="#" class="btn btn-outline-secondary me-2"><i class="fas fa-user"></i></a>
                            <a href="#" class="btn btn-outline-secondary position-relative">
                                <i class="fas fa-shopping-cart"></i>
                                <span
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    3
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Hero Section -->
            <section class="hero-section">
                <div class="container text-center">
                    <h1 class="hero-title mb-4">NÂNG TẦM TRẢI NGHIỆM<br>VỚI LAPTOP CHÍNH HÃNG</h1>
                    <p class="lead mb-4">Khám phá các dòng laptop mới nhất với hiệu năng mạnh mẽ và thiết kế hiện đại
                    </p>
                    <div>
                        <a href="#" class="btn btn-primary btn-lg me-2">Mua ngay</a>
                        <a href="#" class="btn btn-outline-light btn-lg">Tìm hiểu thêm</a>
                    </div>
                </div>
            </section>

            <!-- Categories -->
            <section class="py-5">
                <div class="container">
                    <h2 class="text-center mb-5">Danh mục sản phẩm</h2>
                    <div class="row g-4">
                        <div class="col-6 col-md-3">
                            <a href="#" class="category-item">
                                <div class="category-icon">
                                    <i class="fas fa-gamepad"></i>
                                </div>
                                <h5>Laptop Gaming</h5>
                            </a>
                        </div>
                        <div class="col-6 col-md-3">
                            <a href="#" class="category-item">
                                <div class="category-icon">
                                    <i class="fas fa-briefcase"></i>
                                </div>
                                <h5>Laptop Văn phòng</h5>
                            </a>
                        </div>
                        <div class="col-6 col-md-3">
                            <a href="#" class="category-item">
                                <div class="category-icon">
                                    <i class="fab fa-apple"></i>
                                </div>
                                <h5>Macbook</h5>
                            </a>
                        </div>
                        <div class="col-6 col-md-3">
                            <a href="#" class="category-item">
                                <div class="category-icon">
                                    <i class="fas fa-paint-brush"></i>
                                </div>
                                <h5>Laptop Đồ họa</h5>
                            </a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Flash Sale -->
            <section class="py-5 bg-light">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="mb-0">Flash Sale</h2>
                        <div class="sale-timer">
                            <p class="mb-2">Kết thúc sau:</p>
                            <div>
                                <div class="timer-box">01<span class="timer-label">Ngày</span></div>
                                <div class="timer-box">12<span class="timer-label">Giờ</span></div>
                                <div class="timer-box">45<span class="timer-label">Phút</span></div>
                                <div class="timer-box">30<span class="timer-label">Giây</span></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="card h-100">
                                <div class="discount-badge">-20%</div>
                                <img src="/api/placeholder/300/200" class="card-img-top" alt="Laptop Gaming">
                                <div class="card-body">
                                    <h5 class="card-title">MSI Gaming GF63</h5>
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="text-warning me-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                        </div>
                                        <small class="text-muted">(120 đánh giá)</small>
                                    </div>
                                    <p class="card-text">Core i5-11400H, 8GB RAM, 512GB SSD, GTX 1650</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h5 class="text-danger m-0">19.990.000đ</h5>
                                        <span class="text-decoration-line-through ms-2 text-muted">24.990.000đ</span>
                                    </div>
                                    <a href="#" class="btn btn-primary w-100"><i
                                            class="fas fa-shopping-cart me-2"></i>Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="card h-100">
                                <div class="discount-badge">-15%</div>
                                <img src="/api/placeholder/300/200" class="card-img-top" alt="Dell Gaming">
                                <div class="card-body">
                                    <h5 class="card-title">Dell G15 5511</h5>
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="text-warning me-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                        <small class="text-muted">(95 đánh giá)</small>
                                    </div>
                                    <p class="card-text">Core i7-11800H, 16GB RAM, 512GB SSD, RTX 3050</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h5 class="text-danger m-0">25.490.000đ</h5>
                                        <span class="text-decoration-line-through ms-2 text-muted">29.990.000đ</span>
                                    </div>
                                    <a href="#" class="btn btn-primary w-100"><i
                                            class="fas fa-shopping-cart me-2"></i>Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </body>

        </html>