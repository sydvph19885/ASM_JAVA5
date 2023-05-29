package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.entity.ChiTietSP;
import com.example.demo.entity.GioHang;

import java.util.Map;

public interface IGioHangService {

    Map<String, Integer> getAllGioHang();

    void addGioHangUser(String idSP, Integer soLuongChoVao);

    GioHang findGioHangByAccount(Account account);

    String addOrUpdateGioHangClient(GioHang gioHang);

}
