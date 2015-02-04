package com.sombra.inc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sombra.inc.entity.Account;
import com.sombra.inc.service.IAccountService;
import com.sombra.inc.service.ICommentService;

@Controller
public class AccountController {

	@Autowired
	private IAccountService accountServise;

	@Autowired
	private ICommentService commentServise;

	@RequestMapping(value = { "/createAccount" }, method = RequestMethod.POST)
	public String addAccount(@ModelAttribute("newAccount") Account account) {
		accountServise.save(account);
		return "redirect:/account/detail/id=" + account.getId();
	}

	@RequestMapping(value = { "/updateAccount" }, method = RequestMethod.POST)
	public String updateAccount(@ModelAttribute("updateAccount") Account account) {
		accountServise.save(account);
		return "redirect:/account/detail/id=" + account.getId();
	}
}
