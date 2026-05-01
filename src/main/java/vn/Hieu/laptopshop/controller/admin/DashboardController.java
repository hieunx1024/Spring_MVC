package vn.Hieu.laptopshop.controller.admin;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
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
        model.addAttribute("countUsers", userService.getCountUser());
        model.addAttribute("countProducts", userService.getCountProduct());
        model.addAttribute("countOrders", userService.getCountOrder());

        for (int month = 1; month <= 12; month++) {
            double revenue = orderService.getRevenueByMonth(month);
            model.addAttribute("salesMonth" + month, revenue);
        }

        try {
            com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();

            List<Object[]> factoryData = orderService.getSoldProductsByFactory();
            List<String> factoryLabels = factoryData.stream().map(o -> o[0] != null ? o[0].toString() : "Khác").toList();
            List<Long> factoryValues = factoryData.stream().map(o -> o[1] != null ? ((Number) o[1]).longValue() : 0L).toList();
            model.addAttribute("factoryLabels", mapper.writeValueAsString(factoryLabels));
            model.addAttribute("factoryValues", mapper.writeValueAsString(factoryValues));

            List<Object[]> targetData = orderService.getSoldProductsByTarget();
            List<String> targetLabels = targetData.stream().map(o -> o[0] != null ? o[0].toString() : "Khác").toList();
            List<Long> targetValues = targetData.stream().map(o -> o[1] != null ? ((Number) o[1]).longValue() : 0L).toList();
            model.addAttribute("targetLabels", mapper.writeValueAsString(targetLabels));
            model.addAttribute("targetValues", mapper.writeValueAsString(targetValues));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/dashboard/show";
    }

    private CellStyle createHeaderStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        font.setColor(IndexedColors.WHITE.getIndex());
        font.setFontHeightInPoints((short) 12);

        style.setFont(font);
        style.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        return style;
    }

    private CellStyle createTitleStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 16);
        font.setColor(IndexedColors.DARK_BLUE.getIndex());

        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        return style;
    }

    private CellStyle createCurrencyStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();
        DataFormat format = workbook.createDataFormat();
        style.setDataFormat(format.getFormat("#,##0_-"));
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        return style;
    }

    private CellStyle createDataStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        return style;
    }

    @GetMapping("/exportSalesData")
    @ResponseBody
    public ResponseEntity<byte[]> exportSalesData() throws IOException {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Doanh Thu");

        CellStyle titleStyle = createTitleStyle(workbook);
        CellStyle headerStyle = createHeaderStyle(workbook);
        CellStyle dataStyle = createDataStyle(workbook);
        CellStyle currencyStyle = createCurrencyStyle(workbook);

        // Title
        Row titleRow = sheet.createRow(0);
        titleRow.setHeightInPoints(30);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue("BÁO CÁO DOANH THU NĂM NAY");
        titleCell.setCellStyle(titleStyle);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));

        // Header
        Row headerRow = sheet.createRow(2);
        headerRow.setHeightInPoints(20);
        String[] columns = { "Tháng", "Doanh Thu (VNĐ)" };
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
            cell.setCellStyle(headerStyle);
        }

        int rowNum = 3;
        double totalRevenue = 0;
        for (int month = 1; month <= 12; month++) {
            double revenue = orderService.getRevenueByMonth(month);
            totalRevenue += revenue;
            Row row = sheet.createRow(rowNum++);

            Cell cellMonth = row.createCell(0);
            cellMonth.setCellValue("Tháng " + month);
            cellMonth.setCellStyle(dataStyle);

            Cell cellRev = row.createCell(1);
            cellRev.setCellValue(revenue);
            cellRev.setCellStyle(currencyStyle);
        }

        // Total row
        Row totalRow = sheet.createRow(rowNum);
        Cell cellTotalLabel = totalRow.createCell(0);
        cellTotalLabel.setCellValue("TỔNG DOANH THU");
        CellStyle boldDataStyle = workbook.createCellStyle();
        boldDataStyle.cloneStyleFrom(dataStyle);
        Font boldFont = workbook.createFont();
        boldFont.setBold(true);
        boldDataStyle.setFont(boldFont);
        cellTotalLabel.setCellStyle(boldDataStyle);

        Cell cellTotalVal = totalRow.createCell(1);
        cellTotalVal.setCellValue(totalRevenue);
        CellStyle boldCurrencyStyle = workbook.createCellStyle();
        boldCurrencyStyle.cloneStyleFrom(currencyStyle);
        boldCurrencyStyle.setFont(boldFont);
        cellTotalVal.setCellStyle(boldCurrencyStyle);

        sheet.setColumnWidth(0, 15 * 256);
        sheet.setColumnWidth(1, 25 * 256);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            workbook.write(baos);
        } finally {
            workbook.close();
        }

        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=doanhthu.xlsx")
                .body(baos.toByteArray());
    }

    @GetMapping("/exportOrdersData")
    @ResponseBody
    public ResponseEntity<byte[]> exportOrdersData() throws IOException {
        List<Order> orders = orderService.fetchAllOrders();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Đơn Hàng");

        CellStyle titleStyle = createTitleStyle(workbook);
        CellStyle headerStyle = createHeaderStyle(workbook);
        CellStyle dataStyle = createDataStyle(workbook);
        CellStyle currencyStyle = createCurrencyStyle(workbook);

        // Title
        Row titleRow = sheet.createRow(0);
        titleRow.setHeightInPoints(30);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue("DANH SÁCH ĐƠN HÀNG CHI TIẾT");
        titleCell.setCellStyle(titleStyle);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));

        // Header
        Row headerRow = sheet.createRow(2);
        headerRow.setHeightInPoints(20);
        String[] columns = { "Mã Đơn Hàng", "Tên Khách Hàng", "Ngày Tạo", "Tổng Giá Trị (VNĐ)", "Trạng Thái" };
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
            cell.setCellStyle(headerStyle);
        }

        int rowNum = 3;
        for (Order order : orders) {
            Row row = sheet.createRow(rowNum++);

            Cell c0 = row.createCell(0);
            c0.setCellValue("#" + order.getId());
            c0.setCellStyle(dataStyle);

            Cell c1 = row.createCell(1);
            c1.setCellValue(order.getReceiverName() != null ? order.getReceiverName() : order.getUser().getFullName());
            c1.setCellStyle(dataStyle);

            Cell c2 = row.createCell(2);
            c2.setCellValue(order.getCreatedDate() != null ? order.getCreatedDate().toString() : "");
            c2.setCellStyle(dataStyle);

            Cell c3 = row.createCell(3);
            c3.setCellValue(order.getTotalPrice());
            c3.setCellStyle(currencyStyle);

            Cell c4 = row.createCell(4);
            c4.setCellValue(order.getStatus());
            c4.setCellStyle(dataStyle);
        }

        sheet.setColumnWidth(0, 15 * 256);
        sheet.setColumnWidth(1, 30 * 256);
        sheet.setColumnWidth(2, 25 * 256);
        sheet.setColumnWidth(3, 20 * 256);
        sheet.setColumnWidth(4, 20 * 256);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            workbook.write(baos);
        } finally {
            workbook.close();
        }

        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=donhang.xlsx")
                .body(baos.toByteArray());
    }
}
