/**
 * 
 */
package com.karvy.handloom.signup.dao;

import java.math.BigInteger;

import org.springframework.stereotype.Repository;

import com.karvy.handloom.admin.bean.UserBean;
import com.karvy.handloom.entity.OTPDetails;
import com.karvy.handloom.entity.SignUp;

/**
 * @author sateesh.jangam
 *
 */

@Repository
public interface SignUPDAO {

    Integer	saveRegistrationForm(SignUp signUp);

    boolean geExistingtOTP(BigInteger generatedOTP);
	
	UserBean getUserDetails(String uname, String role);
	
	String checkOTP(String mobile, String otp);
	
	Integer saveresentOTP(String mobile, String otp);
	
	
}