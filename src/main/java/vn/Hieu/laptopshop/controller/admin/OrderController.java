package vn.Hieu.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.Hieu.laptopshop.domain.Order;
import vn.Hieu.laptopshop.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model) {
        List<Order> oders = this.orderService.FetchAllOrder();
        model.addAttribute("orders", oders);
        return "admin/order/show";
    }

    @GetMapping("/admin/oder/view/id")
    public String getDetailOrder(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Optional<Order> order = this.orderService.FetchOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/detail";
    }

}