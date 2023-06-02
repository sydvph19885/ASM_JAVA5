package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    HttpSession session;

    @Autowired
    private IHoaDonService hoaDonService;

    @Autowired
    private IGioHangService gioHangService;

    @Autowired
    IGioHangChiTietService gioHangChiTietService;

    @Autowired
    private IHoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;

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

    @GetMapping
    public String viewThongTin(Model model) {
        try {
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                return "shipping-infor";
            } else {
                GioHang gioHang = gioHangService.findGioHangByAccount(account);
                List<GioHangChiTiet> gioHangChiTietList = gioHangChiTietService.findGioHangChiTietByGioHang(gioHang);
//                check gio hang khong co san pham nao
                if (gioHangChiTietList.size() == 0) {
                    model.addAttribute("thongBaoSanPhamHetSoLuongTon", "Vui lòng thêm sản phẩm để mua!");
                    viewCart(model);
                    return "cart";
                } else {
                    List<ChiTietSP> chiTietSPList = chiTietSanPhamService.findAll();
//        nếu sản phẩm hết hàng nhưng vẫn còn sản phẩm trong giỏ hàng
                    for (GioHangChiTiet gioHangChiTiet : gioHangChiTietList) {
                        for (ChiTietSP chiTietSP : chiTietSPList) {
                            if (chiTietSP.getSoLuongTon() < 1) {
                                if (gioHangChiTiet.getChiTietSP().getId().equals(chiTietSP.getId())) {
                                    //                            hien thi view cart
                                    int soLuongSanPhamTrongGioHang = 0;
                                    double tongTienHang = 0;
                                    GioHang gioHangss = gioHangService.findGioHangByAccount(account);
                                    List<GioHangChiTiet> listGioHang = gioHangChiTietService.findGioHangChiTietByGioHang(gioHangss);
                                    for (GioHangChiTiet gioHangChiTiets : listGioHang) {
                                        tongTienHang += gioHangChiTiets.getDonGiaKhiGiam().doubleValue();
                                        soLuongSanPhamTrongGioHang += gioHangChiTiets.getSoLuong();
                                    }
                                    model.addAttribute("tongTienHang", tongTienHang);
                                    model.addAttribute("vat", tongTienHang + ((tongTienHang * 10) / 100));
                                    model.addAttribute("gioHang", listGioHang);
                                    model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
                                    model.addAttribute("account", account);
                                    model.addAttribute("thongBaoSanPhamHetSoLuongTon", "Sản phẩm" + " " + chiTietSP.getSanPham().getTen() + " " + "đã hết hàng! Vui lòng xóa!");
//                          view cart
                                    viewCart(model);
                                    return "cart";
                                }
                            }
                        }
                    }
//neu so luong ton chỉ con 1 mà gio hàng so luong lớn hơn 1
                    for (ChiTietSP chiTietSP : chiTietSPList) {
                        for (GioHangChiTiet gioHangChiTiet : gioHangChiTietList) {
                            if (chiTietSP.getId().equals(gioHangChiTiet.getChiTietSP().getId())) {
                                if (chiTietSP.getSoLuongTon() < gioHangChiTiet.getSoLuong()) {
                                    //                            hien thi view cart
                                    int soLuongSanPhamTrongGioHang = 0;
                                    double tongTienHang = 0;
                                    GioHang gioHangss = gioHangService.findGioHangByAccount(account);
                                    List<GioHangChiTiet> listGioHang = gioHangChiTietService.findGioHangChiTietByGioHang(gioHangss);
                                    for (GioHangChiTiet gioHangChiTiets : listGioHang) {
                                        tongTienHang += gioHangChiTiets.getDonGiaKhiGiam().doubleValue();
                                        soLuongSanPhamTrongGioHang += gioHangChiTiets.getSoLuong();
                                    }
                                    model.addAttribute("tongTienHang", tongTienHang);
                                    model.addAttribute("vat", tongTienHang + ((tongTienHang * 10) / 100));
                                    model.addAttribute("gioHang", listGioHang);
                                    model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
                                    model.addAttribute("account", account);
                                    model.addAttribute("thongBaoSanPhamHetSoLuongTon", "Sản phẩm" + " " + chiTietSP.getSanPham().getTen() + " " + "số lượng trong kho chỉ còn" + " " + chiTietSP.getSoLuongTon());
//                          view cart
//                            return "redirect:/cart";
                                    viewCart(model);
                                    return "cart";
                                } else {

                                    return "shipping-infor";
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/cart";
        }
        return null;
    }

    @PostMapping("/add")
    public String taoHoaDon(Model model, @RequestParam(name = "tenKhachHang") String tenKhachHang, @RequestParam(name = "email") String email, @RequestParam(name = "sdt") String sdt, @RequestParam(name = "diaChi") String diaChi) {
        try {
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                Map<String, Integer> gioHangMap = gioHangService.getAllGioHang();
                Set<String> key = gioHangMap.keySet();
                Map<ChiTietSP, Integer> danhSachGH = new HashMap<>();
                int tongTienHang = 0;
                int soLuongSanPhamTrongGioHang = 0;
                Date date = new Date();
                HoaDon hoaDon = new HoaDon(UUID.randomUUID().toString(), new java.sql.Date(date.getTime()), sdt, diaChi, tenKhachHang, 0, null);
                hoaDonService.addOrUpdate(hoaDon);
                for (String keySP : key) {
                    Integer value = gioHangMap.get(keySP);
                    ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(keySP);
                    danhSachGH.put(chiTietSP, value);
                    tongTienHang += chiTietSP.getGiaBan() * value;
                    soLuongSanPhamTrongGioHang += value;
                    HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet(BigDecimal.valueOf(value * chiTietSP.getGiaBan()), value, chiTietSP, hoaDon);
                    hoaDonChiTietService.addOrUpDate(hoaDonChiTiet);
                }
                model.addAttribute("hoaDon", hoaDon);
                model.addAttribute("sanPhamMua", danhSachGH);
                model.addAttribute("time", date);
                model.addAttribute("email", email);
                model.addAttribute("tongTienHang", tongTienHang);
                model.addAttribute("soHoaDon", Math.floor((Math.random() * 899999999) + 1000000000));
            } else {
                Date date = new Date();
                HoaDon hoaDon = new HoaDon(UUID.randomUUID().toString(), new java.sql.Date(date.getTime()), sdt, diaChi, tenKhachHang, 0, account);
                hoaDonService.addOrUpdate(hoaDon);
                GioHang gioHang = gioHangService.findGioHangByAccount(account);
                List<GioHangChiTiet> gioHangChiTietList = gioHangChiTietService.findGioHangChiTietByGioHang(gioHang);
                double tongTienHang = 0;
                double tongTienGiamGia = 0;
                for (GioHangChiTiet gioHangChiTiet : gioHangChiTietList) {
                    HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet(gioHangChiTiet.getDonGiaKhiGiam(), gioHangChiTiet.getSoLuong(), gioHangChiTiet.getChiTietSP(), hoaDon);
                    ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(gioHangChiTiet.getChiTietSP().getId());
                    chiTietSP.setSoLuongTon(chiTietSP.getSoLuongTon() - gioHangChiTiet.getSoLuong());
                    if (chiTietSP.getVoucher() != 0) {
                        tongTienGiamGia += ((chiTietSP.getVoucher() * chiTietSP.getGiaBan()) / 100) * gioHangChiTiet.getSoLuong();
                    }
                    tongTienHang += gioHangChiTiet.getDonGiaKhiGiam().doubleValue();
                    hoaDonChiTietService.addOrUpDate(hoaDonChiTiet);

                }
                model.addAttribute("sanPhamMua", gioHangChiTietList);
                model.addAttribute("giamGia", tongTienGiamGia);
                model.addAttribute("time", date);
                model.addAttribute("hoaDon", hoaDon);
                model.addAttribute("email", email);
                model.addAttribute("tongTienHang", tongTienHang);
                model.addAttribute("soHoaDon", Math.floor((Math.random() * 899999999) + 1000000000));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "bill";
    }


}
