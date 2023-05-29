package com.example.demo.repository;

import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDon;
import com.example.demo.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {
    List<HoaDonChiTiet> findHoaDonChiTietByHoaDon(HoaDon hoaDon);

    List<HoaDonChiTiet> findHoaDonChiTietByChiTietSP(ChiTietSP chiTietSP);

}
