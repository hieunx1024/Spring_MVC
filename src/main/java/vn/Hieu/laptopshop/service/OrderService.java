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

    public Order HandleSaveOrder(Order order) {
        return this.orderRepository.save(order);
    }

    public List<Order> FetchAllOrder() {
        return this.orderRepository.findAll();
    }

    public Optional<Order> FetchOrderById(Long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrder(Long id) {
        this.orderRepository.deleteById(id);
    }
}
