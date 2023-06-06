package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.GioHang;
import com.example.demo.entity.GioHangChiTiet;

import java.util.List;

public interface IGioHangChiTietService {
    String addOrUpdate(GioHangChiTiet gioHangChiTiet);

    List<GioHangChiTiet> getAll();

    GioHangChiTiet findGioHangChiTietByChiTietSPAndAndGioHang(ChiTietSP chiTietSP, GioHang gioHang);

    List<GioHangChiTiet> findGioHangChiTietByGioHang(GioHang gioHang);

    GioHangChiTiet findGioHangChiTietById(String id);

    String delete(GioHangChiTiet gioHangChiTiet);

    List<GioHangChiTiet> findGioHangChiTietByChiTietSP(ChiTietSP chiTietSP);

}
