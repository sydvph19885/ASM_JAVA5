package com.example.demo.service.impl;

import com.example.demo.entity.ChiTietSP;
import com.example.demo.repository.IChiTietSanPhamRepository;
import com.example.demo.service.IChiTietSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("ChiTietSanPhamService")
public class ChiTietSanPhamService implements IChiTietSanPhamService {

    @Autowired
    private IChiTietSanPhamRepository chiTietSanPhamRepository;

    public ChiTietSanPhamService(IChiTietSanPhamRepository chiTietSanPhamRepository) {
        this.chiTietSanPhamRepository = chiTietSanPhamRepository;
    }

    @Override
    public List<ChiTietSP> findAll() {
        List<ChiTietSP> tietSPS = chiTietSanPhamRepository.findAll();
        return tietSPS;
    }

    @Override
    public ChiTietSP add(ChiTietSP chiTietSP) {

        return chiTietSanPhamRepository.save(chiTietSP);
    }

    @Override
    public ChiTietSP findAllById(String id) {
        return chiTietSanPhamRepository.findAllById(id);
    }

    @Override
    @Transactional
    public String delete(ChiTietSP chiTietSP) {
        chiTietSanPhamRepository.delete(chiTietSP);
        return "THANH CONG";
    }

    @Override
    public List<ChiTietSP> findAllBySanPham_Ten(String ten) {
        return chiTietSanPhamRepository.findAllBySanPham_TenContains(ten);
    }

    @Override
    public List<ChiTietSP> findByOrderByGiaBanAsc() {
        return chiTietSanPhamRepository.findByOrderByGiaBanAsc();
    }

    @Override
    public List<ChiTietSP> findByOrderByGiaBanDesc() {
        return chiTietSanPhamRepository.findByOrderByGiaBanDesc();
    }

    @Override
    public List<ChiTietSP> findByGiaBanBetween(int giaMin, int giaMax) {
        return chiTietSanPhamRepository.findByGiaBanBetween(giaMin, giaMax);
    }

    @Override
    public Page<ChiTietSP> phanTrangChiTietSP(Pageable pageable) {
        return chiTietSanPhamRepository.findAll(pageable);
    }


}
