package com.karvy.handloom.entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;


/**
 * The persistent class for the hs_stake_holder database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_stake_holder")
@NamedQuery(name="StakeHolder.findAll", query="SELECT s FROM StakeHolder s")
@Getter
@Setter
public class StakeHolder extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SH_Id")
	private Integer shId;

	@Column(name="Is_Active")
	private Byte isActive;

	@Column(name="SH_Aadhar_No")
	private BigInteger shAadharNo;

	@Column(name="SH_Approval_Status")
	private String shApprovalStatus;

	@Column(name="SH_Name")
	private String shName;

	@Column(name="SH_Reg_No")
	private String shRegNo;

	@Column(name="SH_Type")
	private String shType;

	//bi-directional many-to-one association to Address
	@JsonManagedReference
	@ManyToOne
	@Cascade({CascadeType.SAVE_UPDATE})
	@JoinColumn(name="SH_Address_Id")
	private Address hsAddress;

	//bi-directional many-to-one association to BankBranch
	@JsonManagedReference
	@ManyToOne
	@Cascade({CascadeType.SAVE_UPDATE})
	@JoinColumn(name="SH_BD_Id")
	private BankDetails hsBankDetails;
	
	//bi-directional many-to-one association to StakeholderLoomMapping
	@JsonManagedReference
	@OneToMany(mappedBy="hsStakeHolders")
	private List<StakeholderLoomMapping> hsStakeholderLoomMappings;
	
	@OneToOne
	@JoinColumn(name ="SH_User_Id")
	private User user;
	
	@OneToMany(mappedBy="hsStakeHolders")
	private List<YarnIndent> yarnIdents;
	
	@Column(name="SH_Approval_Comments")
	private String shApprovalComments;
}