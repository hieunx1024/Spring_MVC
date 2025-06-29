package vn.Hieu.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.Hieu.laptopshop.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}
