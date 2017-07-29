package com.karvy.handloom.common.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class LoomDetailsDTO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer shId;
	private Integer ldId;
	private BigInteger ldBarcode;
	private String ldYarnType;
	private BigDecimal ldSubsidyEligibilityQty;
	private String ldWeaverName;
	private BigInteger ldWeaverAadharNo;
	private String ldLongitude;
	private String ldLatitude;
	private String address1;
	private Integer pincode;
	private Integer districtId;
	private Integer mandalId;
	private Integer villageId;
	private BigInteger bankACNo;
	private Integer bankId;
	private String bankName;
	private String ifscCode;
	private String districtName;
	private String mandalName;
	private String villageName;
	private Integer yarnSHId;
	
	private String bdIFSCCode;	
	private String bdBranchName;
	private BigInteger bdAccountNo;
	
}