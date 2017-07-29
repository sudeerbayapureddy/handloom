/**
 * 
 */
package com.karvy.handloom.common.util;

import java.math.BigInteger;
import java.util.Random;

import javax.transaction.Transactional;

import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.karvy.handloom.entity.OTPDetails;

/**
 * @author ravi.banala
 *
 */

@Service
@Repository
@Transactional
public class GenerateOTPRandomUtil {
	private static final Logger logger = LoggerFactory.getLogger(GenerateOTPRandomUtil.class);

	@Autowired
	HibernateUtil hibernateUtil;
	
public BigInteger generateOtpNumber(int initialnumber,int numberofdigits)	
{
	BigInteger generateNumber=null;
	 Random random = new Random();
	 Integer generatedOTP =(Integer) random.nextInt(numberofdigits)+initialnumber;
		logger.info("OTP {}",String.valueOf(generatedOTP));
		Object geExistingtOTP=  hibernateUtil.createEntityCriteria(OTPDetails.class).add(Restrictions.eq("otpCode",new BigInteger(generatedOTP.toString()))).uniqueResult();
		 while(geExistingtOTP  != null){
			 generatedOTP=random.nextInt(6)+generatedOTP;	
			 geExistingtOTP=  hibernateUtil.createEntityCriteria(OTPDetails.class).add(Restrictions.eq("otpCode", new BigInteger(generatedOTP.toString()))).uniqueResult();

		 }if(geExistingtOTP  == null){
				 generateNumber=new BigInteger(String.valueOf(generatedOTP));
		 }
	return generateNumber;
}
	
	

}
