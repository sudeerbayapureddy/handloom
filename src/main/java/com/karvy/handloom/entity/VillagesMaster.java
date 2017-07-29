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
 * The persistent class for the hs_villages_master database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_villages_master")
@NamedQuery(name="VillagesMaster.findAll", query="SELECT h FROM VillagesMaster h")
@Getter
@Setter
public class VillagesMaster extends PseudoColumns implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Village_Id")
	private Integer villageId;

	@Column(name="Village_Code")
	private String villageCode;

	@Column(name="Village_Name")
	private String villageName;
	
	@Column(name="Village_Mandal_Id")
	private Integer villageMandalId;

	//bi-directional many-to-one association to Address
	@JsonBackReference
	@OneToMany(mappedBy="hsVillagesMaster")
	private List<Address> hsAddresses;

	//bi-directional many-to-one association to MandalsMaster
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name="Village_Mandal_Id", nullable = false,insertable = false,updatable = false)
	private MandalsMaster hsMandalsMaster;
}