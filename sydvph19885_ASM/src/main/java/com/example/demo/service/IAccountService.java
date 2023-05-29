package com.example.demo.service;

import com.example.demo.entity.Account;

public interface IAccountService {

    Account getOneByEmaiAndPass(String email, String matKhau);

    String saveOrUpdate(Account account);

    Account findAccountByEmail(String email);
}
