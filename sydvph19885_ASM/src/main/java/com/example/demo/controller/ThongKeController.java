package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.IGioHangChiTietService;
import com.example.demo.service.IGioHangService;
import com.example.demo.service.IHoaDonChiTietService;
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
    public String view(Model model) {
        List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietService.findAll();
        Map<ChiTietSP, Integer> mapHoaDonChiTiet = new HashMap<>();

        for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietList) {
            int soLuong = hoaDonChiTiet.getSoLuong();
            if (mapHoaDonChiTiet.containsKey(hoaDonChiTiet.getChiTietSP())) {
                int soLuongCu = mapHoaDonChiTiet.get(hoaDonChiTiet.getChiTietSP());
                int soLuongMoi = soLuongCu + soLuong;
                mapHoaDonChiTiet.put(hoaDonChiTiet.getChiTietSP(), soLuongMoi);
            } else {
                mapHoaDonChiTiet.put(hoaDonChiTiet.getChiTietSP(), soLuong);
            }
        }
        model.addAttribute("thongKe", mapHoaDonChiTiet);
        viewCart(model);
        return "thong-ke";
    }
}
