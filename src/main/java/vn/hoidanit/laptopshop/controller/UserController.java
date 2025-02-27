package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.hoidanit.laptopshop.service.UserService;

// @RestController
// public class UserController {
//     final private UserService userService;

//     public UserController(UserService userService) {
//         this.userService = userService;
//     }

//     @GetMapping("")
//     public String getHomePage() {
//         return userService.HandleHello();
//     }

// }

@Controller
public class UserController {
    @RequestMapping("/")
    public String getHomePage() {
        return "hello";
    }
}