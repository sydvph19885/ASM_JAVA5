package com.example.demo.repository;

import com.example.demo.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IAccountRepository extends JpaRepository<Account, String> {
    Account findAccountByEmailAndMatKhau(String email, String matKhau);

    Account findAccountByEmail(String email);
}
