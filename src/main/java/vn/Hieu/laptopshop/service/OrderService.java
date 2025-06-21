package vn.Hieu.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.Hieu.laptopshop.domain.Order;
import vn.Hieu.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    // method lưu đơn đặt hàng
    public Order HandleSaveOrder(Order order) {
        return this.orderRepository.save(order);
    }

    // method lấy danh sách tất cả các đơn hàng
    public List<Order> FetchAllOrder() {
        return this.orderRepository.findAll();
    }

    // method tìm đơn hàng theo id
    public Optional<Order> FetchOrderById(Long id) {
        return this.orderRepository.findById(id);
    }

    // method xóa đơn hàng
    public void deleteOrder(Long id) {
        this.orderRepository.deleteById(id);
    }
}
