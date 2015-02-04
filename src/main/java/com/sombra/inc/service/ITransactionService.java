package com.sombra.inc.service;

import java.util.List;

import com.sombra.inc.entity.Transaction;

public interface ITransactionService {
	public List<Transaction> findByAccountId(Integer accountId);

	public void save(Transaction transaction, Integer accountId);

	public void delete(Integer transactionId);

	void save(Transaction transaction);
}
