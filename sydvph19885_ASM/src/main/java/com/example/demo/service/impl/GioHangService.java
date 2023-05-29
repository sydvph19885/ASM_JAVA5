package com.example.demo.service.impl;

import com.example.demo.entity.Account;
import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.GioHang;
import com.example.demo.repository.IGioHangRepository;
import com.example.demo.service.IChiTietSanPhamService;
import com.example.demo.service.IGioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("GioHangService")
public class GioHangService implements IGioHangService {

    @Autowired
    private IGioHangRepository gioHangRepository;

    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;


    public Map<String, Integer> sanPhamTrongGioHang = new HashMap<String, Integer>();

    @Override
    public Map<String, Integer> getAllGioHang() {
        return sanPhamTrongGioHang;
    }

    @Override
    public void addGioHangUser(String idSP, Integer soLuongChoVao) {
        ChiTietSP chiTietSP = chiTietSanPhamService.findAllById(idSP);
        if(sanPhamTrongGioHang.containsKey(chiTietSP.getId())){
            int soLuongHienCo = sanPhamTrongGioHang.get(idSP);
            int soLuongMoi = soLuongHienCo + soLuongChoVao;
            sanPhamTrongGioHang.put(chiTietSP.getId(),soLuongMoi);
        }else {
            sanPhamTrongGioHang.put(chiTietSP.getId(), soLuongChoVao);
        }

    }

    @Override
    public GioHang findGioHangByAccount(Account account) {
        return gioHangRepository.findGioHangByAccount(account);
    }

    @Override
    public String addOrUpdateGioHangClient(GioHang gioHang) {
        gioHangRepository.save(gioHang);
        return "THANH CONG";
    }
}
