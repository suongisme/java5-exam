package com.java5.exam.utils;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.Objects;

@Service
public class FileUtils {

    private static ServletContext servletContext;

    public FileUtils(ServletContext servletContext) {
        FileUtils.servletContext = servletContext;
    }

    public static String upload(MultipartFile multipartFile) {
        try {
            String path = FileUtils.servletContext.getRealPath("/images/products/");
            File pathFile = new File(path);

            if (!pathFile.exists()) {
                pathFile.mkdir();
            }

            if (Objects.nonNull(multipartFile) && !multipartFile.isEmpty()) {
                File file = new File(path + multipartFile.getOriginalFilename());
                multipartFile.transferTo(file);
                return "images/products/"+multipartFile.getOriginalFilename();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
