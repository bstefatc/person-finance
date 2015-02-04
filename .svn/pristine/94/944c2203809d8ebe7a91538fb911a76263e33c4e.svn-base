package com.sombra.inc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sombra.inc.entity.Transaction;
import com.sombra.inc.jpa.dao.IAccountDao;
import com.sombra.inc.jpa.dao.ITransactionDao;

@Service
public class TransactionService implements ITransactionService {

	@Autowired
	private ITransactionDao transactionDao;
	@Autowired
	private IAccountDao accountDao;

	@Override
	public List<Transaction> findByAccountId(Integer accountId) {
		// TODO Auto-generated method stub
		return transactionDao.findByAccountId(accountId);
	}

	@Override
	public void save(Transaction transaction, Integer accountId) {
		transaction.setAccount(accountDao.findOne(accountId));
		transactionDao.save(transaction);
	}

	@Override
	public void save(Transaction transaction) {
		transactionDao.save(transaction);
	}

	@Override
	public void delete(Integer transactionId) {
		transactionDao.delete(transactionId);

	}

}
