package com.sombra.inc.dto.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sombra.inc.dto.SummaryDto;
import com.sombra.inc.entity.Account;
import com.sombra.inc.entity.User;
import com.sombra.inc.service.IAccountService;

@Service
public class SummaryDtoService implements ISummaryDtoService {
	@Autowired
	private IAccountService accountServise;

	@Override
	public SummaryDto createdto(Integer accountId) {
		SummaryDto summaryDto = new SummaryDto();
		List<String> currencyList = new ArrayList<>();
		currencyList.add("USD");
		currencyList.add("UAH");
		currencyList.add("EUR");
		currencyList.add("PLZ");
		currencyList.add("AUD");
		currencyList.add("BYR");
		currencyList.add("CZK");
		currencyList.add("CNY");
		summaryDto.setCurrencyList(currencyList);
		summaryDto.setNewAccount(new Account());
		summaryDto.setUser(new User());
		summaryDto.setListAccount(accountServise.findAll());
		summaryDto.setAccount(accountServise.findAccountById(accountId));
		return summaryDto;
	}
}
