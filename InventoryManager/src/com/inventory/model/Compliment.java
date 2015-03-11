package com.inventory.model;

public class Compliment {
	String Package_Id;
	String Retailer_Id;
	String Offers;
	public String getPackageId() {
		return Package_Id;
	}
	public void setPackageId(String id) {
		this.Package_Id = id;
	}
	public String getRetailerId() {
		return Retailer_Id;
	}
	public void setRetailerId(String name) {
		this.Retailer_Id = name;
	}
	public String getOffers() {
		return Offers;
	}
	public void setOffers(String offers) {
		this.Offers = offers;
	}


}
