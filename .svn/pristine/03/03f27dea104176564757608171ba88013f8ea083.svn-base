package com.sombra.inc.dto.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sombra.inc.dto.DetailDto;
import com.sombra.inc.entity.Account;
import com.sombra.inc.entity.User;
import com.sombra.inc.service.IAccountService;

@Service
public class DetailDtoService implements IDetailDtoService {
	@Autowired
	private IAccountService accountServise;

	@Override
	public DetailDto createdto(Integer accountId) {
		DetailDto detailDto = new DetailDto();
		List<String> currencyList = new ArrayList<>();
		currencyList.add("USD");
		currencyList.add("UAH");
		currencyList.add("EUR");
		currencyList.add("PLZ");
		currencyList.add("AUD");
		currencyList.add("BYR");
		currencyList.add("CZK");
		currencyList.add("CNY");
		detailDto.setCurrencyList(currencyList);
		detailDto.setNewAccount(new Account());
		detailDto.setUser(new User());
		detailDto.setListAccount(accountServise.findAll());
		detailDto.setAccount(accountServise.findAccountById(accountId));
		return detailDto;
	}
}
