package com.example.demo.repository;

import com.example.demo.entity.ChiTietSP;
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
    List<ChiTietSP> findAllBySanPham_TenContains(String ten);

    List<ChiTietSP> findByOrderByGiaBanAsc();

    List<ChiTietSP> findByOrderByGiaBanDesc();

    List<ChiTietSP> findByGiaBanBetween(int giaMin, int giaMax);



}
