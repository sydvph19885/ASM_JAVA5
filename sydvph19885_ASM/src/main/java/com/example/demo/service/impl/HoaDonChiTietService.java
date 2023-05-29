package com.example.demo.service.impl;

import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDonChiTiet;
import com.example.demo.repository.IHoaDonChiTietRepository;
import com.example.demo.service.IHoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonChiTietService implements IHoaDonChiTietService {
    @Autowired
    private IHoaDonChiTietRepository hoaDonChiTietRepository;

    @Override
    public String addOrUpDate(HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepository.save(hoaDonChiTiet);
        return "THÀNH CÔNG";
    }

    @Override
    public String delete(HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepository.delete(hoaDonChiTiet);
        return "THÀNH CÔNG";
    }

    @Override
    public List<HoaDonChiTiet> findAll() {
        return hoaDonChiTietRepository.findAll();
    }

    @Override
    public List<HoaDonChiTiet> findHoaDonChiTietByChiTietSP(ChiTietSP chiTietSP) {
        return hoaDonChiTietRepository.findHoaDonChiTietByChiTietSP(chiTietSP);
    }
}
