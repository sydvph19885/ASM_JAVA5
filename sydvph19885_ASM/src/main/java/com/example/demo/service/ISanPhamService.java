package com.example.demo.service;

import com.example.demo.entity.SanPham;

import java.util.List;

public interface ISanPhamService {
    String add(SanPham sanPham);

    String delete(SanPham sanPham);

    List<SanPham> getAll();

    SanPham getOne(String id);

    SanPham findSanPhamByTen(String ten);
}
