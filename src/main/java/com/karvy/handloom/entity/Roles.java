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

import lombok.Getter;
import lombok.Setter;

// TODO: Auto-generated Javadoc
/**
 * The persistent class for the eegp_roles database table.
 * 
 * @author sateesh.jangam
 */
@Entity
@Table(name = "hs_roles")
@NamedQuery(name = "Roles.findAll", query = "SELECT r FROM Roles r")
@Getter
@Setter
public class Roles extends PseudoColumns implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The role id. */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Role_Id")
	private Integer roleId;

	/** The active. */
	@Column(name = "Active")
	private Byte active;

	/** The deleted. */
	@Column(name = "Deleted")
	private Byte deleted;

	/** The role description. */
	@Column(name = "Role_Description")
	private String roleDescription;

	/** The role name. */
	@Column(name = "Role_Name")
	private String roleName;

	/** The eegp users. */
	// bi-directional many-to-one association to User
	@OneToMany(mappedBy = "roles")
	private List<User> users;

	/** The role value. */
	@Column(name = "Role_Value")
	private String roleValue;
}