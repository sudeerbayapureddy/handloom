/**
 * 
 */
package com.karvy.handloom.signup.service.impl;

import java.math.BigInteger;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.karvy.handloom.admin.bean.UserBean;
import com.karvy.handloom.common.bean.RegistrationBean;
import com.karvy.handloom.common.util.MailAndMessangeSendingUtil;
import com.karvy.handloom.constants.Constant_Variables;
import com.karvy.handloom.entity.OTPDetails;
import com.karvy.handloom.entity.Roles;
import com.karvy.handloom.entity.SignUp;
import com.karvy.handloom.entity.User;
import com.karvy.handloom.signup.dao.SignUPDAO;
import com.karvy.handloom.signup.service.SignUPService;

/**
 * @author sateesh.jangam
 *
 */
@Service
@Transactional
public class SignUPServiceImpl implements SignUPService{

	private static final Logger logger = LoggerFactory.getLogger(SignUPServiceImpl.class);

	
	@Autowired
	SignUPDAO signUPDao;
	
	
	@Override
	public Integer saveRegistrationForm(RegistrationBean registrationBean,HttpServletRequest request) throws RemoteException {
		MailAndMessangeSendingUtil mailAndMessangeSendingUtil=new MailAndMessangeSendingUtil();
		Integer  generatedOTP =0;
		SignUp signUp = new SignUp(); 
		Roles role=new Roles();
		User user = new User();
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		role.setRoleId(Integer.valueOf(registrationBean.getRollId()));
		signUp.setSignUpName(registrationBean.getName());
		signUp.setSignUpEmail(registrationBean.getEmail());
		signUp.setSignUpAadhar(new BigInteger(registrationBean.getAadharNumber()));
		signUp.setSignUpMobile(new BigInteger(registrationBean.getMobile()));
		user.setUserName(registrationBean.getEmail());
		user.setUserPassword(bCryptPasswordEncoder.encode(registrationBean.getPassword()));
		user.setRoles(role);
		user.setActive((byte) 0);
		user.setDeleted((byte) 0);
		user.setSignUp(signUp);
		user.setCreated_By(signUp.getSignUpEmail());
		user.setCreated_Date(new Date());
		signUp.setUsers(user);
		signUp.setCreated_By(signUp.getSignUpEmail());                                                                                        
		signUp.setCreated_Date(new Date());
		BigInteger generateOtpNumber =generateOtpNumber(128567, 6);
			 OTPDetails otpDetails=new OTPDetails();
			 otpDetails.setOtpCode(generateOtpNumber);
			 otpDetails.setOtpUpdatedDate(new Date());
			 signUp.setOtpDetails(otpDetails); 	
	  //  String mailSender = mailAndMessangeSendingUtil.mailSender(registrationBean.getName(), signUp.getOtpDetails().getOtpCode().toString(),request.getRequestURL()+Constant_Variables.OTP_URL.toString() , "ravi.banala@karvy.com", registrationBean.getEmail(), "Handloom OTP");
		Boolean messageSender = mailAndMessangeSendingUtil.MessageSender(registrationBean.getName(), signUp.getOtpDetails().getOtpCode().toString(), request.getRequestURL()+Constant_Variables.OTP_URL.toString(), registrationBean.getMobile());
		logger.info(""+messageSender);
		return signUPDao.saveRegistrationForm(signUp);
	}


	@Override
	public UserBean getUserDetails(String uname,String role) {  
			return signUPDao.getUserDetails(uname,role);
	}
	
	@Override
	public String checkOTP(String mobile,String otp) {  
		return signUPDao.checkOTP(mobile, otp);
	}
	
	@Override
	public Integer saveresentOTP(String mobile,String otp){
	return signUPDao.saveresentOTP(mobile, otp);	
	}
	
	@Override
	public BigInteger generateOtpNumber(Integer initialnumber,Integer numberofdigits)	
	{
		BigInteger generateNumber=null;
		 Random random = new Random();
		 Integer generatedOTP =(Integer) random.nextInt(numberofdigits)+initialnumber;
			logger.info("OTP {}",String.valueOf(generatedOTP));
			boolean geExistingtOTP=  signUPDao.geExistingtOTP(new BigInteger(generatedOTP.toString()));
				while(geExistingtOTP){
					 generatedOTP=random.nextInt(6)+generatedOTP;	
					 geExistingtOTP =  signUPDao.geExistingtOTP(new BigInteger(generatedOTP.toString()));
			}
			 			 
			 if(!geExistingtOTP)
					 generateNumber=new BigInteger(String.valueOf(generatedOTP));
		return generateNumber;
	}

}
