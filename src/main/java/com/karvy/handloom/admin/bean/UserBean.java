package com.karvy.handloom.admin.bean;

import java.io.Serializable;

import com.karvy.handloom.entity.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2496667456093797491L;
	private String name;
	private String lname;
	private String hname;
	private String id;
	private String aadharNo;
	private String email;
	private String mobileNo;
	private String empCode;
	private User userId;

}
