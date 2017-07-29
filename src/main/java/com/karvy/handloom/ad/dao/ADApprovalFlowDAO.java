/**
 * 
 */
package com.karvy.handloom.ad.dao;

import java.util.List;

import com.karvy.handloom.admin.bean.ADApprovalBean;
import com.karvy.handloom.entity.StakeHolder;

/**
 * @author sateesh.jangam
 *
 */
public interface ADApprovalFlowDAO {

	List<ADApprovalBean> getStakeHolderDetailsByAD(String username, String roleName);

	List<ADApprovalBean> getStakeHolderDetailsByStakeHolder(String username);

	StakeHolder getStakeHolderById(Integer id);

	void updateStakeHolder(StakeHolder stakeHolder);



}
