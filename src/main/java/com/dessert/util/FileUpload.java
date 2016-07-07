package com.dessert.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by cristph on 2016/3/18.
 */
public class FileUpload {

    public static final String FILE_PATH = "D:\\JavaWebWorkSpace\\Dessert\\out\\artifacts\\Dessert_war_exploded\\upload";

    //文件上传
    public static String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        File tempFile = new File(FILE_PATH, file.getOriginalFilename());
        file.transferTo(tempFile);
        return "/upload/"+file.getOriginalFilename();
    }

    public static File getFile(String fileName) {
        return new File(FILE_PATH, fileName);
    }
}