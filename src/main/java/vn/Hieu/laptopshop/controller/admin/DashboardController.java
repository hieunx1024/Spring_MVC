package vn.Hieu.laptopshop.controller.admin;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.Hieu.laptopshop.domain.Order;
import vn.Hieu.laptopshop.service.OrderService;
import vn.Hieu.laptopshop.service.UserService;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
public class DashboardController {

    private final OrderService orderService;
    private final UserService userService;

    public DashboardController(OrderService orderService, UserService userService) {
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        // Add attributes for user and product counts
        model.addAttribute("countUsers", userService.getCountUser());
        model.addAttribute("countProducts", userService.getCountProduct());
        model.addAttribute("countOrders", userService.getCountOrder());

        // Add monthly revenue data (12 months)
        for (int month = 1; month <= 12; month++) {
            double revenue = orderService.getRevenueByMonth(month); // Get revenue for the month
            model.addAttribute("salesMonth" + month, revenue);
        }

        return "admin/dashboard/show";
    }

    // Phương thức xử lý xuất dữ liệu doanh thu dưới dạng file Excel
    @GetMapping("/exportSalesData")
    @ResponseBody
    public ResponseEntity<byte[]> exportSalesData() throws IOException {
        // Tạo workbook mới
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Doanh Thu");

        // Tạo header
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("Tháng");
        headerRow.createCell(1).setCellValue("Doanh Thu (VNĐ)");

        // Thêm dữ liệu vào Excel (doanh thu theo từng tháng)
        int rowNum = 1;
        for (int month = 1; month <= 12; month++) {
            double revenue = orderService.getRevenueByMonth(month); // Lấy doanh thu cho tháng
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(month);  // Tháng
            row.createCell(1).setCellValue(revenue); // Doanh thu
        }

        // Định dạng lại cột cho đẹp mắt
        for (int i = 0; i < 2; i++) {
            sheet.autoSizeColumn(i);
        }

        // Chuyển đổi thành byte array để trả về
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            workbook.write(baos);  // Ghi dữ liệu vào ByteArrayOutputStream
        } finally {
            workbook.close();  // Đảm bảo đóng workbook sau khi sử dụng
        }

        byte[] excelFile = baos.toByteArray();

        // Trả về file Excel như một file đính kèm để người dùng tải về
        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=doanhthu.xlsx")
                .body(excelFile);
    }

    // Phương thức xuất danh sách đơn hàng ra file Excel
    @GetMapping("/exportOrdersData")
    @ResponseBody
    public ResponseEntity<byte[]> exportOrdersData() throws IOException {
        // Lấy danh sách đơn hàng từ service
        List<Order> orders = orderService.fetchAllOrders();

        // Tạo workbook mới
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Đơn Hàng");

        // Tạo header cho sheet
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("Mã Đơn Hàng");
        headerRow.createCell(1).setCellValue("Tên Khách Hàng");
        headerRow.createCell(2).setCellValue("Ngày Tạo");
        headerRow.createCell(3).setCellValue("Tổng Giá Trị (VNĐ)");
        headerRow.createCell(4).setCellValue("Trạng Thái");

        // Thêm dữ liệu đơn hàng vào Excel
        int rowNum = 1;
        for (Order order : orders) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(order.getId()); // Mã đơn hàng
            row.createCell(1).setCellValue(order.getReceiverName()); // Tên khách hàng
            row.createCell(2).setCellValue(order.getCreatedDate().toString()); // Ngày tạo
            row.createCell(3).setCellValue(order.getTotalPrice()); // Tổng giá trị
            row.createCell(4).setCellValue(order.getStatus()); // Trạng thái
        }

        // Định dạng lại cột cho đẹp mắt
        for (int i = 0; i < 5; i++) {
            sheet.autoSizeColumn(i);
        }

        // Chuyển đổi thành byte array để trả về
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            workbook.write(baos);  // Ghi dữ liệu vào ByteArrayOutputStream
        } finally {
            workbook.close();  // Đảm bảo đóng workbook sau khi sử dụng
        }

        byte[] excelFile = baos.toByteArray();

        // Trả về file Excel như một file đính kèm để người dùng tải về
        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=donhang.xlsx")
                .body(excelFile);
    }
}
