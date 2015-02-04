package com.sombra.inc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "account")
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "number")
	private String number;

	@Column(name = "currency")
	private String currency;

	@Column(name = "institution")
	private String institution;

	@Column(name = "address")
	private String address;

	@Column(name = "phone")
	private String phone;

	// @OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	// private List<Transaction> listTransaction;
	//
	// @OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	// private List<Comment> listComment;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getInstitution() {
		return institution;
	}

	public void setInstitution(String institution) {
		this.institution = institution;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	// public List<Transaction> getListTransaction() {
	// return listTransaction;
	// }
	//
	// public void setListTransaction(List<Transaction> listTransaction) {
	// this.listTransaction = listTransaction;
	// }
	//
	// public List<Comment> getListComment() {
	// return listComment;
	// }
	//
	// public void setListComment(List<Comment> listComment) {
	// this.listComment = listComment;
	// }

}
