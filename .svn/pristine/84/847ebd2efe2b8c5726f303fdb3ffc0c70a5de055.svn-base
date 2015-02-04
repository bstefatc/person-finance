package com.sombra.inc.dto.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sombra.inc.dto.TransactionDto;
import com.sombra.inc.service.IAccountService;
import com.sombra.inc.service.ITransactionService;

@Service
public class TransactionDtoService implements ITransactionDtoService {

	@Autowired
	private IAccountService accountServise;
	@Autowired
	private ITransactionService transactionService;

	@Override
	public TransactionDto createdto(Integer accountId) {
		TransactionDto transactionDto = new TransactionDto();
		List<String> currencyList = new ArrayList<>();
		currencyList.add("USD");
		currencyList.add("UAH");
		currencyList.add("EUR");
		currencyList.add("PLZ");
		currencyList.add("AUD");
		currencyList.add("BYR");
		currencyList.add("CZK");
		currencyList.add("CNY");
		transactionDto.setCurrencyList(currencyList);
		transactionDto.setListAccount(accountServise.findAll());
		transactionDto.setAccount(accountServise.findAccountById(accountId));
		transactionDto.setTransactionForAccount(transactionService.findByAccountId(accountId));
		return transactionDto;
	}

	@Override
	public TransactionDto createEmptyDto() {
		// TODO Auto-generated method stub
		TransactionDto transactionDto = new TransactionDto();
		List<String> currencyList = new ArrayList<>();
		currencyList.add("USD");
		currencyList.add("UAH");
		currencyList.add("EUR");
		currencyList.add("PLZ");
		currencyList.add("AUD");
		currencyList.add("BYR");
		currencyList.add("CZK");
		currencyList.add("CNY");
		transactionDto.setCurrencyList(currencyList);
		transactionDto.setListAccount(accountServise.findAll());
		return transactionDto;
	}
}
