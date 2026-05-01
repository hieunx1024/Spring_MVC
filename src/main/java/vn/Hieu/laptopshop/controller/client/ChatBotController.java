package vn.Hieu.laptopshop.controller.client;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import vn.Hieu.laptopshop.domain.Product;
import vn.Hieu.laptopshop.service.ProductService;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/chat")
public class ChatBotController {

    private final ProductService productService;
    private final RestTemplate restTemplate = new RestTemplate();
    private final String OPENAI_API_URL = "https://api.openai.com/v1/chat/completions";
    
    @org.springframework.beans.factory.annotation.Value("${openai.api.key}")
    private String API_KEY;

    public ChatBotController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public ResponseEntity<Map<String, String>> chat(@RequestBody Map<String, String> request) {
        String userMessage = request.get("message");

        if (userMessage == null || userMessage.trim().isEmpty()) {
            return ResponseEntity.ok(Map.of("reply", "Bạn cần hỏi gì nào?"));
        }

        // Lấy 50 sản phẩm để làm bối cảnh (context) cho AI
        Pageable pageable = PageRequest.of(0, 50);
        List<Product> products = productService.getAllProducts(pageable).getContent();
        
        String productContext = products.stream()
            .map(p -> String.format("- Tên: %s | Giá: %s VND | Hãng: %s | Cấu hình: %s | Mục đích: %s | Link: /product/%d", 
                    p.getName(), (long)p.getPrice(), p.getFactory(), p.getShortDesc(), p.getTarget(), p.getId()))
            .collect(Collectors.joining("\n"));

        String systemPrompt = "Bạn là trợ lý ảo thân thiện của cửa hàng LaptopShop. "
            + "Nhiệm vụ của bạn là tư vấn laptop và trả lời câu hỏi của khách hàng bằng tiếng Việt một cách lịch sự, ngắn gọn và hữu ích. "
            + "Bạn CHỈ được tư vấn dựa trên danh sách sản phẩm hiện có ở cửa hàng sau đây (nếu có khách hỏi sản phẩm ngoài danh sách, hãy khéo léo nói cửa hàng chưa có và gợi ý các mẫu tương tự đang có).\n"
            + "QUAN TRỌNG: Khi nhắc đến một sản phẩm bất kỳ, bạn BẮT BUỘC phải tạo link dưới dạng mã HTML <a> như sau: <a href=\"/product/[ID]\" style=\"color: #0d6efd; text-decoration: underline;\">Tên sản phẩm</a> để khách hàng có thể bấm vào xem chi tiết.\n\n" 
            + productContext;

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(API_KEY);

        Map<String, Object> body = new HashMap<>();
        body.put("model", "gpt-3.5-turbo");
        
        List<Map<String, String>> messages = new ArrayList<>();
        messages.add(Map.of("role", "system", "content", systemPrompt));
        messages.add(Map.of("role", "user", "content", userMessage));
        
        body.put("messages", messages);
        body.put("max_tokens", 400);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(OPENAI_API_URL, entity, Map.class);
            Map<String, Object> responseBody = response.getBody();
            if (responseBody != null && responseBody.containsKey("choices")) {
                List<Map<String, Object>> choices = (List<Map<String, Object>>) responseBody.get("choices");
                if (!choices.isEmpty()) {
                    Map<String, Object> message = (Map<String, Object>) choices.get(0).get("message");
                    String reply = (String) message.get("content");
                    return ResponseEntity.ok(Map.of("reply", reply));
                }
            }
            return ResponseEntity.ok(Map.of("reply", "Xin lỗi, tôi chưa hiểu ý bạn."));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(Map.of("reply", "Xin lỗi, hiện tại tôi không thể kết nối tới hệ thống AI. Vui lòng thử lại sau."));
        }
    }
}
