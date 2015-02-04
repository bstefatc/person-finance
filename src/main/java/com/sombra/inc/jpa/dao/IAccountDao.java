package com.sombra.inc.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sombra.inc.entity.Account;

@Repository
public interface IAccountDao extends JpaRepository<Account, Integer> {
	// @Query(name = "query", value = "select MIN(id) from Account")
	// public Integer findFirst();
}
