package com.example.demo.model;

import java.sql.Timestamp;

public class PackageModel {
	private Integer packageId = null;
	private String packageName = null;
	private Integer amount = null;
	private Timestamp createDate = null;
	private String whereDate = null;
	
	
	public Integer getPackageId() {
		return packageId;
	}
	public void setPackageId(Integer packageId) {
		this.packageId = packageId;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getWhereDate() {
		return whereDate;
	}
	public void setWhereDate(String whereDate) {
		this.whereDate = whereDate;
	}
	
	
}
