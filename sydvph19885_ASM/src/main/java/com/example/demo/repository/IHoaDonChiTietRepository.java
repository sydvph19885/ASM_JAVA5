package com.example.demo.repository;

import com.example.demo.entity.Account;
import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.HoaDon;
import com.example.demo.entity.HoaDonChiTiet;
import com.example.demo.viewModel.HoaDonChiTietViewModel;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {
    @Query("""
        SELECT new com.example.demo.viewModel.HoaDonChiTietViewModel(hdct.chiTietSP , SUM(hdct.soLuong))
        FROM HoaDonChiTiet hdct
        WHERE hdct.hoaDon IN (
        select hd.id from HoaDon hd
        Where hd.account = :account
        )
        GROUP BY hdct.chiTietSP
""")
    List<HoaDonChiTietViewModel> findHoaDonChiTietByHoaDon(@Param(value = "account")Account account);

    List<HoaDonChiTiet> findHoaDonChiTietByChiTietSP(ChiTietSP chiTietSP);

    @Query("""
                   SELECT new com.example.demo.viewModel.HoaDonChiTietViewModel(hd.chiTietSP , SUM(hd.soLuong)) 
                   FROM HoaDonChiTiet hd
                   GROUP BY hd.chiTietSP
                   ORDER BY SUM(hd.soLuong)  DESC
            """)
    List<HoaDonChiTietViewModel> top10BanChay(Pageable pageable);

}
