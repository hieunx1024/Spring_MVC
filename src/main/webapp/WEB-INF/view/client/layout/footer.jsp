<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 py-5 mt-5 footer">
    <div class="container py-4">
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <h3 class="text-primary font-weight-bold mb-4">LaptopShop</h3>
                <p class="mb-4">Hệ thống phân phối Laptop chính hãng chuyên nghiệp hàng đầu Việt Nam. Cam kết chất lượng và dịch vụ tận tâm.</p>
                <div class="d-flex">
                    <a class="btn btn-outline-light btn-md-square rounded-circle me-2" href="#"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-md-square rounded-circle me-2" href="#"><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-outline-light btn-md-square rounded-circle me-2" href="#"><i class="fab fa-instagram"></i></a>
                    <a class="btn btn-outline-light btn-md-square rounded-circle me-2" href="#"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-4">Liên hệ</h4>
                <p><i class="fa fa-map-marker-alt me-2"></i>Tầng 12, Tòa nhà Tech, Hà Nội</p>
                <p><i class="fa fa-phone-alt me-2"></i>+012 345 67890</p>
                <p><i class="fa fa-envelope me-2"></i>support@laptopshop.vn</p>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-4">Đường dẫn nhanh</h4>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-white-50 mb-2 text-decoration-none" href="/"><i class="fa fa-angle-right me-2"></i>Trang chủ</a>
                    <a class="text-white-50 mb-2 text-decoration-none" href="/products"><i class="fa fa-angle-right me-2"></i>Sản phẩm</a>
                    <a class="text-white-50 mb-2 text-decoration-none" href="#"><i class="fa fa-angle-right me-2"></i>Về chúng tôi</a>
                    <a class="text-white-50 text-decoration-none" href="#"><i class="fa fa-angle-right me-2"></i>Tuyển dụng</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-4">Hỗ trợ khách hàng</h4>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-white-50 mb-2 text-decoration-none" href="#"><i class="fa fa-angle-right me-2"></i>Chính sách bảo hành</a>
                    <a class="text-white-50 mb-2 text-decoration-none" href="#"><i class="fa fa-angle-right me-2"></i>Chính sách đổi trả</a>
                    <a class="text-white-50 mb-2 text-decoration-none" href="#"><i class="fa fa-angle-right me-2"></i>Hướng dẫn mua hàng</a>
                    <a class="text-white-50 text-decoration-none" href="#"><i class="fa fa-angle-right me-2"></i>Câu hỏi thường gặp</a>
                </div>
            </div>
        </div>
        <div class="row pt-5 mt-4" style="border-top: 1px solid rgba(255,255,255,0.1);">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                &copy; 2026 <a href="#" class="text-white text-decoration-none">LaptopShop</a>. All rights reserved.
            </div>
            <div class="col-md-6 text-center text-md-end">
                <span class="text-white-50">Thiết kế và phát triển bởi <a href="https://github.com/hieunx1024" target="_blank" class="text-white text-decoration-none">Nguyễn Xuân Hiếu</a></span>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->

<!-- Chatbot UI Start -->
<div id="chatbot-container" class="position-fixed shadow" style="bottom: 90px; right: 30px; width: 350px; height: 450px; background: white; border-radius: 15px; display: none; flex-direction: column; z-index: 1050; border: 1px solid #ddd;">
    <div class="chatbot-header bg-primary text-white d-flex justify-content-between align-items-center p-3" style="border-radius: 15px 15px 0 0;">
        <h5 class="mb-0 text-white" style="font-size: 16px;"><i class="fas fa-robot me-2"></i> Trợ lý LaptopShop</h5>
        <button id="chatbot-close" class="btn btn-sm text-white"><i class="fas fa-times"></i></button>
    </div>
    <div id="chatbot-messages" class="chatbot-body p-3 flex-grow-1" style="overflow-y: auto; background: #f8f9fa;">
        <div class="mb-3">
            <span class="bg-white p-2 rounded shadow-sm d-inline-block" style="max-width: 85%; font-size: 14px;">Xin chào! Mình là trợ lý ảo của LaptopShop. Mình có thể giúp gì cho bạn?</span>
        </div>
    </div>
    <div class="chatbot-footer p-2 border-top bg-white d-flex" style="border-radius: 0 0 15px 15px;">
        <input type="text" id="chatbot-input" class="form-control me-2" placeholder="Nhập câu hỏi..." style="border-radius: 20px; font-size: 14px;">
        <button id="chatbot-send" class="btn btn-primary rounded-circle" style="width: 40px; height: 40px; flex-shrink: 0;"><i class="fas fa-paper-plane"></i></button>
    </div>
</div>

<button id="chatbot-toggle" class="btn btn-primary rounded-circle shadow" style="position: fixed; bottom: 30px; right: 90px; width: 50px; height: 50px; z-index: 1049; display: flex; align-items: center; justify-content: center;">
    <i class="fas fa-comment-dots fs-4"></i>
</button>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const chatContainer = document.getElementById("chatbot-container");
        const chatToggle = document.getElementById("chatbot-toggle");
        const chatClose = document.getElementById("chatbot-close");
        const chatSend = document.getElementById("chatbot-send");
        const chatInput = document.getElementById("chatbot-input");
        const chatMessages = document.getElementById("chatbot-messages");

        // Use standard CSRF logic if available on the page
        const csrfToken = document.querySelector('meta[name="_csrf"]')?.content || "";
        const csrfHeader = document.querySelector('meta[name="_csrf_header"]')?.content || "X-CSRF-TOKEN";

        chatToggle.addEventListener("click", () => {
            chatContainer.style.display = chatContainer.style.display === "none" || chatContainer.style.display === "" ? "flex" : "none";
        });

        chatClose.addEventListener("click", () => {
            chatContainer.style.display = "none";
        });

        function appendMessage(text, isUser) {
            const msgDiv = document.createElement("div");
            msgDiv.className = isUser ? "mb-3 text-end" : "mb-3 text-start";
            
            const msgSpan = document.createElement("span");
            msgSpan.className = isUser ? "bg-primary text-white p-2 rounded shadow-sm d-inline-block" : "bg-white text-dark p-2 rounded shadow-sm d-inline-block";
            msgSpan.style.maxWidth = "85%";
            msgSpan.style.fontSize = "14px";
            
            if (isUser) {
                msgSpan.textContent = text;
            } else {
                msgSpan.innerHTML = text; // Allow AI to send HTML links
            }
            
            msgDiv.appendChild(msgSpan);
            chatMessages.appendChild(msgDiv);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        async function sendMessage() {
            const text = chatInput.value.trim();
            if (!text) return;
            
            appendMessage(text, true);
            chatInput.value = "";
            chatInput.disabled = true;

            const typingDiv = document.createElement("div");
            typingDiv.className = "mb-3 text-start text-muted small";
            typingDiv.textContent = "Đang trả lời...";
            typingDiv.id = "chatbot-typing";
            chatMessages.appendChild(typingDiv);
            chatMessages.scrollTop = chatMessages.scrollHeight;

            try {
                const headers = {
                    "Content-Type": "application/json"
                };
                if (csrfToken && csrfHeader) {
                    headers[csrfHeader] = csrfToken;
                }

                const response = await fetch("/api/chat", {
                    method: "POST",
                    headers: headers,
                    body: JSON.stringify({ message: text })
                });

                const data = await response.json();
                document.getElementById("chatbot-typing").remove();
                appendMessage(data.reply, false);
            } catch (error) {
                document.getElementById("chatbot-typing").remove();
                appendMessage("Lỗi kết nối tới máy chủ.", false);
            }
            chatInput.disabled = false;
            chatInput.focus();
        }

        chatSend.addEventListener("click", sendMessage);
        chatInput.addEventListener("keypress", function (e) {
            if (e.key === "Enter") sendMessage();
        });
    });
</script>
<!-- Chatbot UI End -->

<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top text-white">
    <i class="fa fa-arrow-up"></i>
</a>