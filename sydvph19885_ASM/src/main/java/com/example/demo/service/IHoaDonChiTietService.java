package com.example.demo.service;

import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDonChiTiet;
import com.example.demo.viewModel.HoaDonChiTietViewModel;

import java.util.List;

public interface IHoaDonChiTietService {
    String addOrUpDate(HoaDonChiTiet hoaDonChiTiet);

    String delete(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> findAll();

    List<HoaDonChiTiet> findHoaDonChiTietByChiTietSP(ChiTietSP chiTietSP);

    List<HoaDonChiTietViewModel> top10BanChay();
}
