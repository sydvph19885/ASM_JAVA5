package com.example.demo.repository;

import com.example.demo.entity.ChiTietSP;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IChiTietSanPhamRepository extends JpaRepository<ChiTietSP, String> {
    ChiTietSP findAllById(String id);

    //    @Query(value = "SELECT * FROM ChiTietSP ct WHERE ct.sanPham.ten like %?1%", nativeQuery = true)
    Page<ChiTietSP> findAllBySanPham_TenContains(String ten, Pageable pageable);

    List<ChiTietSP> findByOrderByGiaBanAsc();

    List<ChiTietSP> findByOrderByGiaBanDesc();

    Page<ChiTietSP> findByGiaBanBetween(int giaMin, int giaMax, Pageable pageable);

    @Query(value = """
                       SELECT TOP 10 * FROM chi_tietsp ctsp WHERE ctsp.so_luong_ton > 0 
                       ORDER BY ctsp.ngay_nhap ASC 
            """,nativeQuery = true)
    List<ChiTietSP> topSanPhamTonHangLauNhat();


}
