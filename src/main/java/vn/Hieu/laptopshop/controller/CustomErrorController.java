package vn.Hieu.laptopshop.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        
        String errorMsg = "Đã xảy ra lỗi không xác định.";
        int statusCode = 500;
        
        if (status != null) {
            statusCode = Integer.parseInt(status.toString());
            
            if(statusCode == 404) {
                errorMsg = "Rất tiếc, trang bạn đang tìm kiếm không tồn tại hoặc đã bị chuyển dời.";
            } else if (statusCode == 403) {
                errorMsg = "Bạn không có quyền truy cập vào trang này.";
            } else if (statusCode == 500) {
                errorMsg = "Đã xảy ra lỗi hệ thống. Vui lòng thử lại sau.";
            }
        }
        
        model.addAttribute("statusCode", statusCode);
        model.addAttribute("errorMsg", errorMsg);
        
        return "client/error/page";
    }
}
