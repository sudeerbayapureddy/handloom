package com.karvy.handloom.entity;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * The persistent class for the eegp_employee database table.
 * 
 * @author sateesh.jangam
 */
@Entity
@Table(name = "ts_handlooms.hs_employee")
@NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e")
@Getter
@Setter
public class Employee extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Emp_Id")
	private Integer empId;
	
	
	private Byte active;

	@Column(name = "Emp_Code")
	private String empCode;

	@Column(name = "Emp_Designation")
	private String empDesignation;

	@Column(name = "Emp_Name")
	private String empName;

	@Column(name = "Emp_Email_Id")
	private String emailId;

	// bi-directional many-to-one association to User
	@OneToOne
	@JoinColumn(name = "Emp_User_Id")
	private User user;
	
	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "Emp_Address_Id")
	private Address address;
	
	@Column(name = "Emp_Mobile_No")
	private BigInteger aadharNo;
	
	@Column(name = "Emp_Aadhar_No")
	private BigInteger mobileNo;
	
	

	

}