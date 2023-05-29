package com.example.demo.service;

import com.example.demo.entity.DongSP;

import java.util.List;

public interface IDongSanPhamService {

    List<DongSP> getAll();

    String add(DongSP dongSP);

    String delete(DongSP dongSP);

    DongSP getOne(String id);
}
