package com.example.demo.service;

import com.example.demo.entity.MauSac;

import java.util.List;

public interface IMauSacService {
    List<MauSac> getAll();

    String addOrUpdate(MauSac mauSac);

    String delete(MauSac mauSac);

    MauSac getOne(String id);
}
