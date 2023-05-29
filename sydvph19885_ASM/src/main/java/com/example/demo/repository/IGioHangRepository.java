package com.example.demo.repository;

import com.example.demo.entity.Account;
import com.example.demo.entity.GioHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IGioHangRepository extends JpaRepository<GioHang, String> {

    GioHang findGioHangByAccount(Account account);
}
