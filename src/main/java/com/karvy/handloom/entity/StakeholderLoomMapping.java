package com.karvy.handloom.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;


/**
 * The persistent class for the hs_stakeholder_loom_mapping database table.
 * 
 */
@Entity
@Table(name="hs_stakeholder_loom_mapping")
@NamedQuery(name="StakeholderLoomMapping.findAll", query="SELECT s FROM StakeholderLoomMapping s")
@Getter
@Setter
public class StakeholderLoomMapping implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SH_Loom_Mapping_Id")
	private Integer shLoomMappingId;
	
	@Column(name="SH_Id")
	private Integer shId;
	
	@Column(name="LD_Id")
	private Integer ldId;

	//bi-directional many-to-one association to StakeHolder
	@JsonManagedReference
	@ManyToOne
	@JoinColumn(name="SH_Id", nullable = false,insertable = false,updatable = false )
	private StakeHolder hsStakeHolders;
	
	//bi-directional many-to-one association to StakeHolder
	@JsonManagedReference
	@ManyToOne
	@JoinColumn(name="LD_Id", nullable = false,insertable = false,updatable = false )
	private LoomDetails loomDetails;
}