/**
 * 
 */
package com.karvy.handloom.signup.service;

import java.math.BigInteger;
import java.rmi.RemoteException;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.karvy.handloom.admin.bean.UserBean;
import com.karvy.handloom.common.bean.RegistrationBean;

/**
 * @author sateesh.jangam
 *
 */
@Service
@Transactional
public interface SignUPService {

	 Integer saveRegistrationForm(RegistrationBean registrationBean,HttpServletRequest request) throws RemoteException;

	 UserBean getUserDetails(String uname, String role);

	String checkOTP(String mobile, String otp);

	Integer saveresentOTP(String mobile, String otp);

	BigInteger generateOtpNumber(Integer initialnumber, Integer numberofdigits);

	
	
}
