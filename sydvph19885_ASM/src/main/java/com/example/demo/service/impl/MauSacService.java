package com.example.demo.service.impl;

import com.example.demo.entity.MauSac;
import com.example.demo.repository.IMauSacRepository;
import com.example.demo.service.IMauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("MauSacService")
public class MauSacService implements IMauSacService {

    @Autowired
    private IMauSacRepository mauSacRepository;

    public MauSacService(IMauSacRepository mauSacRepository) {
        this.mauSacRepository = mauSacRepository;
    }

    @Override
    public List<MauSac> getAll() {
        return mauSacRepository.findAll();
    }

    @Override
    public String addOrUpdate(MauSac mauSac) {
        mauSacRepository.save(mauSac);
        return "THANH CONG";
    }

    @Override
    public String delete(MauSac mauSac) {
        mauSacRepository.delete(mauSac);
        return null;
    }

    @Override
    public MauSac getOne(String id) {
        return mauSacRepository.getById(id);
    }
}
