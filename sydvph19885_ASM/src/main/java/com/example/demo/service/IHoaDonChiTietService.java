package com.example.demo.service;

import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDonChiTiet;

import java.util.List;

public interface IHoaDonChiTietService {
    String addOrUpDate(HoaDonChiTiet hoaDonChiTiet);

    String delete(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> findAll();

    List<HoaDonChiTiet> findHoaDonChiTietByChiTietSP(ChiTietSP chiTietSP);
}
