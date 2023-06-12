package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.entity.HoaDon;

import java.util.List;

public interface IHoaDonService {
    String addOrUpdate(HoaDon hoaDon);

    List<HoaDon> findByAccount(Account account);

}
