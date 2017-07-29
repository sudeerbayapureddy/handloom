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

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import lombok.Getter;
import lombok.Setter;


/**
 * The persistent class for the hs_ancillary_workers_mapping database table.
 * @author sateesh.jangam
 */
@Entity
@Table(name="hs_ancillary_workers_mapping")
@NamedQuery(name="AncillaryWorkersMapping.findAll", query="SELECT a FROM AncillaryWorkersMapping a")
@Getter
@Setter
public class AncillaryWorkersMapping extends PseudoColumns  implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="AWM_Id")
	private Integer awmId;

	@Column(name="AWM_Loom_Id")
	private Integer awmLoomId;
	
	@Column(name="AWM_AWD_Id")
	private Integer awmAwdId;
	
	//bi-directional many-to-one association to AncillaryWorkerDetail
	@ManyToOne
	@Cascade({CascadeType.SAVE_UPDATE})
	@JoinColumn(name="AWM_AWD_Id" ,updatable=false,insertable=false)
	private AncillaryWorkerDetail hsAncillaryWorkerDetails;
	
	@ManyToOne
	@Cascade({CascadeType.SAVE_UPDATE})
	@JoinColumn(name="AWM_Loom_Id",  updatable=false,insertable=false)
	private LoomDetails loomDetails;
}