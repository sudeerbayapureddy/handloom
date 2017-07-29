/**
 * 
 */
package com.karvy.handloom.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.karvy.handloom.constants.Constants_URLPath;
import com.karvy.handloom.tiles.constants.Constant_Tiles_View;

/**
 * @author ravi.banala
 *
 */
@Controller
public class OTPVerificationController {
	private static final Logger logger = LoggerFactory.getLogger(OTPVerificationController.class);

	@RequestMapping(value = Constants_URLPath.OTP_VERIFICATION_FORM, method = RequestMethod.GET)
	ModelAndView otpVerificationForm(HttpServletRequest request) {
		return new ModelAndView(Constant_Tiles_View.OTP_VERIFICATION_PAGE);
	}

}
