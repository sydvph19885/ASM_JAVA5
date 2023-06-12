package com.example.demo.repository;

import com.example.demo.entity.Account;
import com.example.demo.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonRepository extends JpaRepository<HoaDon, String> {

    List<HoaDon> findByAccount(Account account);

}
