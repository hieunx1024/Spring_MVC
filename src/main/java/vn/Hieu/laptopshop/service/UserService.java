package vn.Hieu.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.Hieu.laptopshop.domain.User;
import vn.Hieu.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String HandleHello() {
        return "hello from service";
    }

    public User HandleSaveUser(User user) {
        return this.userRepository.save(user);
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
}
