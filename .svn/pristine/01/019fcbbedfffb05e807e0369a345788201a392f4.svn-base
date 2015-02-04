package com.sombra.inc.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sombra.inc.entity.Account;
import com.sombra.inc.entity.Comment;
import com.sombra.inc.entity.User;
import com.sombra.inc.service.IAccountService;
import com.sombra.inc.service.ICommentService;

@Controller
public class NotesController {

	@Autowired
	private IAccountService accountServise;

	@Autowired
	private ICommentService commentServise;

	@RequestMapping(value = "/account/notes/id={accountId}", method = RequestMethod.GET)
	public String oneAccount(Model model, @PathVariable Integer accountId) {
		List<String> currencyList = new ArrayList<>();
		currencyList.add("USD");
		currencyList.add("UAH");
		model.addAttribute("user", new User());
		model.addAttribute("accounts", accountServise.findAll());
		model.addAttribute("newAccount", new Account());
		model.addAttribute("oneAccount", accountServise.findAccountById(accountId));
		model.addAttribute("commentsForOne", commentServise.findByAccountId(accountId));
		model.addAttribute("commentForm", new Comment());
		model.addAttribute("allCurrency", currencyList);
		return "note";
	}
}
