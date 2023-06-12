package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDon;
import com.example.demo.entity.HoaDonChiTiet;
import com.example.demo.viewModel.HoaDonChiTietViewModel;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IHoaDonChiTietService {
    String addOrUpDate(HoaDonChiTiet hoaDonChiTiet);

    String delete(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> findAll();

    List<HoaDonChiTiet> findHoaDonChiTietByChiTietSP(ChiTietSP chiTietSP);

    List<HoaDonChiTietViewModel> top10BanChay();

    List<HoaDonChiTietViewModel> findHoaDonChiTietByHoaDon(@Param(value = "account") Account account);
}
