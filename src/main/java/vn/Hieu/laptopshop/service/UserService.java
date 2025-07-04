package vn.Hieu.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.Hieu.laptopshop.domain.Role;
import vn.Hieu.laptopshop.domain.User;
import vn.Hieu.laptopshop.domain.dto.RegisterDTO;
import vn.Hieu.laptopshop.repository.OrderRepository;
import vn.Hieu.laptopshop.repository.ProductRepository;
import vn.Hieu.laptopshop.repository.RoleRepository;
import vn.Hieu.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, ProductRepository productRepository, OrderRepository orderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
    }

    // method lưu user
    public User HandleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    // method lấy danh sách tất cả người dùng theo email
    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    // method lấy danh sách tất cả người dùng
    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    // mapper
    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long getCountUser(){
        return this.userRepository.count();
    }

    public long getCountProduct(){
        return this.productRepository.count();
    }

    public long getCountOrder(){
        return this.orderRepository.count();
    }
}
