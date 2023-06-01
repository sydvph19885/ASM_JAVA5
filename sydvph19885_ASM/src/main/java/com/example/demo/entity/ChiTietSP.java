package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "chi_tietsp")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class ChiTietSP {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", columnDefinition = "VARCHAR(36)")
    private String id;
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "id_nsx")
    private NhaSanXuat nhaSanXuat;
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "id_dongsp")
    private DongSP dongSanPham;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChiTietSP chiTietSP = (ChiTietSP) o;
        return namBH == chiTietSP.namBH && soLuongTon == chiTietSP.soLuongTon && Float.compare(chiTietSP.giaNhap, giaNhap) == 0 && Float.compare(chiTietSP.giaBan, giaBan) == 0 && Objects.equals(id, chiTietSP.id) && Objects.equals(nhaSanXuat, chiTietSP.nhaSanXuat) && Objects.equals(mauSac, chiTietSP.mauSac) && Objects.equals(sanPham, chiTietSP.sanPham) && Objects.equals(dongSanPham, chiTietSP.dongSanPham) && Objects.equals(moTa, chiTietSP.moTa) && Objects.equals(image, chiTietSP.image);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nhaSanXuat, mauSac, sanPham, dongSanPham, namBH, moTa, image, soLuongTon, giaNhap, giaBan);
    }

    @Column(name = "nambh")
    private int namBH;
    @Column(name = "mo_ta", columnDefinition = "NVARCHAR(MAX)")
    private String moTa;
    @Column(name = "Img", columnDefinition = "NVARCHAR(MAX)")
    private String image;
    @Column(name = "so_luong_ton")
    private int soLuongTon;
    @Column(name = "gia_nhap")
    private float giaNhap;
    @Column(name = "gia_ban")
    private float giaBan;
    @Column(name = "size")
    private int size;
    @Column(name = "ngay_nhap")
    private Date ngayNhap;
    @Column(name = "voucher")
    private int voucher;


    public ChiTietSP(NhaSanXuat nhaSanXuat, MauSac mauSac, SanPham sanPham, DongSP dongSanPham, int namBH, String moTa, String image, int soLuongTon, float giaNhap, float giaBan, int size, Date ngayNhap, int voucher) {
        this.nhaSanXuat = nhaSanXuat;
        this.mauSac = mauSac;
        this.sanPham = sanPham;
        this.dongSanPham = dongSanPham;
        this.namBH = namBH;
        this.moTa = moTa;
        this.image = image;
        this.soLuongTon = soLuongTon;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.size = size;
        this.ngayNhap = ngayNhap;
        this.voucher = voucher;
    }
}
