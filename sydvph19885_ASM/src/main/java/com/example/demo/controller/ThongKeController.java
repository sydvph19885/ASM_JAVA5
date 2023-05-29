package com.example.demo.controller;

import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDonChiTiet;
import com.example.demo.service.IHoaDonChiTietService;
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
    @GetMapping("/thong-ke")
    public String view(Model model){
        List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietService.findAll();
        Map<ChiTietSP,Integer> mapHoaDonChiTiet = new HashMap<>();

        for (HoaDonChiTiet hoaDonChiTiet: hoaDonChiTietList) {
            int soLuong = hoaDonChiTiet.getSoLuong();
            if (mapHoaDonChiTiet.containsKey(hoaDonChiTiet.getChiTietSP())){
                int soLuongCu = mapHoaDonChiTiet.get(hoaDonChiTiet.getChiTietSP());
                int soLuongMoi = soLuongCu + soLuong;
                mapHoaDonChiTiet.put(hoaDonChiTiet.getChiTietSP(),soLuongMoi);
            }else {
                mapHoaDonChiTiet.put(hoaDonChiTiet.getChiTietSP(),soLuong);
            }
        }
        model.addAttribute("thongKe",mapHoaDonChiTiet);
        return "thong-ke";
    }
}
