package com.example.demo.service.impl;

import com.example.demo.entity.Account;
import com.example.demo.entity.HoaDon;
import com.example.demo.repository.IHoaDonRepository;
import com.example.demo.service.IHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonService implements IHoaDonService {

    @Autowired
    private IHoaDonRepository hoaDonRepository;

    @Override
    public String addOrUpdate(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
        return "THANH CONG";
    }

    @Override
    public List<HoaDon> findByAccount(Account account) {
        return hoaDonRepository.findByAccount(account);
    }
}
