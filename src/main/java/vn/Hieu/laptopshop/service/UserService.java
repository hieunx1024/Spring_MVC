package vn.Hieu.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.Hieu.laptopshop.domain.Role;
import vn.Hieu.laptopshop.domain.User;
import vn.Hieu.laptopshop.repository.RoleRepository;
import vn.Hieu.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User HandleSaveUser(User user) {
        User hieu = this.userRepository.save(user);
        return hieu;
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleById(Long id) {
        return roleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Role không tồn tại với ID: " + id));
    }

}
