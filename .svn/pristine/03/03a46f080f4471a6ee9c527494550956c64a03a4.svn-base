package com.sombra.inc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sombra.inc.dto.service.IDetailDtoService;
import com.sombra.inc.entity.Account;
import com.sombra.inc.entity.User;
import com.sombra.inc.service.IAccountService;
import com.sombra.inc.service.ICommentService;

@Controller
public class SummaryController {
	@Autowired
	private IAccountService accountServise;

	@Autowired
	private ICommentService commentServise;

	@Autowired
	private IDetailDtoService detailDtoService;

	@RequestMapping(value = { "/account/summary/id={accountId}" }, method = RequestMethod.GET)
	public String accountDetail(Model model, @PathVariable Integer accountId) {
		model.addAttribute("user", new User());
		model.addAttribute("newAccount", new Account());
		model.addAttribute("oneAccount", accountServise.findAccountById(accountId));
		model.addAttribute("dto", detailDtoService.createdto(accountId));
		return "summary";
	}
}
