package vn.Hieu.laptopshop.controller.client;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PaymentController {

    @Value("${vnpay.tmnCode}")
    private String vnp_TmnCode;

    @Value("${vnpay.hashSecret}")
    private String vnp_HashSecret;

    @Value("${vnpay.payUrl}")
    private String vnp_PayUrl;

    @Value("${vnpay.returnUrl}")
    private String vnp_ReturnUrl;

    private static final long FIXED_AMOUNT = 100000L; // 100,000 VND

    @GetMapping("/payment-test")
    public String paymentTest() {
        return "payment-test";
    }

    @GetMapping("/pay")
    public String doPayment(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        return processPayment(request, model, FIXED_AMOUNT);
    }

    private String processPayment(HttpServletRequest request, Model model, long amountVND)
            throws UnsupportedEncodingException {

        String vnp_TxnRef = String.valueOf(System.currentTimeMillis());
        String vnp_OrderInfo = "Thanh toan don hang - So tien: " + String.format("%,d", amountVND) + " VND - Ma GD: "
                + vnp_TxnRef;
        String orderType = "other";
        long amount = amountVND * 100L;
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_CreateDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String vnp_IpAddr = getClientIP(request);

        Map<String, String> vnp_Params = new TreeMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_ReturnUrl", vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        vnp_Params.put("vnp_Locale", "vn");

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        boolean first = true;
        for (Map.Entry<String, String> entry : vnp_Params.entrySet()) {
            if (!first) {
                hashData.append('&');
                query.append('&');
            }
            hashData.append(entry.getKey()).append('=').append(entry.getValue());
            query.append(entry.getKey()).append('=')
                    .append(URLEncoder.encode(entry.getValue(), StandardCharsets.UTF_8.toString()));
            first = false;
        }

        String vnp_SecureHash = hmacSHA512(vnp_HashSecret, hashData.toString());
        vnp_Params.put("vnp_SecureHash", vnp_SecureHash);
        query.append("&vnp_SecureHash=").append(URLEncoder.encode(vnp_SecureHash, StandardCharsets.UTF_8.toString()));

        String paymentUrl = vnp_PayUrl + "?" + query.toString();

        System.out.println("=== VNPay Payment Debug ===");
        System.out.println("Amount VND: " + amountVND);
        System.out.println("TxnRef: " + vnp_TxnRef);
        System.out.println("Hash Data: " + hashData);
        System.out.println("Secure Hash: " + vnp_SecureHash);
        System.out.println("Payment URL: " + paymentUrl);
        System.out.println("========================");

        return "redirect:" + paymentUrl;
    }

    @GetMapping("/payment-return")
    public String paymentReturn(HttpServletRequest request, Model model) {
        Map<String, String> fields = new HashMap<>();

        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = request.getParameter(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = fields.remove("vnp_SecureHash");

        if (vnp_SecureHash != null) {
            Map<String, String> sortedFields = new TreeMap<>(fields);
            StringBuilder hashData = new StringBuilder();

            boolean first = true;
            for (Map.Entry<String, String> entry : sortedFields.entrySet()) {
                if (!first) {
                    hashData.append('&');
                }
                hashData.append(entry.getKey()).append('=').append(entry.getValue());
                first = false;
            }

            String calculatedHash = hmacSHA512(vnp_HashSecret, hashData.toString());

            System.out.println("=== VNPay Return Debug ===");
            System.out.println("Return Hash Data: " + hashData.toString());
            System.out.println("VNPay Hash: " + vnp_SecureHash);
            System.out.println("Calculated Hash: " + calculatedHash);
            System.out.println("Hash Match: " + calculatedHash.equals(vnp_SecureHash));
            System.out.println("Response Code: " + fields.get("vnp_ResponseCode"));
            System.out.println("========================");

            if (calculatedHash.equals(vnp_SecureHash)) {
                String responseCode = fields.get("vnp_ResponseCode");
                String amount = fields.get("vnp_Amount");
                String txnRef = fields.get("vnp_TxnRef");

                long amountVND = 0;
                if (amount != null) {
                    amountVND = Long.parseLong(amount) / 100;
                }

                if ("00".equals(responseCode)) {
                    model.addAttribute("message", "Thanh toán thành công!");
                    model.addAttribute("status", "success");
                    model.addAttribute("amountVND", String.format("%,d", amountVND));
                    model.addAttribute("txnRef", txnRef);
                } else {
                    model.addAttribute("message", "Thanh toán thất bại. Mã lỗi: " + responseCode);
                    model.addAttribute("status", "failed");
                }
            } else {
                model.addAttribute("message", "Chữ ký không hợp lệ!");
                model.addAttribute("status", "invalid");
            }
        } else {
            model.addAttribute("message", "Không tìm thấy chữ ký!");
            model.addAttribute("status", "error");
        }

        model.addAttribute("fields", fields);
        return "payment-result";
    }

    private String getClientIP(HttpServletRequest request) {
        String xfHeader = request.getHeader("X-Forwarded-For");
        return (xfHeader == null || xfHeader.isEmpty()) ? request.getRemoteAddr() : xfHeader.split(",")[0].trim();
    }

    public static String hmacSHA512(String key, String data) {
        try {
            Mac hmac512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac512.init(secretKey);
            byte[] hashBytes = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));

            StringBuilder result = new StringBuilder();
            for (byte b : hashBytes) {
                result.append(String.format("%02x", b));
            }
            return result.toString();

        } catch (Exception e) {
            throw new RuntimeException("Error while generating HMAC SHA512", e);
        }
    }
}
