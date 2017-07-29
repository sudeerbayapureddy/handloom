/**
 * 
 */
package com.karvy.handloom.signup.dao.impl;

import java.math.BigInteger;
import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.karvy.handloom.admin.bean.UserBean;
import com.karvy.handloom.common.util.HibernateUtil;
import com.karvy.handloom.constants.Constant_Variables;
import com.karvy.handloom.entity.Employee;
import com.karvy.handloom.entity.OTPDetails;
import com.karvy.handloom.entity.SignUp;
import com.karvy.handloom.signup.dao.SignUPDAO;

/**
 * @author sateesh.jangam
 *
 */
@Repository
public class SignUPDAOImpl implements SignUPDAO {

	private static final Logger logger = LoggerFactory.getLogger(SignUPDAOImpl.class);

	@Autowired
	HibernateUtil hibernateUtil;

	@Override
	public Integer saveRegistrationForm(SignUp signUp) {
		return (Integer) hibernateUtil.create(signUp);
	}

	@Override
	public boolean geExistingtOTP(BigInteger generatedOTP) {
		logger.info("geExistingtOTP {} ", generatedOTP);
		boolean result;
		Criteria criteria = hibernateUtil.createEntityCriteria(OTPDetails.class)
				.add(Restrictions.eq("otpCode", generatedOTP));
		if (criteria.list().isEmpty())
			result = false;
		else
			result = true;
		return result;
	}

	@Override
	public UserBean getUserDetails(String uname, String role) {
		UserBean userBean;
		if (role.equals(Constant_Variables.STAKEHOLDER)) {
			userBean = new UserBean();
			SignUp signUp = (SignUp) hibernateUtil.createEntityCriteria(SignUp.class)
					.add(Restrictions.eq("signUpEmail", uname)).uniqueResult();
			userBean.setAadharNo(String.valueOf(signUp.getSignUpAadhar()));
			userBean.setEmail(signUp.getSignUpEmail());
			userBean.setId(String.valueOf(signUp.getSignUpId()));
			userBean.setMobileNo(String.valueOf(signUp.getSignUpMobile()));
			userBean.setName(signUp.getSignUpName());

		} else {
			userBean = new UserBean();
			Employee employee = (Employee) hibernateUtil.createEntityCriteria(Employee.class)
					.add(Restrictions.eq("emailId", uname)).uniqueResult();
			userBean.setEmail(employee.getEmailId());
			userBean.setName(employee.getEmpName());
			userBean.setEmpCode(employee.getEmpCode());
			userBean.setAadharNo(String.valueOf(employee.getAadharNo()));
			userBean.setMobileNo(String.valueOf(employee.getMobileNo()));
			userBean.setId(String.valueOf(employee.getEmpId()));
			userBean.setUserId(employee.getUser());
		}

		return userBean;
	}

	@Override
	public String checkOTP(String mobile, String otp) {
		String result;
		SignUp signup = (SignUp) hibernateUtil.createEntityCriteriaByAlias(SignUp.class, "signup")
				.add(Restrictions.eq("signUpMobile", new BigInteger(mobile)))
				.createAlias("signup.otpDetails", "otpDetails")
				.add(Restrictions.eq("otpDetails.otpCode", new BigInteger(otp))).uniqueResult();
		if (signup != null) {
			com.karvy.handloom.entity.User users = signup.getUsers();
			users.setActive((byte) 1);
			users.setSignUp(signup);
			users.setModified_By(users.getUserName());
			users.setModified_Date(new Date());
			signup.setUsers(users);
			hibernateUtil.saveORUpdate(signup);
			result = Constant_Variables.SUCCESS;
		} else {
			result = Constant_Variables.FAIL;
		}
		return result;
	}

	@Override
	public Integer saveresentOTP(String mobile, String otp) {
		logger.info("saveresentOTP {} {}", mobile, otp);
		SignUp signUp = (SignUp) hibernateUtil.createEntityCriteria(SignUp.class)
				.add(Restrictions.eq("signUpMobile", new BigInteger(mobile))).uniqueResult();
		OTPDetails otpDetails2 = signUp.getOtpDetails();
		otpDetails2.setOtpCode(new BigInteger(otp));
		signUp.setOtpDetails(otpDetails2);
		hibernateUtil.saveORUpdate(signUp);

		return 1;
	}

}
