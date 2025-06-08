package vn.Hieu.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.Hieu.laptopshop.domain.Cart;
import vn.Hieu.laptopshop.domain.CartDetail;
import vn.Hieu.laptopshop.domain.Product;
import vn.Hieu.laptopshop.domain.User;
import vn.Hieu.laptopshop.repository.CartDetailRepository;
import vn.Hieu.laptopshop.repository.CartRepository;
import vn.Hieu.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartDetailRepository cartDetailRepository,
            CartRepository cartRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product HandleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> getProductById(Long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void addProductToCart(String email, long ProductId) {
        User user = this.userService.getUserByEmail(email);
        // check user có cart chưa ? Nếu chưa có thì tạo mới
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // Tạo mới cart
                Cart otheCart = new Cart();
                otheCart.setUser(user);
                otheCart.setSum(1);
                this.cartRepository.save(otheCart);
            }
            // save cartDetail

            // tìm product by id
            Optional<Product> productOptional = this.productRepository.findById(ProductId);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();

                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                cartDetail.setProduct(product);
                cartDetail.setPrice(product.getPrice());
                cartDetail.setQuantity(1);
                this.cartDetailRepository.save(cartDetail);
            }

        }
    }
}
