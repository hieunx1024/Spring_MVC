package vn.Hieu.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.Hieu.laptopshop.domain.Order;
import vn.Hieu.laptopshop.domain.OrderDetail;
import vn.Hieu.laptopshop.domain.User;
import vn.Hieu.laptopshop.repository.OrderDetailRepository;
import vn.Hieu.laptopshop.repository.OrderRepository;


@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository,
                        OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> fetchAllOrders(Pageable page) {
        return this.orderRepository.findAll(page);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }
        this.orderRepository.deleteById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public double getRevenueByMonth(int month) {
        Double result = orderRepository.sumRevenueByMonth(month);
        return result != null ? result : 0.0;
    }

    public List<Order> fetchOrdersByIds(List<Long> orderIds) {
        return orderRepository.findAllById(orderIds);  // Dùng phương thức này nếu bạn sử dụng Spring Data JPA
    }

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

}


