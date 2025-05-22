package vn.Hieu.laptopshop.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.Hieu.laptopshop.domain.Product;
import vn.Hieu.laptopshop.domain.Role;
import vn.Hieu.laptopshop.domain.User;

@Controller
public class ProductController {
    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = new ArrayList<>();
        model.addAttribute("products", products);
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    // @PostMapping(value = "/admin/product/create")
    // public String createUserPage(Model model, @ModelAttribute("newUser") User
    // user,
    // @RequestParam("imgFile") MultipartFile file) {
    // String avatar = this.uploadService.HandleSaveUpLoadFile(file, "avatar");
    // this.userService.HandleSaveUser(user);
    // return "redirect:/admin/user";
    // }
}