/**
 * 
 */
package com.karvy.handloom.stakeholder.dao;

import java.math.BigInteger;
import java.util.List;

import com.karvy.handloom.common.dto.LoomDetailsDTO;
import com.karvy.handloom.common.dto.YarnIndentDetailDTO;
import com.karvy.handloom.entity.Address;
import com.karvy.handloom.entity.AncillaryWorkerDetail;
import com.karvy.handloom.entity.BankDetails;
import com.karvy.handloom.entity.BankMaster;
import com.karvy.handloom.entity.DistrictsMaster;
import com.karvy.handloom.entity.LoomDetails;
import com.karvy.handloom.entity.MandalsMaster;
import com.karvy.handloom.entity.StakeHolder;
import com.karvy.handloom.entity.StakeholderLoomMapping;
import com.karvy.handloom.entity.User;
import com.karvy.handloom.entity.VillagesMaster;
import com.karvy.handloom.entity.YarnIndent;

/**
 * @author sateesh.jangam
 *
 */
public interface StakeHolderDAO {

	LoomDetailsDTO getLoomDetails(BigInteger loomId);
	
	List<BankMaster> getBankMasterDetails();
	
	List<DistrictsMaster> getDistrictDetails();
	
	List<MandalsMaster> getMandalDetails(int distId);
	
	List<VillagesMaster> getVillageDetails(int manId);
	
	LoomDetails getLoomDetailsByAadhar(String aadharNo);

	String saveIndentDetails(YarnIndent indent);

	List<YarnIndent> getIndentList(Integer shId);

	List<YarnIndentDetailDTO> getYarnIndentDetail(String indentId);

	List<LoomDetails> getYarnType(List<BigInteger> barCodes);
	
	Integer submitStakeHolder(StakeHolder stakeHolder);

	Integer submitAddressDetails(Address add);

	Integer submitBankdetails(BankDetails bankDetails);

	String saveAncillaryDetails(List<AncillaryWorkerDetail> ancillaryWorkersList);

	String saveStakeLoomMapping(List<StakeholderLoomMapping> shlmList);
	
	StakeHolder checkAlreadyExist(String aadharNo);
	
	Integer getUserIdByUserName(String userName);

	User checkRegistrationByUserId(String uname);

	String getMaxNoByColumn(Class<?> entityClass, String columnName);


}
