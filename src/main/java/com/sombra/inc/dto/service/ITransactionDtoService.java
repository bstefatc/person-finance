package com.sombra.inc.dto.service;

import com.sombra.inc.dto.TransactionDto;

public interface ITransactionDtoService {

	TransactionDto createdto(Integer accountId);

	TransactionDto createEmptyDto();

}
