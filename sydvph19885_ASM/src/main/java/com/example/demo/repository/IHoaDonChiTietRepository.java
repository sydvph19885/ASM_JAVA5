package com.example.demo.repository;

import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDon;
import com.example.demo.entity.HoaDonChiTiet;
import com.example.demo.viewModel.HoaDonChiTietViewModel;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {
    List<HoaDonChiTiet> findHoaDonChiTietByHoaDon(HoaDon hoaDon);

    List<HoaDonChiTiet> findHoaDonChiTietByChiTietSP(ChiTietSP chiTietSP);

    @Query("""
                   SELECT new com.example.demo.viewModel.HoaDonChiTietViewModel(hd.chiTietSP , SUM(hd.soLuong)) 
                   FROM HoaDonChiTiet hd
                   GROUP BY hd.chiTietSP
                   ORDER BY SUM(hd.soLuong)  DESC
            """)
    List<HoaDonChiTietViewModel> top10BanChay(Pageable pageable);

}
