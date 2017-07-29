package com.karvy.handloom.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;


/**
 * The persistent class for the hs_yarn_indent database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_yarn_indent")
@NamedQuery(name="YarnIndent.findAll", query="SELECT y FROM YarnIndent y")
@Getter
@Setter
public class YarnIndent extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Yarn_Indent_Id")
	private Integer yarnIndentId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="Yarn_Indent_Date")
	private Date yarnIndentDate;

	@Column(name="Yarn_Indent_Number")
	private String yarnIndentNumber;

	@Column(name="Yarn_SH_Id")
	private Integer yarnSHId;

	//bi-directional many-to-one association to YarnIndentDetail
	@OneToMany(mappedBy="hsYarnIndent", cascade = CascadeType.ALL)
	private List<YarnIndentDetail> hsYarnIndentDetails;
	
	@ManyToOne
	@JoinColumn(name="Yarn_SH_Id",insertable=false,updatable=false)
	private StakeHolder hsStakeHolders;
	
}