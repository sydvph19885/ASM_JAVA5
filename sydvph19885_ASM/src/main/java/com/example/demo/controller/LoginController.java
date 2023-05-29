package com.example.demo.controller;

import com.example.demo.entity.Account;
import com.example.demo.service.IAccountService;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.UUID;


@Controller
@MultipartConfig
@SessionScope
public class LoginController {

    @Autowired
    private IAccountService accountService;

    @Autowired
    HttpSession session;

    @Autowired
    ServletContext servletContext;


    @GetMapping("/login")
    public String viewLogin(Model model) {
        model.addAttribute("thongBao", "Hello Cưng");
        return "login";
    }

    @PostMapping("/login")
    public String checkLogin(Model model, @RequestParam(name = "email") String email, @RequestParam(name = "pass") String pass) {
        Account account = accountService.getOneByEmaiAndPass(email, pass);
        session.setAttribute("account", account);
        if (account != null) {
            return "redirect:/home";
        } else {
            model.addAttribute("thongBao", "Login faill");
            model.addAttribute("emails", email);
            model.addAttribute("passs", pass);
            return "login";
        }

    }

    public String genMa() {
        return String.valueOf(UUID.randomUUID());
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/login";
    }

    @PostMapping("/register")
    public String register(Model model, HttpServletRequest request, @RequestParam(name = "hoTenDK") String hoTen, @RequestParam(name = "emailDK") String email, @RequestParam(name = "passDK") String pass, @RequestParam(name = "image") MultipartFile file) throws IOException {
        String anh = file.getOriginalFilename();
        Account account = new Account(email, hoTen, genMa(), anh, pass, "CLIENT");
        Account accountByEmail = accountService.findAccountByEmail(email);
        int viTriDauCham = anh.indexOf(".");
        String duoiImage = anh.substring(viTriDauCham + 1).trim();
        if (accountByEmail == null) {
            if (duoiImage.equalsIgnoreCase("jpeg") || duoiImage.equalsIgnoreCase("png") || duoiImage.equalsIgnoreCase("svg") || duoiImage.equalsIgnoreCase("jpg") || duoiImage.equalsIgnoreCase("tiff") || duoiImage.equalsIgnoreCase("heic")) {
                if (!file.isEmpty()){
                    // Lấy tên file gốc
                    String originalFileName = file.getOriginalFilename();
                    // Lấy đường dẫn thư mục static
                    String staticPath = "/static/";
                    // Lấy đường dẫn gốc của ứng dụng
                    String appPath = request.getContextPath();
                    // Tạo đường dẫn tới file trong thư mục static
                    String imagePath = appPath + staticPath + originalFileName;
                    // Lưu ảnh lên thư mục static
                    try (InputStream inputStream = file.getInputStream()) {
                        String realPath = request.getServletContext().getRealPath(staticPath);
                        File staticDir = new File(realPath);
                        File file12 = new File(staticDir, originalFileName);
                        try (OutputStream outputStream = new FileOutputStream(file12)) {
                            FileCopyUtils.copy(inputStream, outputStream);
                        }
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
                accountService.saveOrUpdate(account);
                model.addAttribute("thongBao", "Đăng kí thành công!");
                return "login";
            } else {
                model.addAttribute("thongBao", "Vui lòng không chọn những cái không phải là ảnh! Đăng kí thất bại");
                model.addAttribute("account", account);
                return "login";
            }
        } else {
            model.addAttribute("thongBao", "Mail đã được đăng kí!");
            model.addAttribute("account", account);
            return "login";
        }
    }

    @GetMapping("/forgot-pass")
    public String quenMatKhau() {
        return "forgot-pass";
    }


}
