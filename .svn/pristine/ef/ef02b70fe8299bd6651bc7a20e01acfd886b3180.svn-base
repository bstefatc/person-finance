package com.sombra.inc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "user")
@NamedQueries({

@NamedQuery(name = User.FIND_USER_BY_USERNAME, query = "Select u from User u where u.username LIKE ?1 "),
		@NamedQuery(name = User.FIND_USER_BY_USERNAME_OR_EMAIL, query = "Select u FROM User u WHERE u.username LIKE ?1 OR u.email LIKE ?2") })
public class User {

	public static final String FIND_USER_BY_USERNAME = "User.findByUsername";
	public static final String FIND_USER_BY_USERNAME_QUERY = "FROM User WHERE username LIKE ?1";

	public static final String FIND_USER_BY_USERNAME_OR_EMAIL = "User.findByUsernameOrEmail";
	public static final String FIND_USER_BY_USERNAME_OR_EMAIL_QUERY = "FROM User WHERE username LIKE ?1 OR email LIKE ?2";
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(unique = true, name = "username", length = 255)
	private String username;

	@Column(name = "password", length = 255)
	private String password;

	@Column(unique = true, name = "email", length = 255)
	private String email;

	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
