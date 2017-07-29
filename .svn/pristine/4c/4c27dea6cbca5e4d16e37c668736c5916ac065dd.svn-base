package com.karvy.handloom.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;

// TODO: Auto-generated Javadoc
/**
 * The Class PseudoColumns.
 *
 * @author sudeer.bayapureddy
 * 
 *         The persistent class for the Eegp Pseudo Columns database table.
 */


@MappedSuperclass
@Getter
@Setter
public abstract class PseudoColumns implements Serializable {

	/** The Constant serialVersionUID. */
	public static final long serialVersionUID = 1L;

	/** The created by. */
	@Column(name = "Created_By")
	public String created_By;

	/** The created date. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Created_Date")
	public Date created_Date;

	/** The modified by. */
	@Column(name = "Modified_By")
	public String modified_By;

	/** The modified date. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Modified_Date")
	public Date modified_Date;

}