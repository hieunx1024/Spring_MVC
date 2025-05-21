package vn.Hieu.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;

    }

   public String HandleSaveUpLoadFile(MultipartFile file, String targetFolder) {
    if (file == null || file.isEmpty()) {
        return "";
    }
    
    String rootPath = this.servletContext.getRealPath("/resources/images");
    String finalName = "";
    try {
        byte[] bytes = file.getBytes();

        File dir = new File(rootPath + File.separator + targetFolder);
        if (!dir.exists())
            dir.mkdirs();

        // Create the file on server with sanitized name
        String originalFilename = file.getOriginalFilename();
        if (originalFilename != null) {
            finalName = System.currentTimeMillis() + "-" + originalFilename.replace(" ", "_");
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            
            return finalName;
        }
        return "";
    } catch (IOException e) {
        e.printStackTrace();
        return "";
    }
}
       
}
