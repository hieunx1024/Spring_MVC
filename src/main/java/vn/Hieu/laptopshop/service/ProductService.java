package vn.Hieu.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.Hieu.laptopshop.domain.Product;
import vn.Hieu.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> getProductById(Long id) {
        return this.productRepository.findById(id);
    }
}
