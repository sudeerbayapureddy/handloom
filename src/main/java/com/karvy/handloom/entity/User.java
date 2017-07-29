package com.karvy.handloom.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
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

// TODO: Auto-generated Javadoc
/**
 * The persistent class for the eegp_users database table.
 * 
 * @author sateesh.jangam
 */
@Entity
@Table(name = "hs_users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
@Getter
@Setter
public class User extends PseudoColumns implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The user id. */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "User_Id")
	private Integer userId;

	/** The active. */
	@Column(name = "Active")
	private Byte active;

	/** The deleted. */
	@Column(name = "Deleted")
	private Byte deleted;

	/** The user name. */
	@Column(name = "User_Name")
	private String userName;

	/** The user password. */
	@Column(name = "User_Password")
	private String userPassword;

	/** The eegp role. */
	// bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name = "User_Role_Id")
	private Roles roles;
	
	/** The eegp role. */
	// bi-directional many-to-one association to Role
	@OneToOne
	@JoinColumn(name = "User_SignUp_Id")
	private SignUp signUp;
	
	//bi-directional many-to-one association to User
	@OneToOne(mappedBy="user",cascade=CascadeType.ALL)
	private StakeHolder stakeHolder;
	
	//bi-directional many-to-one association to User
	@OneToOne(mappedBy="user",cascade=CascadeType.ALL)
	private Employee employee;

}