package vn.Hieu.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.Hieu.laptopshop.domain.User;

@Controller
public class HomePageController {
    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/show"; // dẫn đến show.jsp
    }

}