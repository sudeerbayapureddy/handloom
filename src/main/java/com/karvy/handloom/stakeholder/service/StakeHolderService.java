/**
 * 
 */
package com.karvy.handloom.stakeholder.service;

import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.karvy.handloom.admin.bean.RegistrationApprovalBean;
import com.karvy.handloom.common.dto.IndentsDTO;
import com.karvy.handloom.common.dto.LoomDetailsDTO;
import com.karvy.handloom.common.dto.YarnIndentDetailDTO;
import com.karvy.handloom.entity.BankMaster;
import com.karvy.handloom.entity.DistrictsMaster;
import com.karvy.handloom.entity.LoomDetails;
import com.karvy.handloom.entity.MandalsMaster;
import com.karvy.handloom.entity.StakeHolder;
import com.karvy.handloom.entity.VillagesMaster;
import com.karvy.handloom.stakeholder.bean.StakeHolderBean;

/**
 * @author sateesh.jangam
 *
 */
public interface StakeHolderService {

	LoomDetailsDTO getLoomDetails(BigInteger loomId);
	
	public List<BankMaster> getBankMasterDetails();

	public List<DistrictsMaster> getDistrictDetails();

	public List<MandalsMaster> getMandalDetails(int distId);

	public List<VillagesMaster> getVillageDetails(int manId);

	public LoomDetails getLoomDetailsByAadhar(String aadharNo);

	RegistrationApprovalBean getStakeHolderDetails(Integer signUpId);

	List<IndentsDTO> getIndentList(Integer signUpId, HttpServletRequest request);

	String saveIndentDetails(List<YarnIndentDetailDTO> indetsList, HttpServletRequest request);

	List<YarnIndentDetailDTO> getYarnIndentDetail(String indentId, HttpServletRequest request);
	
	String submitStakeHolderDetails(StakeHolderBean stakeHolderBean);

	StakeHolder checkAlreadyExist(String aadharNo);

	String checkRegistrationByUserId(String uname);

}