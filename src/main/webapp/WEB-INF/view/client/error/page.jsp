<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>${statusCode} - Lỗi</title>
    <!-- Bootstrap and FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .error-card {
            background: #ffffff;
            border-radius: 24px;
            box-shadow: 0 20px 40px -15px rgba(0,0,0,0.05);
            padding: 4rem 3rem;
            text-align: center;
            max-width: 600px;
            width: 90%;
            position: relative;
            overflow: hidden;
        }
        .error-card::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 6px;
            background: linear-gradient(90deg, #2563eb, #38bdf8);
        }
        .error-code {
            font-size: 8rem;
            font-weight: 800;
            color: #0f172a;
            line-height: 1;
            margin-bottom: 1rem;
            letter-spacing: -2px;
        }
        .error-code span {
            color: #2563eb;
        }
        .error-title {
            font-size: 2rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 1rem;
        }
        .error-desc {
            color: #64748b;
            font-size: 1.1rem;
            margin-bottom: 2.5rem;
            line-height: 1.6;
        }
        .btn-home {
            background-color: #2563eb;
            color: white;
            border: none;
            padding: 12px 32px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        .btn-home:hover {
            background-color: #1d4ed8;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -10px rgba(37, 99, 235, 0.5);
            color: white;
        }
    </style>
</head>
<body>
    <div class="error-card">
        <div class="error-code">
            ${String.valueOf(statusCode).substring(0,2)}<span>${String.valueOf(statusCode).substring(2)}</span>
        </div>
        
        <c:choose>
            <c:when test="${statusCode == 404}">
                <div class="error-title">Trang không tồn tại</div>
            </c:when>
            <c:when test="${statusCode == 403}">
                <div class="error-title">Truy cập bị từ chối</div>
            </c:when>
            <c:otherwise>
                <div class="error-title">Đã xảy ra lỗi</div>
            </c:otherwise>
        </c:choose>
        
        <div class="error-desc">${errorMsg}</div>
        
        <a href="/" class="btn-home">
            <i class="fas fa-home"></i> Trở về Trang chủ
        </a>
    </div>
</body>
</html>
