package com.example.demo.utill;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.UUID;

@Component
public class GenDB {
    @Autowired
    @Qualifier(value = "SanPhamService")
    private static ISanPhamService sanPhamService;
    @Autowired
    @Qualifier(value = "DongSanPhamService")
    private static IDongSanPhamService dongSanPhamService;
    @Autowired
    @Qualifier(value = "MauSacService")
    private static IMauSacService mauSacService;
    @Autowired
    @Qualifier(value = "NhaSanXuatService")
    private static INhaSanXuatService nhaSanXuatService;
    @Autowired
    @Qualifier(value = "ChiTietSanPhamService")
    private static IChiTietSanPhamService chiTietSanPhamService;

    public static void main(String[] args) {
//        sản phẩm
        SanPham sanPham = new SanPham(UUID.randomUUID().toString(), "GIÀY TRAIL TERREX AGRAVIC FLOW 2.0");
        SanPham sanPham1 = new SanPham(UUID.randomUUID().toString(), "GIÀY HIKING AX4 TERREX");
        SanPham sanPham2 = new SanPham(UUID.randomUUID().toString(), "GIÀY ULTRABOOST 5.0 DNA");
        SanPham sanPham3 = new SanPham(UUID.randomUUID().toString(), "GIÀY HIKING TERREX FREE HIKER 2.0");
        SanPham sanPham4 = new SanPham(UUID.randomUUID().toString(), "GIÀY ULTRABOOST WEB DNA");
        SanPham sanPham5 = new SanPham(UUID.randomUUID().toString(), "GIÀY CONTINENTAL 80 PRO");
        SanPham sanPham6 = new SanPham(UUID.randomUUID().toString(), "GIÀY HAKING TERREX VOYAGER 21");

        sanPhamService.add(sanPham1);
        sanPhamService.add(sanPham2);
        sanPhamService.add(sanPham3);
        sanPhamService.add(sanPham4);
        sanPhamService.add(sanPham5);
        sanPhamService.add(sanPham6);
        sanPhamService.add(sanPham);

//        mau sac
        MauSac mauSac = new MauSac(UUID.randomUUID().toString(), "Màu Tím");
        MauSac mauSac1 = new MauSac(UUID.randomUUID().toString(), "Màu Nâu");
        MauSac mauSac2 = new MauSac(UUID.randomUUID().toString(), "Màu Hồng");
        MauSac mauSac3 = new MauSac(UUID.randomUUID().toString(), "Màu Xanh");
        MauSac mauSac4 = new MauSac(UUID.randomUUID().toString(), "Màu Đỏ");
        MauSac mauSac5 = new MauSac(UUID.randomUUID().toString(), "Màu Trắng");
        MauSac mauSac6 = new MauSac(UUID.randomUUID().toString(), "Màu Đen");
        MauSac mauSac7 = new MauSac(UUID.randomUUID().toString(), "Màu Vàng");
        MauSac mauSac8 = new MauSac(UUID.randomUUID().toString(), "Màu Vàng");

        mauSacService.addOrUpdate(mauSac);
        mauSacService.addOrUpdate(mauSac1);
        mauSacService.addOrUpdate(mauSac2);
        mauSacService.addOrUpdate(mauSac3);
        mauSacService.addOrUpdate(mauSac4);
        mauSacService.addOrUpdate(mauSac5);
        mauSacService.addOrUpdate(mauSac6);
        mauSacService.addOrUpdate(mauSac7);
        mauSacService.addOrUpdate(mauSac8);

//        dong sp

        DongSP dongSP = new DongSP(UUID.randomUUID().toString(), "Giày leo núi");
        dongSanPhamService.add(dongSP);
//        nha san xuat
        NhaSanXuat nhaSanXuat = new NhaSanXuat(UUID.randomUUID().toString(), "Adidas");
        NhaSanXuat nhaSanXuat1 = new NhaSanXuat(UUID.randomUUID().toString(), "Gucci");
        NhaSanXuat nhaSanXuat2 = new NhaSanXuat(UUID.randomUUID().toString(), "Nike");
        NhaSanXuat nhaSanXuat3 = new NhaSanXuat(UUID.randomUUID().toString(), "Mlb");
        nhaSanXuatService.add(nhaSanXuat);
        nhaSanXuatService.add(nhaSanXuat1);
        nhaSanXuatService.add(nhaSanXuat2);
        nhaSanXuatService.add(nhaSanXuat3);

//        chi tiet san pham
        ChiTietSP chiTietSP = new ChiTietSP();
        chiTietSP.setSanPham(sanPham);
        chiTietSP.setMauSac(mauSac);
        chiTietSP.setDongSanPham(dongSP);
        chiTietSP.setNhaSanXuat(nhaSanXuat);
        chiTietSP.setImage("GIÀY ULTRABOOST WEB DNA.png");
        chiTietSP.setSize(35);
        chiTietSP.setNamBH(1);
        chiTietSP.setGiaNhap(5000000);
        chiTietSP.setGiaBan(10000000);
        chiTietSP.setSoLuongTon(10);
        chiTietSP.setMoTa("Đôi giày adidas Ultraboost Web DNA này là sự kết hợp giữa cảm giác thoải mái của giày chạy bộ với thiết kế đơn giản mà phong cách. Thiết kế dạng lưới trên đế giữa và đế ngoài hé lộ lớp đệm Boost hoàn trả năng lượng bên trong. Thân giày adidas Primeknit co giãn và nâng đỡ. Sản phẩm này may bằng vải công nghệ Primeblue, chất liệu tái chế hiệu năng cao có sử dụng sợi Parley Ocean Plastic. 50% thân giày làm bằng vải dệt, 75% vải dệt bằng sợi Primeblue. Không sử dụng polyester nguyên sinh.");
        chiTietSP.setVoucher(0);
        chiTietSP.setNgayNhap(new Date(2022, 10, 03));
        chiTietSanPhamService.add(chiTietSP);

        //        chi tiet san pham1
        ChiTietSP chiTietSP1 = new ChiTietSP();
        chiTietSP1.setSanPham(sanPham1);
        chiTietSP1.setMauSac(mauSac1);
        chiTietSP1.setDongSanPham(dongSP);
        chiTietSP1.setNhaSanXuat(nhaSanXuat1);
        chiTietSP1.setImage("GIÀY CONTINENTAL 80.png");
        chiTietSP1.setSize(35);
        chiTietSP1.setNamBH(1);
        chiTietSP1.setGiaNhap(500000);
        chiTietSP1.setGiaBan(1000000);
        chiTietSP1.setSoLuongTon(2);
        chiTietSP1.setMoTa("Mang dáng vẻ hoài cổ, Continental 80 giữ trọn kiểu dáng xưa cũ của những đôi giày thể thao trong nhà từ đầu những năm 1980. Mẫu giày da nổi bật với sọc kẻ hai màu hướng xuống dưới và đế cupsole khác biệt bằng cao su phân tách cho cảm giác thoải mái và linh hoạt.");
        chiTietSP1.setVoucher(0);
        chiTietSP1.setNgayNhap(new Date(2021, 10, 03));
        chiTietSanPhamService.add(chiTietSP1);

        //        chi tiet san pham2
        ChiTietSP chiTietSP2 = new ChiTietSP();
        chiTietSP2.setSanPham(sanPham2);
        chiTietSP2.setMauSac(mauSac2);
        chiTietSP2.setDongSanPham(dongSP);
        chiTietSP2.setNhaSanXuat(nhaSanXuat2);
        chiTietSP2.setImage("GIÀY ULTRABOOST 5 DNA.png");
        chiTietSP2.setSize(38);
        chiTietSP2.setNamBH(1);
        chiTietSP2.setGiaNhap(3200000);
        chiTietSP2.setGiaBan(5700000);
        chiTietSP2.setSoLuongTon(10);
        chiTietSP2.setMoTa("Bất kỳ lúc nào bạn đứng trên đôi chân mình cũng là thời điểm thích hợp để mang đôi giày adidas Ultraboost này. Được trang bị đầy đủ công nghệ hiệu năng mà các runner ưa chuộng, giày còn có thiết kế mới mẻ đầy bắt mắt — hãy nhìn các chi tiết ánh kim mà xem. Đế giữa BOOST hoàn trả năng lượng và thân giày adidas PRIMEKNIT ôm chân đảm bảo điều đó.");
        chiTietSP2.setVoucher(10);
        chiTietSP2.setNgayNhap(new Date(2023, 01, 03));
        chiTietSanPhamService.add(chiTietSP2);

        //        chi tiet san pham3
        ChiTietSP chiTietSP3 = new ChiTietSP();
        chiTietSP3.setSanPham(sanPham3);
        chiTietSP3.setMauSac(mauSac3);
        chiTietSP3.setDongSanPham(dongSP);
        chiTietSP3.setNhaSanXuat(nhaSanXuat3);
        chiTietSP3.setImage("GIÀY TRAIL TERREX AGRAVIC FLOW 2.png");
        chiTietSP3.setSize(78);
        chiTietSP3.setNamBH(1);
        chiTietSP3.setGiaNhap(2500000);
        chiTietSP3.setGiaBan(4500000);
        chiTietSP3.setSoLuongTon(0);
        chiTietSP3.setMoTa("Đôi giày chạy địa hình adidas này đáp ứng được mọi nhu cầu. Chỉ cần bạn chọn được địa hình. Siêu nhẹ và thoải mái, đế giữa có độ đàn hồi cao mang đến cảm giác êm ái và mượt mà khi xuống đường dốc mòn. Đế Continental™ Rubber cho độ ma sát tuyệt vời trên địa hình gồ ghề, ẩm ướt hoặc khô ráo, cùng tấm bảo vệ chống đá sỏi ở đế giữa giúp đôi giày này thành lựa chọn hàng đầu trên những đường trail kỹ thuật.");
        chiTietSP3.setVoucher(80);
        chiTietSP3.setNgayNhap(new Date(2019, 10, 03));
        chiTietSanPhamService.add(chiTietSP3);
    }
}
