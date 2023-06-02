package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import jakarta.annotation.Resource;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.*;


@Controller
@MultipartConfig
public class TrangChuController {

    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private IAccountService accountService;

    @Autowired
    private HttpSession session;

    @Autowired
    private IGioHangService gioHangService;

    @Autowired
    IGioHangChiTietService gioHangChiTietService;


    private final Map<ChiTietSP, Integer> danhSachSanPham = new HashMap<>();


    public int getSoLuongSanPhamTrongGioHang(int soLuong) {
        Account account = (Account) session.getAttribute("account");
        GioHang gioHang = gioHangService.findGioHangByAccount(account);
        List<GioHangChiTiet> gioHangChiTietList = gioHangChiTietService.findGioHangChiTietByGioHang(gioHang);
        for (GioHangChiTiet gioHangChiTiet : gioHangChiTietList) {
            soLuong += gioHangChiTiet.getSoLuong();
        }
        return soLuong;
    }

    public Page<ChiTietSP> phanTrangSP(Optional<Integer> soLuong) {
        Pageable pageable = PageRequest.of(soLuong.orElse(0), 8);
        return chiTietSanPhamService.phanTrangChiTietSP(pageable);
    }


    @GetMapping("/home")
    public String viewTrangChu(Model model, @PathVariable("pageNumber") Optional<Integer> pageNumber) {
        Account account = (Account) session.getAttribute("account");
        int soLuongThem = 0;
        int soLuongSanPhamTrongGioHang = getSoLuongSanPhamTrongGioHang(soLuongThem);
        if (account == null) {
            Map<String, Integer> danhSachGioHang = gioHangService.getAllGioHang();
            Map<String, Integer> gioHangMap = gioHangService.getAllGioHang();
            Set<String> key = gioHangMap.keySet();
            Map<ChiTietSP, Integer> danhSachGH = new HashMap<>();
            int soLuongSPUser = 0;
            for (String keySP : key) {
                Integer value = gioHangMap.get(keySP);
                ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(keySP);
                danhSachGH.put(chiTietSP, value);
                soLuongSPUser += value;
            }
            model.addAttribute("soLuong", soLuongSPUser);
        } else {
            model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
        }

        List<Integer> phanTrangSo = new ArrayList<>();
        model.addAttribute("sanPham", phanTrangSP(pageNumber).getContent());
        model.addAttribute("tongSoTrangCo", phanTrangSP(pageNumber).getTotalPages());
        model.addAttribute("trangHienTai", phanTrangSP(pageNumber).getNumber());
        for (int i = 0; i < phanTrangSP(pageNumber).getTotalPages(); i++) {
            phanTrangSo.add(i);
        }
        System.out.println("1111111:" + phanTrangSP(pageNumber).getContent());
        model.addAttribute("soTrang", phanTrangSo);
//
        model.addAttribute("giaMin", Integer.valueOf((int) chiTietSanPhamService.findByOrderByGiaBanAsc().get(0).getGiaBan()));
        model.addAttribute("giaMax", Integer.valueOf((int) chiTietSanPhamService.findByOrderByGiaBanDesc().get(0).getGiaBan()));
        return "trang-chu";
    }

    @GetMapping("/home/{numBerPage}")
    public String page(Model model, @PathVariable(name = "numBerPage") Optional<Integer> trangSo) {
        viewTrangChu(model, Optional.of(trangSo.get() - 1));
        return "trang-chu";
    }

    @GetMapping("/change-password")
    public String changePass() {
        return "change-pass";
    }

    @PostMapping("/change-password")
    public String saveChangePass(Model model, @RequestParam(name = "currentPass") String currentPass, @RequestParam(name = "newPass") String newPass, @RequestParam(name = "confirmPass") String confirmPass) {
        Account account = (Account) session.getAttribute("account");
        session.setAttribute("currentPass", currentPass);
        session.setAttribute("newPass", newPass);
        session.setAttribute("confirmPass", confirmPass);
        if (!account.getMatKhau().equals(currentPass)) {
            model.addAttribute("thongBao", "Mật khẩu cũ không đúng!");
            viewCart(model);
            return "change-pass";
        } else if (!confirmPass.equals(newPass)) {
            model.addAttribute("thongBao", "Vui lòng xác nhận lại mật khẩu!");
            viewCart(model);
            return "change-pass";
        } else {
            try {
                account.setMatKhau(confirmPass);
                accountService.saveOrUpdate(account);
                session.invalidate();
                model.addAttribute("account", account);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return "redirect:/login";
        }
    }

    @GetMapping("/detail/{detail}")
    public String detail(Model model, @PathVariable(name = "detail") String id) {
        ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(id);
        model.addAttribute("detail", chiTietSP);
        int soLuongThem = 0;
        int soLuongSanPhamTrongGioHang = getSoLuongSanPhamTrongGioHang(soLuongThem);
        model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
        return "detail";
    }

    @GetMapping("/cart")
    public String viewCart(Model model) {
        try {
            Account account = (Account) session.getAttribute("account");
//        view cart người dùng
            if (account == null) {
                Map<String, Integer> gioHangMap = gioHangService.getAllGioHang();
                Set<String> key = gioHangMap.keySet();
                Map<ChiTietSP, Integer> danhSachGH = new HashMap<>();
                int tongTienHang = 0;
                int soLuongSanPhamTrongGioHang = 0;
                for (String keySP : key) {
                    Integer value = gioHangMap.get(keySP);
                    ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(keySP);
                    danhSachGH.put(chiTietSP, value);
                    tongTienHang += chiTietSP.getGiaBan() * value;
                    soLuongSanPhamTrongGioHang += value;
                }
                model.addAttribute("gioHang", danhSachGH);
                model.addAttribute("tongTienHang", tongTienHang);
                model.addAttribute("vat", tongTienHang + ((tongTienHang * 10) / 100));
                model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
            } else {
                int soLuongSanPhamTrongGioHang = 0;
                double tongTienHang = 0;
                GioHang gioHang = gioHangService.findGioHangByAccount(account);
                List<GioHangChiTiet> listGioHang = gioHangChiTietService.findGioHangChiTietByGioHang(gioHang);
                for (GioHangChiTiet gioHangChiTiet : listGioHang) {
                    tongTienHang += gioHangChiTiet.getDonGiaKhiGiam().doubleValue();
                    soLuongSanPhamTrongGioHang += gioHangChiTiet.getSoLuong();
                }
                model.addAttribute("tongTienHang", tongTienHang);
                model.addAttribute("vat", tongTienHang + ((tongTienHang * 10) / 100));
                model.addAttribute("gioHang", listGioHang);
                model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
                model.addAttribute("account", account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "cart";
    }


    @GetMapping("/cart/add/{idProductCat}")
    public String addCartUser(Model model, @PathVariable(name = "idProductCat") String idSP, Optional<Integer> page) {
        try {
            Account account = (Account) session.getAttribute("account");
            GioHang gioHang = gioHangService.findGioHangByAccount(account);
            ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(idSP);
//        nếu số lượng tồn của sản phẩm hết
            if (chiTietSP.getSoLuongTon() <= 0) {
                model.addAttribute("soLuongTon", "Sản phẩm này đã hết hàng! Vui lòng chọn sản phẩm khác!");
            } else {
                //        nếu không có tài khoản đăng nhập
                if (account == null) {
                    Map<String, Integer> gioHangMap = gioHangService.getAllGioHang();
                    Set<String> key = gioHangMap.keySet();
                    gioHangService.addGioHangUser(idSP, 1);
                } else {
                    //     có tài khoản đăng nhập
//            nếu giỏ hàng chưa có khách hàng -> tạo
                    if (gioHang == null) {
                        Date date = new Date();
                        GioHang gioHangClient = new GioHang(UUID.randomUUID().toString(), new java.sql.Date(date.getTime()), account);
                        gioHangService.addOrUpdateGioHangClient(gioHangClient);
//                tạo gio hàng xong -> tạo gio hang chi tiet
                        GioHangChiTiet gioHangChiTiet = null;
                        if (chiTietSP.getVoucher() == 0) {
                            gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() * 1), 1, chiTietSP, gioHangClient);
                        } else {
                            gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() - ((chiTietSP.getGiaBan() * chiTietSP.getVoucher()) / 100)), 1, chiTietSP, gioHangClient);
                        }

                        gioHangChiTietService.addOrUpdate(gioHangChiTiet);
                    } else {
                        //                nếu đã có giỏ hàng -> tạo giỏ hàng chi tiết
                        GioHangChiTiet gioHangChiTietByCtspAndAccount = gioHangChiTietService.findGioHangChiTietByChiTietSPAndAndGioHang(chiTietSP, gioHang);
                        //                check gio hang chi tiet xem có sản phẩm đó hay chưa:neu rồi -> thi cộng số lượng
                        if (gioHangChiTietByCtspAndAccount != null) {
                            gioHangChiTietByCtspAndAccount.setSoLuong(gioHangChiTietByCtspAndAccount.getSoLuong() + 1);
                            gioHangChiTietByCtspAndAccount.setDonGia(BigDecimal.valueOf(gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan()));
                            if (chiTietSP.getVoucher() == 0) {
                                gioHangChiTietByCtspAndAccount.setDonGiaKhiGiam(BigDecimal.valueOf(gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan()));
                            } else {
                                gioHangChiTietByCtspAndAccount.setDonGiaKhiGiam(BigDecimal.valueOf((gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan()) - ((gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan() * chiTietSP.getVoucher()) / 100)));
                            }

                            gioHangChiTietService.addOrUpdate(gioHangChiTietByCtspAndAccount);
                        } else {
                            GioHangChiTiet gioHangChiTiet = null;
                            if (chiTietSP.getVoucher() == 0) {
                                gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() * 1), 1, chiTietSP, gioHang);
                            } else {
                                gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() - ((chiTietSP.getGiaBan() * chiTietSP.getVoucher()) / 100)), 1, chiTietSP, gioHang);
                            }
                            gioHangChiTietService.addOrUpdate(gioHangChiTiet);
                        }

                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        viewTrangChu(model, Optional.of(page.orElse(0)));
//        return "redirect:/home";
        return "trang-chu";
    }

    @GetMapping("/cart/buy-now/{idProductCat}")
    public String buyNow(Model model, @PathVariable(name = "idProductCat") String idSP, Optional<Integer> page) {
        try {
            Account account = (Account) session.getAttribute("account");
            GioHang gioHang = gioHangService.findGioHangByAccount(account);
            ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(idSP);
//        nếu số lượng tồn của sản phẩm hết
            if (chiTietSP.getSoLuongTon() <= 0) {
                model.addAttribute("soLuongTon", "Sản phẩm này đã hết hàng! Vui lòng chọn sản phẩm khác!");
            } else {
                //        nếu không có tài khoản đăng nhập
                if (account == null) {
                    Map<String, Integer> gioHangMap = gioHangService.getAllGioHang();
                    Set<String> key = gioHangMap.keySet();
                    gioHangService.addGioHangUser(idSP, 1);
                } else {
                    //     có tài khoản đăng nhập
//            nếu giỏ hàng chưa có khách hàng -> tạo
                    if (gioHang == null) {
                        Date date = new Date();
                        GioHang gioHangClient = new GioHang(UUID.randomUUID().toString(), new java.sql.Date(date.getTime()), account);
                        gioHangService.addOrUpdateGioHangClient(gioHangClient);
//                tạo gio hàng xong -> tạo gio hang chi tiet
                        GioHangChiTiet gioHangChiTiet = null;
                        if (chiTietSP.getVoucher() == 0) {
                            gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() * 1), 1, chiTietSP, gioHangClient);
                        } else {
                            gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() - ((chiTietSP.getGiaBan() * chiTietSP.getVoucher()) / 100)), 1, chiTietSP, gioHangClient);
                        }

                        gioHangChiTietService.addOrUpdate(gioHangChiTiet);
                    } else {
                        //                nếu đã có giỏ hàng -> tạo giỏ hàng chi tiết
                        GioHangChiTiet gioHangChiTietByCtspAndAccount = gioHangChiTietService.findGioHangChiTietByChiTietSPAndAndGioHang(chiTietSP, gioHang);
                        //                check gio hang chi tiet xem có sản phẩm đó hay chưa:neu rồi -> thi cộng số lượng
                        if (gioHangChiTietByCtspAndAccount != null) {
                            gioHangChiTietByCtspAndAccount.setSoLuong(gioHangChiTietByCtspAndAccount.getSoLuong() + 1);
                            gioHangChiTietByCtspAndAccount.setDonGia(BigDecimal.valueOf(gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan()));
                            if (chiTietSP.getVoucher() == 0) {
                                gioHangChiTietByCtspAndAccount.setDonGiaKhiGiam(BigDecimal.valueOf(gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan()));
                            } else {
                                gioHangChiTietByCtspAndAccount.setDonGiaKhiGiam(BigDecimal.valueOf((gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan()) - ((gioHangChiTietByCtspAndAccount.getSoLuong() * chiTietSP.getGiaBan() * chiTietSP.getVoucher()) / 100)));
                            }

                            gioHangChiTietService.addOrUpdate(gioHangChiTietByCtspAndAccount);
                        } else {
                            GioHangChiTiet gioHangChiTiet = null;
                            if (chiTietSP.getVoucher() == 0) {
                                gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() * 1), 1, chiTietSP, gioHang);
                            } else {
                                gioHangChiTiet = new GioHangChiTiet(BigDecimal.valueOf(chiTietSP.getGiaBan()), BigDecimal.valueOf(chiTietSP.getGiaBan() - ((chiTietSP.getGiaBan() * chiTietSP.getVoucher()) / 100)), 1, chiTietSP, gioHang);
                            }
                            gioHangChiTietService.addOrUpdate(gioHangChiTiet);
                        }

                    }
                }
                viewCart(model);
                return "cart";
            }
        } catch (Exception e) {
            e.printStackTrace();
            viewTrangChu(model, Optional.of(page.orElse(0)));
            return "trang-chu";
        }
        viewCart(model);
        return "cart";
    }

    @GetMapping("/profile")
    public String viewProfile(Model model) {
        Account account = (Account) session.getAttribute("account");
        model.addAttribute("lastName", account.getHoTen().substring(0, account.getHoTen().indexOf(" ")));
        model.addAttribute("firstName", account.getHoTen().substring(account.getHoTen().indexOf(" ") + 1));
        model.addAttribute("account", account);
        viewCart(model);
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(Model model, HttpServletRequest request, @RequestParam(name = "ho") String ho, @RequestParam(name = "ten") String ten, @RequestParam(name = "email") String email, @RequestParam(name = "sdt") String sdt, @RequestParam(name = "image") MultipartFile image) {
        try {
            Account account = (Account) session.getAttribute("account");
            account.setEmail(email);
            account.setHoTen(ho + " " + ten);
            account.setImage(image.getOriginalFilename());
            account.setSdt(sdt);
            if (!image.isEmpty()) {
                // Lấy tên file gốc
                String originalFileName = image.getOriginalFilename();
                // Lấy đường dẫn thư mục static
                String staticPath = "/static/";
                // Lấy đường dẫn gốc của ứng dụng
                String appPath = request.getContextPath();
                // Tạo đường dẫn tới file trong thư mục static
                String imagePath = appPath + staticPath + originalFileName;
                // Lưu ảnh lên thư mục static
                try (InputStream inputStream = image.getInputStream()) {
                    String realPath = request.getServletContext().getRealPath(staticPath);
                    File staticDir = new File(realPath);
                    File file12 = new File(staticDir, originalFileName);
                    try (OutputStream outputStream = new FileOutputStream(file12)) {
                        FileCopyUtils.copy(inputStream, outputStream);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            accountService.saveOrUpdate(account);
            model.addAttribute("thongBao", "Cập nhật tài khoản thành công");
        } catch (Exception e) {
            e.printStackTrace();
        }
        viewCart(model);
        return "profile";
    }

    @GetMapping("/search")
    public String findAllChiTSPBySanPham_Name(Model model, @RequestParam(name = "trangSo") Optional<Integer> trangSo, @RequestParam(name = "tenSearch") String tenSearch, @RequestParam("pageNumber") Optional<Integer> pageNumber) {
        try {
            if (!tenSearch.isEmpty() || tenSearch != null) {
                Pageable pageable = PageRequest.of(trangSo.orElse(0), 8);
                Page<ChiTietSP> chiTietSPListNameSanPham = chiTietSanPhamService.findAllBySanPham_Ten(tenSearch, pageable);
                Map<String, Integer> danhSachGioHang = gioHangService.getAllGioHang();
                int soLuongThem = 0;
                int soLuongSanPhamTrongGioHang = getSoLuongSanPhamTrongGioHang(soLuongThem);
                model.addAttribute("sanPham", chiTietSPListNameSanPham.getContent());
                model.addAttribute("tongSoTrangCo", chiTietSPListNameSanPham.getTotalPages());
                model.addAttribute("trangHienTai", chiTietSPListNameSanPham.getNumber());
                List<Integer> phanTrangSo = new ArrayList<>();
                for (int i = 0; i < chiTietSPListNameSanPham.getTotalPages(); i++) {
                    phanTrangSo.add(i);
                }
                model.addAttribute("soTrang", phanTrangSo);
                model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
                model.addAttribute("gioHang", danhSachGioHang);
                model.addAttribute("giaMin", Integer.valueOf((int) chiTietSanPhamService.findByOrderByGiaBanAsc().get(0).getGiaBan()));
                model.addAttribute("giaMax", Integer.valueOf((int) chiTietSanPhamService.findByOrderByGiaBanDesc().get(0).getGiaBan()));
                return "trang-chu";
            } else {
                return "redirect:/home";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/home";
        }

    }

    @GetMapping("/search-between-price")
    public String timTheoKhoangGia(Model model, @RequestParam(name = "trangSo") Optional<Integer> trangSo, @RequestParam(name = "selectedPriceMin") Integer giaMin, @RequestParam(name = "selectedPriceMax") Integer giaMax) {
        try {
            int soLuongThem = 0;
            int soLuongSanPhamTrongGioHang = getSoLuongSanPhamTrongGioHang(soLuongThem);
            Map<String, Integer> danhSachGioHang = gioHangService.getAllGioHang();
            Pageable pageable = PageRequest.of(trangSo.orElse(0), 8);
            Page<ChiTietSP> chiTietSPPageByPriceBetween = chiTietSanPhamService.findByGiaBanBetween(giaMin, giaMax, pageable);
            model.addAttribute("sanPham", chiTietSPPageByPriceBetween.getContent());
            model.addAttribute("tongSoTrangCo", chiTietSPPageByPriceBetween.getTotalPages());
            model.addAttribute("trangHienTai", chiTietSPPageByPriceBetween.getNumber());
            List<Integer> phanTrangSo = new ArrayList<>();
            for (int i = 0; i < chiTietSPPageByPriceBetween.getTotalPages(); i++) {
                phanTrangSo.add(i);
            }
            model.addAttribute("soTrang", phanTrangSo);
            model.addAttribute("soLuong", soLuongSanPhamTrongGioHang);
            model.addAttribute("gioHang", danhSachGioHang);
            model.addAttribute("giaMin", Integer.valueOf((int) chiTietSanPhamService.findByOrderByGiaBanAsc().get(0).getGiaBan()));
            model.addAttribute("giaMax", Integer.valueOf((int) chiTietSanPhamService.findByOrderByGiaBanDesc().get(0).getGiaBan()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        viewCart(model);
        return "trang-chu";
    }

    @GetMapping("/contact")
    public String viewContact(Model model) {
        viewCart(model);
        return "contact";
    }

    @GetMapping("/drop")
    public String demo(Model model) {
        return "mau";
    }


}
