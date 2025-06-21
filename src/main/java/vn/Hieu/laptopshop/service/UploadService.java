package vn.Hieu.laptopshop.service;

import java.io.File;
import java.io.IOException;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;

    }

    // method lưu file
    public String HandleSaveUpLoadFile(MultipartFile file, String targetFolder) {
        // kiểm tra file có rỗng không
        if (file == null || file.isEmpty()) {
            return "";
        }
        // đường dẫn folder lưu file
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
        try {
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            String originalFilename = file.getOriginalFilename();
            if (originalFilename != null) {
                finalName = System.currentTimeMillis() + "-" + originalFilename.replace(" ", "_");
                File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
                // nén file để tối ưu hiệu năng laod của trang web
                // Resize ảnh trước khi lưu (ví dụ 600x600)
                Thumbnails.of(file.getInputStream())
                        .size(600, 600) // chỉnh lại nếu muốn ảnh lớn hơn
                        .outputQuality(0.8f) // nén ~80% chất lượng
                        .toFile(serverFile);

                return finalName;
            }
            return "";
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

}
