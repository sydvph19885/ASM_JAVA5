package com.example.demo.service.impl;

import com.example.demo.entity.Account;
import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.GioHang;
import com.example.demo.entity.GioHangChiTiet;
import com.example.demo.repository.IGioHangChiTietRepository;
import com.example.demo.repository.IGioHangRepository;
import com.example.demo.service.IGioHangChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GioHangChiTietService implements IGioHangChiTietService {

    @Autowired
    private IGioHangChiTietRepository gioHangChiTietRepository;

    public GioHangChiTietService(IGioHangChiTietRepository gioHangChiTietRepository) {
        this.gioHangChiTietRepository = gioHangChiTietRepository;
    }

    @Override
    public String addOrUpdate(GioHangChiTiet gioHangChiTiet) {
        gioHangChiTietRepository.save(gioHangChiTiet);
        return "THANH CONG";
    }

    @Override
    public List<GioHangChiTiet> getAll() {
        return gioHangChiTietRepository.findAll();
    }

    @Override
    public GioHangChiTiet findGioHangChiTietByChiTietSPAndAndGioHang(ChiTietSP chiTietSP, GioHang gioHang) {
        return gioHangChiTietRepository.findGioHangChiTietByChiTietSPAndAndGioHang(chiTietSP, gioHang);
    }

    @Override
    public List<GioHangChiTiet> findGioHangChiTietByGioHang(GioHang gioHang) {
        return gioHangChiTietRepository.findGioHangChiTietByGioHang(gioHang);
    }

    @Override
    public GioHangChiTiet findGioHangChiTietById(String id) {
        return gioHangChiTietRepository.findGioHangChiTietById(id);
    }

    @Override
    public String delete(GioHangChiTiet gioHangChiTiet) {
        gioHangChiTietRepository.delete(gioHangChiTiet);
        return "THANH CONG";
    }

    @Override
    public List<GioHangChiTiet> findGioHangChiTietByChiTietSP(ChiTietSP chiTietSP) {
        return gioHangChiTietRepository.findGioHangChiTietByChiTietSP(chiTietSP);
    }

}
