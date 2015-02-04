package com.sombra.inc.rest;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sombra.inc.entity.Account;
import com.sombra.inc.entity.Comment;
import com.sombra.inc.entity.Transaction;
import com.sombra.inc.service.IAccountService;
import com.sombra.inc.service.ICommentService;
import com.sombra.inc.service.ITransactionService;

@RestController
@RequestMapping("rest/account")
public class RestAccountController {

	@Autowired
	private IAccountService accountService;

	@Autowired
	private ICommentService commentService;

	@Autowired
	private ITransactionService transactionService;

	@RequestMapping(value = "")
	public List<Account> allAccounts() {
		return accountService.findAll();
	}

	@RequestMapping(value = "byId")
	public Account oneAccount(@RequestParam(value = "accountId") String accountId) {
		return accountService.findAccountById(Integer.parseInt(accountId));
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String createAccount(@ModelAttribute Account account) {
		accountService.save(account);
		return account.toString();
	}

	@RequestMapping(value = "comment", method = RequestMethod.GET)
	public List<Comment> getComments(@RequestParam(value = "id") String id) {
		return commentService.findByAccountId(Integer.parseInt(id));
	}

	@RequestMapping(value = "transactions", method = RequestMethod.GET)
	public List<Transaction> getTransactions(@RequestParam(value = "id") String id) {
		return transactionService.findByAccountId(Integer.parseInt(id));
	}

	@RequestMapping(value = "create_transaction/{id}", method = RequestMethod.POST)
	public String createTransaction(@PathVariable Integer id, @ModelAttribute Transaction transaction) {
		transactionService.save(transaction, id);
		return transaction.toString();
	}

	@RequestMapping(value = "delete_transaction", method = RequestMethod.GET)
	public String deleteTransactions(@RequestParam(value = "id") Integer id) {
		transactionService.delete(id);
		return "success";
	}

	@RequestMapping(value = "createcomment", method = RequestMethod.POST)
	public String createComment(MultipartHttpServletRequest request) {
		Comment com = new Comment();
		com.setUserName(request.getParameter("name"));
		com.setCommentText(request.getParameter("commentText"));
		System.out.println(request.getSession().getServletContext().getRealPath(""));
		if (request.getFileNames().hasNext()) {
			Iterator<String> itr = request.getFileNames();
			MultipartFile mpf = request.getFile(itr.next());
			commentService.save(com, Integer.parseInt(request.getParameter("id")), mpf, request.getSession().getServletContext().getRealPath(""));
		} else {
			commentService.save(com, Integer.parseInt(request.getParameter("id")));
		}
		return "ok";
	}

	@RequestMapping(value = "/downloadfile", method = RequestMethod.GET)
	public void downloadnotepadfile(HttpServletRequest request, HttpServletResponse response, @RequestParam String fileName) {
		try {
			File f = new File(request.getSession().getServletContext().getRealPath("") + fileName);
			// response.setContentType("application/txt");
			FileCopyUtils.copy(new FileInputStream(f), response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
