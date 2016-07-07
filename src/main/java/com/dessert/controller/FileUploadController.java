package com.dessert.controller;

import com.dessert.util.FileUpload;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by cristph on 2016/3/18.
 */
@Controller
public class FileUploadController {

    Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    @RequestMapping("upload")
    public String upload(@RequestParam("studentPhoto") MultipartFile file,
                         HttpServletRequest request,
                         HttpServletResponse response,
                         RedirectAttributes redirectAttributes) throws IOException {
        String filePath = FileUpload.uploadFile(file, request);
        logger.info("filePath:" + filePath);
//        response.setContentType("text/html;charset=utf8");
//        response.getWriter().write("<img src='"+filePath+"'/>");
        redirectAttributes.addAttribute("picpath",filePath);
        return "redirect:/addGoodProject";
    }

    @RequestMapping("uploadProductPic")
    public String uploadProductPic(@RequestParam("studentPhoto") MultipartFile file,
                         HttpServletRequest request,
                         HttpServletResponse response,
                         RedirectAttributes redirectAttributes) throws IOException {
        String filePath = FileUpload.uploadFile(file, request);
        logger.info("filePath:" + filePath);
//        response.setContentType("text/html;charset=utf8");
//        response.getWriter().write("<img src='"+filePath+"'/>");
        redirectAttributes.addAttribute("picpath",filePath);
        return "redirect:/addProductView";
    }


}
