package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.IGioHangChiTietService;
import com.example.demo.service.IGioHangService;
import com.example.demo.service.IHoaDonChiTietService;
import com.example.demo.viewModel.HoaDonChiTietViewModel;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ThongKeController {
    @Autowired
    private IHoaDonChiTietService hoaDonChiTietService;

    @Autowired
    HttpSession session;

    @Autowired
    IGioHangService gioHangService;

    @Autowired
    IGioHangChiTietService gioHangChiTietService;

    public void viewCart(Model model) {
        Account account = (Account) session.getAttribute("account");
        int soLuongSanPhamTrongGioHang = 0;
        double tongTienHang = 0;
        GioHang gioHang = gioHangService.findGioHangByAccount(account);
        List<GioHangChiTiet> listGioHang = gioHangChiTietService.findGioHangChiTietByGioHang(gioHang);
        for (GioHangChiTiet gioHangChiTiet : listGioHang) {
            tongTienHang += gioHangChiTiet.getDonGia().doubleValue();
            soLuongSanPhamTrongGioHang += gioHangChiTiet.getSoLuong();
        }
        model.addAttribute("tongTienHang", tongTienHang);
        model.addAttribute("vat", tongTienHang + ((tongTienHang * 10) / 100));
        model.addAttribute("gioHang", listGioHang);
        model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
        model.addAttribute("account", account);
    }

    @GetMapping("/thong-ke")
    public String viewTop10BestSale(Model model) {
        List<HoaDonChiTietViewModel> viewModels = hoaDonChiTietService.top10BanChay();
        model.addAttribute("thongKe", viewModels);
        return "thong-ke";
    }
//    @GetMapping("/thong-ke-tong")
//    public String viewTHongKeTong(Model model) {
//        List<HoaDonChiTietViewModel> viewModels = hoaDonChiTietService.top10BanChay();
////        ObjectMapper mapper = new ObjectMapper();
////        String thongKeJson = "";
////        try {
////            thongKeJson = mapper.writeValueAsString(viewModels);
////        } catch (JsonProcessingException e) {
////            e.printStackTrace();
////        }
////        model.addAttribute("thongKeJson", thongKeJson);
//        model.addAttribute("thongKe", viewModels);
//        return "thong-ke-tong";
//    }


}
