package vn.Hieu.laptopshop.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import vn.Hieu.laptopshop.domain.Product;
import vn.Hieu.laptopshop.domain.Role;
import vn.Hieu.laptopshop.repository.ProductRepository;
import vn.Hieu.laptopshop.repository.RoleRepository;

import java.util.Arrays;
import java.util.List;

@Component
public class DataInitializer implements CommandLineRunner {

    private final ProductRepository productRepository;
    private final RoleRepository roleRepository;

    public DataInitializer(ProductRepository productRepository, RoleRepository roleRepository) {
        this.productRepository = productRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        if (roleRepository.count() == 0) {
            Role adminRole = new Role();
            adminRole.setName("ADMIN");
            adminRole.setDescription("Admin Role");
            roleRepository.save(adminRole);

            Role userRole = new Role();
            userRole.setName("USER");
            userRole.setDescription("User Role");
            roleRepository.save(userRole);
        }

        if (productRepository.count() < 20) {
            productRepository.deleteAll();

            List<String> images = Arrays.asList(
                "1749346883450-download.jpeg",
                "1749346889772-download_(1).jpeg",
                "1749346896797-download_(2).jpeg",
                "1749346903076-download_(3).jpeg",
                "1749346912968-download_(3).jpeg",
                "1749346921691-download_(4).jpeg",
                "1749346930866-download_(5).jpeg",
                "1749346939210-download_(6).jpeg",
                "1749346947168-images.jpeg",
                "1749346956176-images_(1).jpeg",
                "1749347016493-images_(2).jpeg",
                "1749347024598-images_(3).jpeg",
                "1749347098014-images_(3).jpeg",
                "1749347115197-images_(6).jpeg",
                "1749347126806-images_(5).jpeg",
                "1749348195347-images_(3).jpeg",
                "1749348221069-images_(4).jpeg",
                "1749348755402-images_(5).jpeg",
                "1749348795561-images_(4).jpeg",
                "1758193844398-windows-10-dark-blue-5k-8k-3840x2160-733.jpg"
            );

            String[] brands = {"Apple", "Asus", "Lenovo", "Dell", "LG", "Acer"};
            String[] targets = {"Gaming", "Sinh viên - Văn phòng", "Đồ họa - Kỹ thuật", "Doanh nhân", "Mỏng nhẹ", "Phổ thông"};
            
            for (int i = 0; i < images.size(); i++) {
                String brand = brands[i % brands.length];
                String target = targets[i % targets.length];
                
                Product p = new Product();
                p.setName(brand + " Laptop Series " + (i + 1));
                p.setPrice(15000000 + (i * 1250000));
                p.setImage(images.get(i));
                p.setShortDesc("Sản phẩm Laptop " + brand + " mạnh mẽ, thiết kế hiện đại.");
                p.setDetailDesc("Dòng Laptop " + brand + " mang lại hiệu năng vượt trội, phù hợp cho nhu cầu " + target + ". Thiết kế đẳng cấp cùng thời lượng pin ấn tượng.");
                p.setQuantity(50);
                p.setSold(0);
                p.setFactory(brand);
                p.setTarget(target);
                productRepository.save(p);
            }
        }
    }
}
