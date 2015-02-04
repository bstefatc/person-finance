package com.sombra.inc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sombra.inc.dto.service.ITransactionDtoService;
import com.sombra.inc.entity.Account;
import com.sombra.inc.entity.Transaction;
import com.sombra.inc.entity.User;
import com.sombra.inc.service.IAccountService;
import com.sombra.inc.service.ITransactionService;

@Controller
public class TransactionController {
	@Autowired
	private IAccountService accountServise;

	@Autowired
	private ITransactionDtoService transactionDtoServise;
	@Autowired
	private ITransactionService transactionService;

	@RequestMapping(value = "/account/transaction", method = RequestMethod.GET)
	public String account(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("newAccount", new Account());
		model.addAttribute("newTransaction", new Transaction());

		model.addAttribute("dto", transactionDtoServise.createEmptyDto());
		return "transaction";
	}

	@RequestMapping(value = "/account/transaction/id={accountId}", method = RequestMethod.GET)
	public String oneAccount(Model model, @PathVariable Integer accountId) {
		model.addAttribute("user", new User());
		model.addAttribute("newAccount", new Account());
		model.addAttribute("newTransaction", new Transaction());
		model.addAttribute("dto", transactionDtoServise.createdto(accountId));
		return "transaction";
	}

	@RequestMapping(value = "/createTransaction/{itemId}", method = RequestMethod.POST)
	public String addTransaction(@ModelAttribute("newTransaction") Transaction transaction, @PathVariable Integer itemId) {
		transactionService.save(transaction, itemId);
		return "redirect:/account/transaction/id=" + itemId;
	}

	@RequestMapping(value = "/deleteTransaction/{accountId}/{transactionId}", method = RequestMethod.GET)
	public String seleteTr(@PathVariable Integer accountId, @PathVariable Integer transactionId) {
		transactionService.delete(transactionId);
		return "redirect:/account/transaction/id=" + accountId;
	}
}
