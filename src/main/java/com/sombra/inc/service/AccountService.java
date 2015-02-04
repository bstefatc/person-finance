package com.sombra.inc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sombra.inc.entity.Account;
import com.sombra.inc.jpa.dao.IAccountDao;

@Service
public class AccountService implements IAccountService {

	@Autowired
	private IAccountDao accountDao;

	@Override
	public List<Account> findAll() {
		return accountDao.findAll();
	}

	@Override
	public Account findAccountById(Integer id) {
		return accountDao.findOne(id);
	}

	@Override
	public void save(Account account) {
		accountDao.save(account);
	}

	@Override
	public void update(Account account) {

	}
}
