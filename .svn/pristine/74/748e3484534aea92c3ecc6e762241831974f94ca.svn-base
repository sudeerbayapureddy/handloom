/**
 * 
 */
package com.karvy.handloom.ad.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.karvy.handloom.ad.dao.ADApprovalFlowDAO;
import com.karvy.handloom.ad.dao.impl.ADApprovalFlowDAOImpl;
import com.karvy.handloom.ad.service.ADApprovalFlowService;
import com.karvy.handloom.admin.bean.ADApprovalBean;
import com.karvy.handloom.admin.bean.AncillaryDetailsBean;
import com.karvy.handloom.admin.bean.LoomDetailsBean;
import com.karvy.handloom.admin.bean.RegistrationApprovalBean;
import com.karvy.handloom.common.util.PseudoColumnsUtil;
import com.karvy.handloom.entity.AncillaryWorkersMapping;
import com.karvy.handloom.entity.PseudoColumns;
import com.karvy.handloom.entity.StakeHolder;
import com.karvy.handloom.entity.StakeholderLoomMapping;

/**
 * @author sateesh.jangam
 *
 */
@Service
@Transactional
public class ADApprovalFlowServiceImpl implements ADApprovalFlowService {

	private static final Logger logger = LoggerFactory.getLogger(ADApprovalFlowServiceImpl.class);

	@Autowired
	ADApprovalFlowDAO adApprovalFlowDAO;

	@Override
	public List<ADApprovalBean> getADGridDetails(String username, String roleName) {
		List<ADApprovalBean> approvalGridList = new ArrayList<ADApprovalBean>();
		String approvedDate = null;
		String submittedDate = null;
		String approvedUser = null;
		if (roleName.equals("AD"))
			approvalGridList = adApprovalFlowDAO.getStakeHolderDetailsByAD(username, roleName);
		else if (roleName.equals("Stakeholder"))
			approvalGridList = adApprovalFlowDAO.getStakeHolderDetailsByStakeHolder(username);

		for (ADApprovalBean adApprovalBean : approvalGridList) {
			logger.info("date in app", ((adApprovalBean.getApproved().toString()).split(" ")[0]).split("-")[0]);
			if (adApprovalBean.getApproved() != null)
				adApprovalBean.setApprovedDate(((adApprovalBean.getApproved().toString()).split(" ")[0]).split("-")[2]
						+ "-" + ((adApprovalBean.getApproved().toString()).split(" ")[0]).split("-")[1] + "-"
						+ ((adApprovalBean.getApproved().toString()).split(" ")[0]).split("-")[0]);
			if (adApprovalBean.getSubmitted() != null)
				adApprovalBean.setSubmittedDate(((adApprovalBean.getSubmitted().toString()).split(" ")[0]).split("-")[2]
						+ "-" + ((adApprovalBean.getSubmitted().toString()).split(" ")[0]).split("-")[1] + "-"
						+ ((adApprovalBean.getSubmitted().toString()).split(" ")[0]).split("-")[0]);
			if (adApprovalBean.getApprovedBy() != null)
				adApprovalBean.setApprovedBy(adApprovalBean.getApprovedBy().split("@")[0]);
		}
		return approvalGridList;
	}

	@Override
	public void registrationApproval(String userName, String roleName, String id, String decision, String comments) {

		StakeHolder stakeHolder = adApprovalFlowDAO.getStakeHolderById(Integer.parseInt(id));
		if (decision.equals("Approved")) {
			stakeHolder.setShApprovalStatus("Approved");
			stakeHolder.setShApprovalComments(comments);
			stakeHolder.setModified_By(userName);
			stakeHolder.setModified_Date(new Date());

			// PseudoColumnsUtil.setPseudoColumnsValuesAtModification(StakeHolder.class,
			// userName);

		} else if (decision.equals("Rejected")) {
			stakeHolder.setShApprovalStatus("Rejected");
			stakeHolder.setShApprovalComments(comments);
			stakeHolder.setModified_By(userName);
			stakeHolder.setModified_Date(new Date());

			// PseudoColumnsUtil.setPseudoColumnsValuesAtModification(StakeHolder.class,
			// userName);

		}
		adApprovalFlowDAO.updateStakeHolder(stakeHolder);
	}

	@Override
	public RegistrationApprovalBean registrationApprovalView(String id) {

		RegistrationApprovalBean registrationApprovalBean = new RegistrationApprovalBean();
		List<LoomDetailsBean> loomDetailsBeanList = new ArrayList<>();
		List<AncillaryDetailsBean> ancillaryDetailsBeanList = new ArrayList<>();
		StakeHolder stakeHolder = adApprovalFlowDAO.getStakeHolderById(Integer.parseInt(id));
		registrationApprovalBean.setStakeHolderId(String.valueOf(stakeHolder.getShId()));
		registrationApprovalBean.setStakeHolderName(stakeHolder.getShName());
		registrationApprovalBean.setStakeHolderAadharNo(String.valueOf(stakeHolder.getShAadharNo()));
		registrationApprovalBean.setStakeHolderType(stakeHolder.getShType());
		registrationApprovalBean.setShDestrict(stakeHolder.getHsAddress().getHsDistrictsMaster().getDistrictName());
		registrationApprovalBean.setShMandal(stakeHolder.getHsAddress().getHsMandalsMaster().getMandalName());
		registrationApprovalBean.setShVillage(stakeHolder.getHsAddress().getHsVillagesMaster().getVillageName());
		registrationApprovalBean.setShBankName(stakeHolder.getHsBankDetails().getHsBankMaster().getBankName());
		registrationApprovalBean.setShBranchName(stakeHolder.getHsBankDetails().getBdBranchName());
		registrationApprovalBean.setShAccountNo(String.valueOf(stakeHolder.getHsBankDetails().getBdAccountNo()));
		registrationApprovalBean.setStakeHolderRegNo(stakeHolder.getShRegNo());
		registrationApprovalBean.setShBankIfsc(stakeHolder.getHsBankDetails().getBdIFSCCode());
		registrationApprovalBean.setShBankMicr(stakeHolder.getHsBankDetails().getBdIFSCCode());
		registrationApprovalBean.setShPincode(String.valueOf(stakeHolder.getHsAddress().getPincode()));
		registrationApprovalBean.setShAddress(stakeHolder.getHsAddress().getAddress1() + ","
				+ stakeHolder.getHsAddress().getAddress2() + "," + stakeHolder.getHsAddress().getAddress3());
		registrationApprovalBean.setStakeHolderStatus(stakeHolder.getShApprovalStatus());
		registrationApprovalBean.setShRegApprovedRejectedDate(String.valueOf(stakeHolder.getModified_Date()));
		registrationApprovalBean.setShRegModifiedBy(stakeHolder.getModified_By());
		registrationApprovalBean.setShRegComments(stakeHolder.getShApprovalComments());

		for (StakeholderLoomMapping shLoomMapingt : stakeHolder.getHsStakeholderLoomMappings()) {
			LoomDetailsBean loomDetailsBean = new LoomDetailsBean();
			loomDetailsBean.setLoomId(String.valueOf(shLoomMapingt.getLoomDetails().getLdId()));
			loomDetailsBean.setLoomWeaverName(shLoomMapingt.getLoomDetails().getLdWeaverName());
			loomDetailsBean.setLoomWeaverAadharNo(String.valueOf(shLoomMapingt.getLoomDetails().getLdWeaverAadharNo()));
			loomDetailsBean.setLoomBarcode(String.valueOf(shLoomMapingt.getLoomDetails().getLdBarcode()));
			loomDetailsBean.setLoomLongitude(shLoomMapingt.getLoomDetails().getLdLongitude());
			loomDetailsBean.setLoomYarnType(shLoomMapingt.getLoomDetails().getLdYarnType());
			loomDetailsBean.setLoomDestrict(
					shLoomMapingt.getLoomDetails().getHsAddress().getHsDistrictsMaster().getDistrictName());
			loomDetailsBean
					.setLoomMandal(shLoomMapingt.getLoomDetails().getHsAddress().getHsMandalsMaster().getMandalName());
			loomDetailsBean.setLoomVillage(
					shLoomMapingt.getLoomDetails().getHsAddress().getHsVillagesMaster().getVillageName());
			loomDetailsBean
					.setLoomBankName(shLoomMapingt.getLoomDetails().getHsBankDetails().getHsBankMaster().getBankName());
			loomDetailsBean.setLoomBranchName(shLoomMapingt.getLoomDetails().getHsBankDetails().getBdBranchName());
			loomDetailsBean.setLoomAccountNo(
					String.valueOf(shLoomMapingt.getLoomDetails().getHsBankDetails().getBdAccountNo()));

			loomDetailsBeanList.add(loomDetailsBean);

			for (AncillaryWorkersMapping ancillaryWorkersMapping : shLoomMapingt.getLoomDetails()
					.getAncillaryWorkersMapping()) {
				AncillaryDetailsBean ancillaryDetailsBean = new AncillaryDetailsBean();
				if (ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getAwdId() != null)
					ancillaryDetailsBean
							.setAwId(String.valueOf(ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getAwdId()));
				ancillaryDetailsBean.setAdName(ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getAwdName());
				if (ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getAwdAadharNo() != null)
					ancillaryDetailsBean.setAdAadharNo(
							String.valueOf(ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getAwdAadharNo()));
				ancillaryDetailsBean
						.setAdDesignation(ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getAwdDesignation());

				if (ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsBankDetails() != null) {
					ancillaryDetailsBean.setAwAccountNo(String.valueOf(
							ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsBankDetails().getBdAccountNo()));
					ancillaryDetailsBean.setAwBankIfsc(
							ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsBankDetails().getBdIFSCCode());
					ancillaryDetailsBean.setAwBankMcir(
							ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsBankDetails().getBdMICRCode());
					// comented by
					// sankar-----ancillaryDetailsBean.setAwBankName(ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsBankDetails().getHsBankMaster().getBankName());
					ancillaryDetailsBean.setAwBankName(
							ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsBankDetails().getBdBranchName());
					ancillaryDetailsBean.setAwBranchName(
							ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsBankDetails().getBdBranchName());
				}
				if (ancillaryWorkersMapping.getHsAncillaryWorkerDetails().getHsAddress() != null) {
					ancillaryDetailsBean.setShDestrict(ancillaryWorkersMapping.getHsAncillaryWorkerDetails()
							.getHsAddress().getHsDistrictsMaster().getDistrictName());
					ancillaryDetailsBean.setShMandal(ancillaryWorkersMapping.getHsAncillaryWorkerDetails()
							.getHsAddress().getHsMandalsMaster().getMandalName());
					ancillaryDetailsBean.setShVillage(ancillaryWorkersMapping.getHsAncillaryWorkerDetails()
							.getHsAddress().getHsVillagesMaster().getVillageName());
				}
				ancillaryDetailsBeanList.add(ancillaryDetailsBean);
			}

		}
		registrationApprovalBean.setLoomDetailsBeanList(loomDetailsBeanList);
		registrationApprovalBean.setAncillaryDetailsBean(ancillaryDetailsBeanList);

		return registrationApprovalBean;
	}

}
