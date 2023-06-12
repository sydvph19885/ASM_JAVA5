package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.IGioHangChiTietService;
import com.example.demo.service.IGioHangService;
import com.example.demo.service.IHoaDonChiTietService;
import com.example.demo.service.IHoaDonService;
import com.example.demo.viewModel.HoaDonChiTietViewModel;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
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

    @Autowired
    IHoaDonService hoaDonService;

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

    @GetMapping("/don-mua")
    public String viewDonMua(Model model) {
        Account account = (Account) session.getAttribute("account");
        List<HoaDonChiTietViewModel> listDonMuaById = new ArrayList<>();
        for (HoaDonChiTietViewModel hoaDonChiTietViewModel : hoaDonChiTietService.findHoaDonChiTietByHoaDon(account)) {
            listDonMuaById.add(hoaDonChiTietViewModel);
        }

        model.addAttribute("hoaDonDaMua", listDonMuaById);
        return "don-mua";
    }

}
