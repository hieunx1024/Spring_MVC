package vn.Hieu.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.Hieu.laptopshop.domain.OrderDetail;

import java.util.List;
import org.springframework.data.jpa.repository.Query;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

    @Query("SELECT p.factory, SUM(od.quantity) FROM OrderDetail od JOIN od.product p GROUP BY p.factory")
    List<Object[]> countSoldProductsByFactory();

    @Query("SELECT p.target, SUM(od.quantity) FROM OrderDetail od JOIN od.product p GROUP BY p.target")
    List<Object[]> countSoldProductsByTarget();
}
