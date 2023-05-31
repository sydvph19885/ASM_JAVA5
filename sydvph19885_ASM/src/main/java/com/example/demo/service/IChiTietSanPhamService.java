package com.example.demo.service;

import com.example.demo.entity.ChiTietSP;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IChiTietSanPhamService {

    List<ChiTietSP> findAll();

    ChiTietSP add(ChiTietSP chiTietSP);

    ChiTietSP findAllById(String id);

    String delete(ChiTietSP chiTietSP);

    Page<ChiTietSP> findAllBySanPham_Ten(String ten,Pageable pageable);

    List<ChiTietSP> findByOrderByGiaBanAsc();

    List<ChiTietSP> findByOrderByGiaBanDesc();

    Page<ChiTietSP> findByGiaBanBetween(int giaMin, int giaMax,Pageable pageable);

    Page<ChiTietSP> phanTrangChiTietSP(Pageable pageable);

}
