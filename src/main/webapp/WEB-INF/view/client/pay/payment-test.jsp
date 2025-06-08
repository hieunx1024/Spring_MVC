<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Test Thanh toán VNPay</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                text-align: center;
            }

            .payment-form {
                background-color: #f8f9fa;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .btn-payment {
                background-color: #007bff;
                color: white;
                padding: 15px 30px;
                font-size: 18px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
                margin: 10px;
            }

            .btn-payment:hover {
                background-color: #0056b3;
            }

            .amount {
                font-size: 24px;
                color: #28a745;
                font-weight: bold;
                margin: 20px 0;
            }
        </style>
    </head>

    <body>
        <div class="payment-form">
            <h1>Test Thanh toán VNPay</h1>
            <p>Đây là trang test tích hợp VNPay</p>

            <div class="amount">
                Số tiền: 100,000 VNĐ
            </div>

            <p>Nhấn nút bên dưới để chuyển đến trang thanh toán VNPay</p>

            <a href="/pay" class="btn-payment">
                Thanh toán ngay
            </a>

            <div style="margin-top: 30px; font-size: 14px; color: #6c757d;">
                <p><strong>Thông tin test VNPay Sandbox:</strong></p>
                <p>Số thẻ: 9704198526191432198</p>
                <p>Tên chủ thẻ: NGUYEN VAN A</p>
                <p>Ngày phát hành: 07/15</p>
                <p>Mật khẩu OTP: 123456</p>
            </div>
        </div>
    </body>

    </html>