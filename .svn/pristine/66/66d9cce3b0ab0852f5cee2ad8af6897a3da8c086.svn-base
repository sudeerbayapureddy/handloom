/**
 * 
 */
package com.karvy.handloom.signup.controller;

import java.math.BigInteger;
import java.rmi.RemoteException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.karvy.handloom.common.bean.RegistrationBean;
import com.karvy.handloom.common.util.MailAndMessangeSendingUtil;
import com.karvy.handloom.constants.Constant_Variables;
import com.karvy.handloom.constants.Constants_URLPath;
import com.karvy.handloom.signup.service.SignUPService;

/**
 * @author sateesh.jangam
 *
 */
@Controller
public class SignUPController {

	private static final Logger logger = LoggerFactory.getLogger(SignUPController.class);

	@Autowired
	SignUPService signUPService;

	@Autowired
	private MailAndMessangeSendingUtil mailAndMessangeSendingUtil;

	@RequestMapping(value =Constants_URLPath.SAVEREGISTRATIONFORM, method = RequestMethod.POST)
	@ResponseBody
	RegistrationBean saveRegistrationForm(HttpServletRequest request, @RequestBody RegistrationBean registrationBean)
			throws RemoteException {

		logger.info(registrationBean.getName());
		registrationBean.setRollId(String.valueOf(6));
		RegistrationBean registrationBeanResponse = new RegistrationBean();

		logger.info("SignUPController saveRegistrationForm {}", registrationBean.getPassword());
		logger.info("SignUPController saveRegistrationForm {}", registrationBean.getAadharNumber());

		Integer saveRegistrationForm;
		saveRegistrationForm = signUPService.saveRegistrationForm(registrationBean, request);
		if (saveRegistrationForm != null && saveRegistrationForm != 0) {
			registrationBeanResponse.setMobile(registrationBean.getMobile());
			registrationBeanResponse.setOtp(Constant_Variables.SUCCESS);

		} else {
			registrationBeanResponse.setMobile(registrationBean.getMobile());
			registrationBeanResponse.setOtp(Constant_Variables.FAIL);
		}

		return registrationBeanResponse;
	}

	@RequestMapping(value =Constants_URLPath.CHECKOTP, method = RequestMethod.POST)
	@ResponseBody
	String checkOTP(HttpServletRequest request, @RequestBody RegistrationBean registrationBean) {

		logger.info("mobile number {} ", registrationBean.getMobile());
		logger.info("otp {} ", registrationBean.getOtp());
		return signUPService.checkOTP(registrationBean.getMobile(), registrationBean.getOtp());
	}

	@RequestMapping(value =Constants_URLPath.RESENDOTP, method = RequestMethod.POST)
	@ResponseBody
	String resendOTP(HttpServletRequest request, @RequestBody RegistrationBean registrationBean) {
		logger.info("resendOTP {} ");
		String result = "fail";
		BigInteger generateOtpNumber = signUPService.generateOtpNumber(135981, 6);
		Integer saveresentOTP = signUPService.saveresentOTP(registrationBean.getMobile(), generateOtpNumber.toString());
		if (saveresentOTP > 0) {
			Boolean messageSender;
			try {
				messageSender = mailAndMessangeSendingUtil.MessageSender(" ", generateOtpNumber.toString(), "  ",
						registrationBean.getMobile());
				if (messageSender.equals(true)) {
					result =Constant_Variables.SUCCESS;
				} else {
					result = Constant_Variables.FAIL;
				}
			} catch (RemoteException e) {
				logger.info("message sending server Error {} ", e);
			}

		}
		return result;
	}

}
