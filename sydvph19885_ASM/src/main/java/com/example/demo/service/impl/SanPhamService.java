package com.example.demo.service.impl;

import com.example.demo.entity.SanPham;
import com.example.demo.repository.ISanPhamRepository;
import com.example.demo.service.ISanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("SanPhamService")
public class SanPhamService implements ISanPhamService {

    @Autowired
    private ISanPhamRepository sanPhamRepository;

    public SanPhamService(ISanPhamRepository sanPhamRepository) {
        this.sanPhamRepository = sanPhamRepository;
    }

    @Override
    public String add(SanPham sanPham) {
        sanPhamRepository.save(sanPham);
        return "THANH CONG";
    }

    @Override
    public String delete(SanPham sanPham) {
        sanPhamRepository.delete(sanPham);
        return "THANH CONG";
    }

    @Override
    public List<SanPham> getAll() {
        return sanPhamRepository.findAll();
    }

    @Override
    public SanPham getOne(String id) {

        return sanPhamRepository.getById(id);
    }

    @Override
    public SanPham findSanPhamByTen(String ten) {
        return sanPhamRepository.findSanPhamByTen(ten);
    }
}
