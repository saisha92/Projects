package com.inventory.model;
public class Stock {
	String Product_code;
	String Productmodel_id;
	String Product_name;
	String Product_status;
	String Order_id;
    int Quantity;
	public String getProduct_code() {
		return Product_code;
	}
	public void setProduct_code(String productCode) {
		Product_code = productCode;
	}
	public String getProductmodel_id() {
		return Productmodel_id;
	}
	public void  setProductmodel_id(String productModelId) {
		Productmodel_id = productModelId;
	}
	public String getProduct_name() {
		return Product_name;
	}
	public void setProduct_name(String productName) {
		Product_name = productName;
	}
	public String getProduct_status() {
		return Product_status;
	}
	public void setProduct_status(String productStatus) {
		Product_status = productStatus;
	}
	public String getOrder_id() {
		return Order_id;
	}
	public void setOrder_id(String orderId) {
		Order_id = orderId;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
}
