package vn.Hieu.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
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

    // method lưu sản phẩm
    public Product HandleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    // method lấy tất cả sản phâmr có trong database
    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    // method tìm kiếm sản phẩm theo id
    public Optional<Product> getProductById(Long id) {
        return this.productRepository.findById(id);
    }

    // method xóa sản phẩm theo id
    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    // method thêm sản phẩm vào giỏ hàng
    public void addProductToCart(String email, long ProductId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        // check user có cart chưa ? Nếu chưa có thì tạo mới
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // Tạo mới cart
                Cart otheCart = new Cart();
                otheCart.setUser(user);
                otheCart.setSum(0);
                this.cartRepository.save(otheCart);
            }
            // save cartDetail

            // tìm product by id
            Optional<Product> productOptional = this.productRepository.findById(ProductId);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                // kiểm tra xem có sản phẩm nào bị trùng trong giỏ hàng không
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
                // nếu chưa có sản phẩm này thì tạo mới và thêm vào giỏ hàng
                if (oldDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setQuantity(1);
                    this.cartDetailRepository.save(cartDetail);

                    // update cart(sum)
                    int s = cart.getSum() + 1;
                    cart.setSum(s);

                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);

                } // nếu có rồi thì tăng số lượng sản phẩm này lên và cập nhật
                else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }
            }
        }
    }

    // method tìm giỏ hàng theo user
    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }
}
