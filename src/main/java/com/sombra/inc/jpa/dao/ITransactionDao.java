package com.sombra.inc.jpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sombra.inc.entity.Transaction;

@Repository
public interface ITransactionDao extends JpaRepository<Transaction, Integer> {

	@Query(name = "query", value = "select c from Transaction c where c.account.id = ?1")
	List<Transaction> findByAccountId(Integer accountId);

}
