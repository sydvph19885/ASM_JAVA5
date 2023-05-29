package com.example.demo.service.impl;

import com.example.demo.entity.DongSP;
import com.example.demo.repository.IDongSanPhamRepository;
import com.example.demo.service.IDongSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("DongSanPhamService")
public class DongSanPhamService implements IDongSanPhamService {

    @Autowired
    private IDongSanPhamRepository dongSanPhamRepository;

    public DongSanPhamService(IDongSanPhamRepository dongSanPhamRepository) {
        this.dongSanPhamRepository = dongSanPhamRepository;
    }

    @Override
    public List<DongSP> getAll() {
        return dongSanPhamRepository.findAll();
    }

    @Override
    public String add(DongSP dongSP) {
        dongSanPhamRepository.save(dongSP);
        return "THANH CONG";
    }

    @Override
    public String delete(DongSP dongSP) {
        dongSanPhamRepository.delete(dongSP);
        return "THANH CONG";
    }

    @Override
    public DongSP getOne(String id) {
        return dongSanPhamRepository.getById(id);
    }
}
