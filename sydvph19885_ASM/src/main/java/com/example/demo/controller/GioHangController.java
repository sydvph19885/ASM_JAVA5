package com.example.demo.controller;

import com.example.demo.entity.Account;
import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.GioHang;
import com.example.demo.entity.GioHangChiTiet;
import com.example.demo.service.IChiTietSanPhamService;
import com.example.demo.service.IGioHangChiTietService;
import com.example.demo.service.IGioHangService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/cart")
public class GioHangController {

    @Autowired
//    @Qualifier(value = "GioHangService")
    private IGioHangService gioHangService;

    @Autowired
//    @Qualifier(value = "ChiTietSanPhamService")
    private IChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private IGioHangChiTietService gioHangChiTietService;

    @Autowired
    HttpSession session;


    @GetMapping("/remove/{idGioHangChiTiet}")
    public String removeCart(Model model,@PathVariable(name = "idGioHangChiTiet") String id){
            GioHangChiTiet gioHangChiTiet = gioHangChiTietService.findGioHangChiTietById(id);
            gioHangChiTietService.delete(gioHangChiTiet);
            return "redirect:/cart";
    }
    @GetMapping("/remove-user/{idGioHangChiTiet}")
    public String removeCartUser(Model model,@PathVariable(name = "idGioHangChiTiet") String id){
            Map<String,Integer> danhSachGHUser = gioHangService.getAllGioHang();
            danhSachGHUser.remove(id);
            return "redirect:/cart";
    }
    @PostMapping("/update-user/{idGioHangChiTiet}")
    public String updateCartUser(Model model,@PathVariable(name = "idGioHangChiTiet") String id, @RequestParam(name = "soLuongSP") int soLuongSP){
            Map<String,Integer> danhSachGHUser = gioHangService.getAllGioHang();
            danhSachGHUser.put(id,soLuongSP);
            return "redirect:/cart";
    }

    @PostMapping("/update/{idGioHangChiTiet}")
    public String updateCart(Model model, @PathVariable(name = "idGioHangChiTiet") String id, @RequestParam(name = "soLuongSP") int soLuongSP){
        try {
            Account account = (Account) session.getAttribute("account");
            GioHang gioHang = gioHangService.findGioHangByAccount(account);
            List<GioHangChiTiet> gioHangChiTietList = gioHangChiTietService.findGioHangChiTietByGioHang(gioHang);
            int soLuongSanPhamTrongGioHang = 0;
            double tongTienHang = 0;
            for (GioHangChiTiet gioHangChiTiet : gioHangChiTietList) {
                tongTienHang += gioHangChiTiet.getDonGia().doubleValue();
                soLuongSanPhamTrongGioHang += gioHangChiTiet.getSoLuong();
            }
            GioHangChiTiet gioHangChiTiet = gioHangChiTietService.findGioHangChiTietById(id);
            gioHangChiTiet.setSoLuong(soLuongSP);
            gioHangChiTiet.setDonGia(BigDecimal.valueOf(soLuongSP* gioHangChiTiet.getChiTietSP().getGiaBan()));
            gioHangChiTietService.addOrUpdate(gioHangChiTiet);
            model.addAttribute("tongTienHang", tongTienHang);
        }catch (Exception e){
            e.printStackTrace();
        }

            return "redirect:/cart";
    }

}
