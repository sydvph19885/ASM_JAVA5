package com.example.demo.service;

import com.example.demo.entity.NhaSanXuat;

import java.util.List;

public interface INhaSanXuatService {
    List<NhaSanXuat> getAll();

    String add(NhaSanXuat nhaSanXuat);

    String delete(NhaSanXuat nhaSanXuat);

    NhaSanXuat getOne(String id);

}
