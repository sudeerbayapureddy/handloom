/**
 * 
 */
package com.karvy.handloom.common.dto;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

// TODO: Auto-generated Javadoc
/**
 * The Class LoginForm.
 *
 * @author sudeer.bayapureddy
 */
@Getter
@Setter
public class LoginBean implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1019649227640921012L;

	/** The username. */
	@NotEmpty
	private String username;

	/** The password. */
	private String password;

}
