package vn.Hieu.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.Hieu.laptopshop.domain.Order;
import vn.Hieu.laptopshop.domain.User;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findByUser(User user);
    public List<Order> findAllById(Iterable<Long> ids);


    @Query("SELECT COALESCE(SUM(o.totalPrice), 0) FROM Order o WHERE MONTH(o.createdDate) = :month")
    double sumRevenueByMonth(@Param("month") int month);


}
