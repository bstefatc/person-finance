package com.sombra.inc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sombra.inc.service.IAccountService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private IAccountService accountService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	// public String home(Model model) {
	// model.addAttribute("user", new User());
	// return "home";
	// }

}
