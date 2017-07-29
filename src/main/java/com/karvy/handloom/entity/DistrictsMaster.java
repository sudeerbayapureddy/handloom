package com.karvy.handloom.entity;

import java.io.Serializable;
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
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;


/**
 * The persistent class for the hs_districts_master database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_districts_master")
@NamedQuery(name="DistrictsMaster.findAll", query="SELECT d FROM DistrictsMaster d")
@Getter
@Setter
public class DistrictsMaster extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="District_Id")
	private Integer districtId;

	@Column(name="District_Code")
	private String districtCode;

	@Column(name="District_Name")
	private String districtName;
	
	@Column(name="District_State_Id")
	private Integer districtStateId;	

	//bi-directional many-to-one association to Address
	@JsonBackReference
	@OneToMany(mappedBy="hsDistrictsMaster")
	private List<Address> hsAddresses;

	//bi-directional many-to-one association to StatesMaster
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name="District_State_Id", nullable = false,insertable = false,updatable = false)
	private StatesMaster hsStatesMaster;

	//bi-directional many-to-one association to MandalsMaster
	@JsonBackReference
	@OneToMany(mappedBy="hsDistrictsMaster")
	private List<MandalsMaster> hsMandalsMasters;
}