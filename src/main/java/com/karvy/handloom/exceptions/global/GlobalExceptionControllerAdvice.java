package com.karvy.handloom.exceptions.global;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.karvy.handloom.tiles.constants.Constant_Tiles_View;

// TODO: Auto-generated Javadoc
/**
 * The Class GlobalExceptionControllerAdvice.
 *
 * @author sudeer.bayapureddy
 */

@ControllerAdvice
public class GlobalExceptionControllerAdvice {

	// ** The Constant logger. *//*
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionControllerAdvice.class);

	/**
	 * @param ex
	 * @param request
	 * @return ModelAndView
	 */
	@ExceptionHandler(Exception.class)
	public ModelAndView exception(Exception exception, HttpServletRequest request) {

		logger.info(
				"GlobalExceptionControllerAdvice exception " + request.getRequestURL() + " " + exception.getMessage());
		ModelAndView modelAndView = new ModelAndView(Constant_Tiles_View.GLOBAL_EXCEPTION);

		StringWriter stack = new StringWriter();
		exception.printStackTrace(new PrintWriter(stack));
		logger.info("Caught exception; decorating with appropriate status template : " + stack.toString());

		modelAndView.addObject("exception", stack.toString());
		modelAndView.addObject("url", request.getRequestURL());

		return modelAndView;
	}
	
}
