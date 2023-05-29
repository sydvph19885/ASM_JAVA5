package com.example.demo.repository;

import com.example.demo.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Controller;

@Controller
public interface ISanPhamRepository extends JpaRepository<SanPham,String> {

    SanPham findSanPhamByTen(String ten);
}
