<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Error</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f8d7da;
                    color: #721c24;
                    padding: 50px;
                    text-align: center;
                }

                .container {
                    border: 1px solid #f5c6cb;
                    background-color: #f1b0b7;
                    padding: 30px;
                    border-radius: 10px;
                    display: inline-block;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1>Error</h1>
                <p>Bạn không có quyền truy cập trang này.</p>
                <a href="<c:url value='/' />">Quay về trang chủ</a>
            </div>
        </body>

        </html>