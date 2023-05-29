package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


@Controller
@RequestMapping("/manage-product")
@MultipartConfig
public class ManageProduct {

    @Autowired
    @Qualifier(value = "ChiTietSanPhamService")
    private IChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    @Qualifier(value = "DongSanPhamService")
    private IDongSanPhamService dongSanPhamService;

    @Autowired
    @Qualifier(value = "MauSacService")
    private IMauSacService mauSacService;

    @Autowired
    @Qualifier(value = "NhaSanXuatService")
    private INhaSanXuatService nhaSanXuatService;

    @Autowired
    @Qualifier(value = "SanPhamService")
    private ISanPhamService sanPhamService;

    @Autowired
    ServletContext servletContext;

    @Autowired
    ResourceLoader resourceLoader;

    @Autowired
    private IGioHangChiTietService gioHangChiTietService;

    @Autowired
    private IHoaDonChiTietService hoaDonChiTietService;

    private ChiTietSP chiTietSPUpdate = null;

    private List<HoaDonChiTiet> listHoaDonChiTietByIdCtsp = new ArrayList<>();

    @GetMapping
    public String viewManage(Model model, Optional<Integer> trangSo) {
        model.addAttribute("dongSP", dongSanPhamService.getAll());
        model.addAttribute("mauSac", mauSacService.getAll());
        model.addAttribute("sanPham", sanPhamService.getAll());
        model.addAttribute("nsx", nhaSanXuatService.getAll());
        Pageable pageable = PageRequest.of(trangSo.orElse(0), 4);
        Page<ChiTietSP> chiTietSPPage = chiTietSanPhamService.phanTrangChiTietSP(pageable);
        List<Integer> phanTrangSo = new ArrayList<>();
        model.addAttribute("chiTietSp", chiTietSPPage.getContent());
        model.addAttribute("tongSoTrangCo", chiTietSPPage.getTotalPages());
        model.addAttribute("trangHienTai", chiTietSPPage.getNumber());
        for (int i = 0; i < chiTietSPPage.getTotalPages(); i++) {
            phanTrangSo.add(i);
        }
        model.addAttribute("soTrang", phanTrangSo);
//
        return "manage-product";
    }

    @GetMapping("/{soTrang}")
    public String viewTrang(Model model, @PathVariable("soTrang") Optional<Integer> pageNumber) {
        viewManage(model, Optional.of(pageNumber.get() - 1));
        return "manage-product";
    }

    private String genMa() {
        return String.valueOf(UUID.randomUUID());
    }

    @PostMapping("/nsx/add")
    public String addProductNsx(Model model, @RequestParam(name = "tenNsx") String ten, Optional<Integer> trangSo) {
        NhaSanXuat nhaSanXuat = new NhaSanXuat(genMa(), ten);
        nhaSanXuatService.add(nhaSanXuat);
        viewManage(model, Optional.of(trangSo.orElse(0)));
        return "redirect:/manage-product";
    }

    @PostMapping("/mau-sac/add")
    public String addProductDongSanPham(Model model, Optional<Integer> trangSo, @RequestParam(name = "tenMauSac") String ten) {
        MauSac mauSac = new MauSac(genMa(), ten);
        mauSacService.addOrUpdate(mauSac);
        viewManage(model, Optional.of(trangSo.orElse(0)));
        return "redirect:/manage-product";
    }


    public void upLoadImage(MultipartFile pattFile) throws IOException {
        if (!pattFile.isEmpty()) {
            String fileName = pattFile.getOriginalFilename();
            String url = servletContext.getRealPath("/WEB-INF/view/image/product/");
            File file = new File(url + fileName);
            pattFile.transferTo(file);
        }
    }

    @PostMapping("/add")
    public String updateProduct(Model model, HttpServletRequest request, Optional<Integer> trangSo, @RequestParam(name = "tenSanPham") String sanPham, @RequestParam(name = "nsx") String nsx, @RequestParam(name = "soLuong") int soLuong, @RequestParam(name = "mauSac") String mauSac, @RequestParam(name = "size") Integer size, @RequestParam(name = "namBH") int namBH, @RequestParam(name = "giaNhap") float giaNhap, @RequestParam(name = "giaBan") float giaBan, @RequestParam(name = "moTa") String moTa, @RequestParam(name = "file") MultipartFile fileName) throws IOException {
        SanPham sanPhamByName = sanPhamService.findSanPhamByTen(sanPham);
        SanPham sanPhamAddName = null;
        if (sanPhamByName == null) {
            sanPhamAddName = new SanPham(genMa(), sanPham);
            sanPhamService.add(sanPhamAddName);
        } else {
            sanPhamAddName = sanPhamByName;
        }

        String anh = fileName.getOriginalFilename();
        NhaSanXuat sanXuat = nhaSanXuatService.getOne(nsx);
        MauSac mauSacAdd = mauSacService.getOne(mauSac);
        DongSP dongSPAdd = new DongSP(UUID.randomUUID().toString(), "Giày leo núi");
        dongSanPhamService.add(dongSPAdd);
        ChiTietSP chiTietSP = null;
        if (chiTietSPUpdate == null) {
            chiTietSP = new ChiTietSP(sanXuat, mauSacAdd, sanPhamAddName, dongSPAdd, namBH, moTa, anh, soLuong, giaNhap, giaBan, size);
        } else {
            chiTietSP = new ChiTietSP(chiTietSPUpdate.getId(), sanXuat, mauSacAdd, sanPhamAddName, dongSPAdd, namBH, moTa, anh, soLuong, giaNhap, giaBan, size);
        }
//        nếu so luong ,gia ban , gia nhap < 0
        if (namBH < 0) {
            model.addAttribute("ctsp", chiTietSP);
            model.addAttribute("namBhss", "Phải lớn hơn 0");
            viewManage(model, Optional.of(trangSo.orElse(0)));
            return "manage-product";
        } else if (soLuong < 0) {
            model.addAttribute("ctsp", chiTietSP);
            model.addAttribute("soLuongss", "Phải lớn hơn 0");
            viewManage(model, Optional.of(trangSo.orElse(0)));
            return "manage-product";
        } else if (giaBan < 0) {
            model.addAttribute("ctsp", chiTietSP);
            model.addAttribute("giaBanss", "Phải lớn hơn 0");
            viewManage(model, Optional.of(trangSo.orElse(0)));
            return "manage-product";
        } else if (giaNhap < 0) {
            model.addAttribute("ctsp", chiTietSP);
            model.addAttribute("giaNhapss", "Phải lớn hơn 0");
            viewManage(model, Optional.of(trangSo.orElse(0)));
            return "manage-product";
        } else {
            int viTriDauCham = anh.indexOf(".");
            String duoiImage = anh.substring(viTriDauCham + 1).trim();
            if (duoiImage.equalsIgnoreCase("jpeg") || duoiImage.equalsIgnoreCase("png") || duoiImage.equalsIgnoreCase("svg") || duoiImage.equalsIgnoreCase("jpg") || duoiImage.equalsIgnoreCase("tiff") || duoiImage.equalsIgnoreCase("heic")) {
                if (!fileName.isEmpty()) {
                    // Lấy tên file gốc
                    String originalFileName = fileName.getOriginalFilename();
                    // Lấy đường dẫn thư mục static
                    String staticPath = "/static/";
                    // Lấy đường dẫn gốc của ứng dụng
                    String appPath = request.getContextPath();
                    // Tạo đường dẫn tới file trong thư mục static
                    String imagePath = appPath + staticPath + originalFileName;
                    // Lưu ảnh lên thư mục static
                    try (InputStream inputStream = fileName.getInputStream()) {
                        String realPath = request.getServletContext().getRealPath(staticPath);
                        File staticDir = new File(realPath);
                        File file = new File(staticDir, originalFileName);
                        try (OutputStream outputStream = new FileOutputStream(file)) {
                            FileCopyUtils.copy(inputStream, outputStream);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                ChiTietSP sp = chiTietSanPhamService.add(chiTietSP);
                chiTietSPUpdate = null;
                viewManage(model, Optional.of(trangSo.orElse(0)));
                return "redirect:/manage-product";
            } else {
                model.addAttribute("thongBaoImg", "Vui lòng chọn ảnh không chọn cái khác!");
                model.addAttribute("ctsp", chiTietSP);
                viewManage(model, Optional.of(trangSo.orElse(0)));
                return "manage-product";
            }
        }

    }

    @GetMapping("/detail/{idProduct}")
    public String detail(Model model, Optional<Integer> trangSo, @PathVariable(name = "idProduct") String id) {
        chiTietSPUpdate = chiTietSanPhamService.findAllById(id);
        model.addAttribute("ctsp", chiTietSPUpdate);
        viewManage(model, Optional.of(trangSo.orElse(0)));
        return "manage-product";
    }

    @GetMapping("/delete/{idChiTietSanPham}")
    public String delete(Model model, Optional<Integer> trangSo, @PathVariable(name = "idChiTietSanPham") String id) {
        try {
            ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(id);
//            xóa hóa dơn có chi tiết sản phẩm là id .....
            chiTietSPUpdate = chiTietSP;
            listHoaDonChiTietByIdCtsp = hoaDonChiTietService.findHoaDonChiTietByChiTietSP(chiTietSP);
            for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTietByIdCtsp) {
                hoaDonChiTietService.delete(hoaDonChiTiet);
            }
//            System.out.println(listHoaDonChiTietByIdCtsp);
            List<GioHangChiTiet> gioHangChiTietListCtsp = gioHangChiTietService.findGioHangChiTietByChiTietSP(chiTietSP);
            for (GioHangChiTiet gioHangChiTiet : gioHangChiTietListCtsp) {
                gioHangChiTietService.delete(gioHangChiTiet);
            }
            chiTietSanPhamService.delete(chiTietSP);
//            add lại hóa đơn
            for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTietByIdCtsp) {
                hoaDonChiTietService.addOrUpDate(hoaDonChiTiet);
            }
            chiTietSPUpdate = null;
            listHoaDonChiTietByIdCtsp = null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        viewManage(model, Optional.of(trangSo.orElse(0)));
        return "manage-product";
    }

}
