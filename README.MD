# 💻  LaptopShop - Spring MVC Web Project

Website bán laptop được xây dựng với mục đích học tập và demo đồ án cá nhân. Ứng dụng cho phép người dùng mua sắm laptop, quản lý đơn hàng và quản trị sản phẩm thông qua giao diện web.

---

## 🚀 Tính năng nổi bật

- 🔍 Xem danh sách laptop theo danh mục
- 🛒 Giỏ hàng (thêm, sửa, xoá)
- 📦 Đặt hàng và lưu lịch sử đơn hàng
- 🔐 Đăng nhập / Đăng ký người dùng
- 🧑‍💼 Quản trị sản phẩm và đơn hàng (Admin)
- 📊 Giao diện quản trị riêng biệt
- 🔎 Tìm kiếm sản phẩm theo tên hoặc giá

---

## 🛠️ Công nghệ sử dụng

| Thành phần     | Công nghệ             |
|----------------|------------------------|
| Backend        | Java, Spring MVC       |
| Frontend       | JSP, HTML, CSS, Bootstrap |
| ORM            | Hibernate / JPA        |
| Database       | MySQL                  |
| Build Tool     | Maven                  |
| Server         | Apache Tomcat          |

---

## 📁 Cấu trúc thư mục

src/ ├── config/             # Cấu hình Spring, Hibernate ├── controller/         # Bộ điều khiển xử lý request ├── dao/                # Tầng truy xuất dữ liệu ├── service/            # Xử lý nghiệp vụ ├── domain/             # Entity class (JPA) ├── utils/              # Tiện ích dùng chung └── webapp/ ├── WEB-INF/ │   └── views/      # Các file JSP (giao diện) └── assets/         # CSS, JS, ảnh

---

## ⚙️ Cài đặt và chạy dự án

### 1. Yêu cầu hệ thống

- Java 8 trở lên
- Apache Tomcat 9+
- MySQL 8.x
- Maven

### 2. Clone source code

3. Tạo cơ sở dữ liệu

CREATE DATABASE laptop_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

Import file laptop_store.sql trong thư mục /database vào MySQL để tạo bảng và dữ liệu mẫu.

4. Cấu hình kết nối MySQL

Chỉnh sửa trong src/main/webapp/WEB-INF/applicationContext.xml (hoặc hibernate.cfg.xml):

<property name="hibernate.connection.url">jdbc:mysql://localhost:3306/laptopshop</property>
<property name="hibernate.connection.username">root</property>
<property name="hibernate.connection.password">your_password</property>

5. Build và chạy ứng dụng

Mở bằng Eclipse, IntelliJ hoặc Spring Tool Suite

Build Maven: mvn clean install

Chạy trên Tomcat Server

Truy cập: http://localhost:8080/



---

🔐 Tài khoản mẫu

Người dùng

Email: user@gmail.com

Mật khẩu: 123456


Quản trị viên

Email: admin@gmail.com

Mật khẩu: 123456



---

📸 Ảnh minh hoạ

Trang chủ	Quản trị sản phẩm	Đơn hàng

		


> Bạn có thể thêm ảnh chụp màn hình vào thư mục screenshots/ và cập nhật đường dẫn ở trên.




---

🧠 Ghi chú

Đảm bảo Java và MySQL đang chạy đúng cổng

Chạy Tomcat đúng context /

Không lưu mật khẩu người dùng ở dạng plain-text (nếu triển khai thực tế)



---

📄 License

Dự án mã nguồn mở dành cho mục đích học tập. Không sử dụng vào thương mại trừ khi có sự cho phép.


---

🤝 Đóng góp

Mọi đóng góp đều được hoan nghênh! Hãy tạo pull request hoặc issue nếu bạn muốn cải tiến hệ thống.


---

© 2025 - LaptopShop Project by [hieunx1024]

---