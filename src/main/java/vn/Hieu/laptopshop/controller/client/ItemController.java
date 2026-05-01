package vn.Hieu.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.Hieu.laptopshop.domain.*;
import vn.Hieu.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.Hieu.laptopshop.service.ProductService;
import vn.Hieu.laptopshop.service.VNPayService;
import vn.Hieu.laptopshop.config.VNPayConfig;

@Controller
public class ItemController {

    private final ProductService productService;
    private final VNPayService vnPayService;

    public ItemController(ProductService productService, VNPayService vnPayService) {
        this.productService = productService;
        this.vnPayService = vnPayService;
    }

    @GetMapping("/products")
    public String getProductPage(Model model,
                                 ProductCriteriaDTO productCriteriaDTO,
                                 HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 10);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent()
                : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }


    @GetMapping("/product/{id}")
    public String getDetailProduct(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String postAddProductToCart(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.addProductToCart(email, productId, session, 1);

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        // kiểm tra nếu cart null thì tạo một danh sách mới
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);

        return "client/cart/show";

    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleDeleteCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam(value = "paymentMethod", required = false, defaultValue = "COD") String paymentMethod) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        if ("VNPAY".equals(paymentMethod)) {
            session.setAttribute("receiverName", receiverName);
            session.setAttribute("receiverAddress", receiverAddress);
            session.setAttribute("receiverPhone", receiverPhone);

            Cart cart = this.productService.fetchByUser(currentUser);
            List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
            double totalPrice = 0;
            for (CartDetail cd : cartDetails) {
                totalPrice += cd.getPrice() * cd.getQuantity();
            }
            int amount = (int) totalPrice;
            String orderInfo = "Thanh toan don hang VNPay " + VNPayConfig.getRandomNumber(4);

            String vnpayUrl = vnPayService.createOrder(amount, orderInfo, request);
            return "redirect:" + vnpayUrl;
        }

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
        return "redirect:/thanks";
    }

    @GetMapping("/vnpay-return")
    public String vnpayReturn(HttpServletRequest request, Model model) {
        int paymentStatus = vnPayService.orderReturn(request);

        if (paymentStatus == 1) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                User currentUser = new User();
                long id = (long) session.getAttribute("id");
                currentUser.setId(id);
                String receiverName = (String) session.getAttribute("receiverName");
                String receiverAddress = (String) session.getAttribute("receiverAddress");
                String receiverPhone = (String) session.getAttribute("receiverPhone");

                if (receiverName != null) {
                    this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
                    session.removeAttribute("receiverName");
                    session.removeAttribute("receiverAddress");
                    session.removeAttribute("receiverPhone");
                }
            }
            return "redirect:/thanks";
        } else {
            return "redirect:/checkout?payment_error=true";
        }
    }

    @GetMapping("/thanks")
    public String getThanksPage() {
        return "client/cart/thanks";
    }

    //Thêm giỏ hàng từ product-detail
    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.addProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }
}
