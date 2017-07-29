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
 * The persistent class for the hs_mandals_master database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_mandals_master")
@NamedQuery(name="MandalsMaster.findAll", query="SELECT m FROM MandalsMaster m")
@Getter
@Setter
public class MandalsMaster extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Mandal_Id")
	private Integer mandalId;

	@Column(name="Mandal_Code")
	private String mandalCode;

	@Column(name="Mandal_Name")
	private String mandalName;
	
	@Column(name="Mandal_District_Id")
	private Integer mandalDistrictId;

	@JsonBackReference
	@OneToMany(mappedBy="hsMandalsMaster")
	private List<Address> hsAddresses;

	//bi-directional many-to-one association to DistrictsMaster
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name="Mandal_District_Id", nullable = false,insertable = false,updatable = false)
	private DistrictsMaster hsDistrictsMaster;

	//bi-directional many-to-one association to HsVillagesMaster
	@JsonBackReference
	@OneToMany(mappedBy="hsMandalsMaster")
	private List<VillagesMaster> hsVillagesMasters;
}