package com.sombra.inc.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sombra.inc.service.IAccountService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RestHomeController {

	@Autowired
	private IAccountService accountService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home() {
		return "restLayout";
	}

	@RequestMapping(value = { "/rest" }, method = RequestMethod.GET)
	public String rest() {
		return "restLayout";
	}

}
