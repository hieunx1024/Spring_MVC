<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Kết quả thanh toán</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    max-width: 800px;
                    margin: 50px auto;
                    padding: 20px;
                }

                .success {
                    color: green;
                    background-color: #d4edda;
                    border: 1px solid #c3e6cb;
                    padding: 15px;
                    border-radius: 5px;
                }

                .failed,
                .invalid,
                .error {
                    color: red;
                    background-color: #f8d7da;
                    border: 1px solid #f5c6cb;
                    padding: 15px;
                    border-radius: 5px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                }

                th,
                td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                }

                th {
                    background-color: #f2f2f2;
                }

                .btn {
                    display: inline-block;
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: white;
                    text-decoration: none;
                    border-radius: 5px;
                    margin-top: 20px;
                }

                .btn:hover {
                    background-color: #0056b3;
                }
            </style>
        </head>

        <body>
            <h1>Kết quả thanh toán VNPay</h1>

            <c:choose>
                <c:when test="${status == 'success'}">
                    <div class="success">
                        <h2>${message}</h2>
                        <p>Giao dịch của bạn đã được xử lý thành công!</p>
                        <p>Trang sẽ tự động chuyển về trang chủ sau <span id="countdown">30</span> giây.</p>
                    </div>
                </c:when>
                <c:when test="${status == 'failed'}">
                    <div class="failed">
                        <h2>${message}</h2>
                        <p>Giao dịch không thành công. Vui lòng thử lại sau.</p>
                    </div>
                </c:when>
                <c:when test="${status == 'invalid'}">
                    <div class="invalid">
                        <h2>${message}</h2>
                        <p>Có lỗi xảy ra trong quá trình xử lý giao dịch.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="error">
                        <h2>${message}</h2>
                        <p>Không thể xử lý kết quả thanh toán.</p>
                    </div>
                </c:otherwise>
            </c:choose>

            <h3>Chi tiết giao dịch:</h3>
            <table>
                <thead>
                    <tr>
                        <th>Tham số</th>
                        <th>Giá trị</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${fields}" var="field">
                        <tr>
                            <td>${field.key}</td>
                            <td>${field.value}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div>
                <a href="/" class="btn">Quay lại trang chủ</a>
                <a href="/pay" class="btn" style="background-color: #28a745;">Thanh toán lại</a>
            </div>

            <c:if test="${status == 'success'}">
                <script>
                    // Auto redirect sau 30 giây nếu thành công
                    setTimeout(function () {
                        window.location.href = '/';
                    }, 30000);

                    // Hiển thị countdown
                    let countdown = 30;
                    const countdownElement = document.getElementById('countdown');
                    const timer = setInterval(function () {
                        countdown--;
                        if (countdownElement) {
                            countdownElement.textContent = countdown;
                        }
                        if (countdown <= 0) {
                            clearInterval(timer);
                        }
                    }, 1000);
                </script>
            </c:if>
        </body>

        </html>