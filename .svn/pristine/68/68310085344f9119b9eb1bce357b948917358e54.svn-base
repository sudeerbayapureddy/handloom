package com.karvy.handloom.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;


/**
 * The persistent class for the hs_bank_master database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_bank_master")
@NamedQuery(name="BankMaster.findAll", query="SELECT b FROM BankMaster b")
@Getter
@Setter
public class BankMaster extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Bank_Id")
	private Integer bankId;

	@Column(name="Bank_Name")
	private String bankName;	

	//bi-directional many-to-one association to BankBranch
	@JsonBackReference
	@OneToMany(mappedBy="hsBankMaster")
	private List<BankDetails> hsBankBranches;
}