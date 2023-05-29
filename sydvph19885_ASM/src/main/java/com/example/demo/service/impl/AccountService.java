package com.example.demo.service.impl;

import com.example.demo.entity.Account;
import com.example.demo.repository.IAccountRepository;
import com.example.demo.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService implements IAccountService {

    @Autowired
    private IAccountRepository accountRepository;

    public AccountService(IAccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @Override
    public Account getOneByEmaiAndPass(String email, String matKhau) {
        return accountRepository.findAccountByEmailAndMatKhau(email, matKhau);
    }

    @Override
    public String saveOrUpdate(Account account) {
        accountRepository.save(account);
        return "THÀNH CÔNG";
    }

    @Override
    public Account findAccountByEmail(String email) {
        return accountRepository.findAccountByEmail(email);
    }
}
