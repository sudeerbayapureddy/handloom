package com.karvy.handloom.stakeholder.bean;

import java.math.BigInteger;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StakeHolderBean {
	private String shName;
	private BigInteger shAadharNo;
	private String shType;
	private String address1;
	private int pincode;
	private int addressDistrictId;
	private int addressMandalId;
	private int addressVillageId;
	private String bdIFSCCode;
	private BigInteger bdAccountNo;
	private Integer bdBankId;
	private List<AncillaryBean> ancillaryBean;
	private String uname;
}
