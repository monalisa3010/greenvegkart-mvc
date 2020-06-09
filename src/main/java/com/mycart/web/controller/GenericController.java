package com.mycart.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GenericController {

	@RequestMapping(value = "/unauth", method = RequestMethod.GET)
	public ModelAndView unauth() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("unauth");
		return andView;
	}

}
