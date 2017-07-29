package com.karvy.handloom.entity;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;


/**
 * The persistent class for the hs_signup database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_signup")
@NamedQuery(name="SignUp.findAll", query="SELECT s FROM SignUp s")
@Getter
@Setter
public class SignUp extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SignUp_Id")
	private Integer signUpId;

	@Column(name="SignUp_Aadhar")
	private BigInteger signUpAadhar;

	@Column(name="SignUp_Email")
	private String signUpEmail;

	@Column(name="SignUp_Mobile")
	private BigInteger signUpMobile;

	@Column(name="SignUp_Name")
	private String signUpName;

	//bi-directional many-to-one association to User
	@OneToOne(mappedBy="signUp",cascade=CascadeType.ALL)
	private User users;
	
	//bi-directional many-to-one association to User
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "OTP_Id")
	private OTPDetails otpDetails;
}