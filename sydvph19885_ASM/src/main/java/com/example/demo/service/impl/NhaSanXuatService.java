package com.example.demo.service.impl;

import com.example.demo.entity.NhaSanXuat;
import com.example.demo.repository.INhaSanXuatRepository;
import com.example.demo.service.INhaSanXuatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("NhaSanXuatService")
public class NhaSanXuatService implements INhaSanXuatService {

    @Autowired
    private INhaSanXuatRepository nhaSanXuatRepository;

    public NhaSanXuatService(INhaSanXuatRepository nhaSanXuatRepository) {
        this.nhaSanXuatRepository = nhaSanXuatRepository;
    }

    @Override
    public List<NhaSanXuat> getAll() {
        return nhaSanXuatRepository.findAll();
    }

    @Override
    public String add(NhaSanXuat nhaSanXuat) {
        nhaSanXuatRepository.save(nhaSanXuat);
        return "THANH CONG";
    }

    @Override
    public String delete(NhaSanXuat nhaSanXuat) {
        nhaSanXuatRepository.delete(nhaSanXuat);
        return null;
    }

    @Override
    public NhaSanXuat getOne(String id) {
        return nhaSanXuatRepository.getById(id);
    }
}
