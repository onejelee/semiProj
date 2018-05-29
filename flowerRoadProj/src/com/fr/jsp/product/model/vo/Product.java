package com.fr.jsp.product.model.vo;

import java.util.ArrayList;
import java.util.HashMap;

public class Product implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6506686914441501686L;
	private String productNum;
	private String productName;
	private int productPrice;
	private String productOriginName;
	private String productCategoryName;
	private int productCost;
	private int productQuantity;
	private ArrayList<String> images = new ArrayList<String>(); 
	
	public ArrayList<String> getImages(){
		return images;
	}
	
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductOriginName() {
		return productOriginName;
	}
	public void setProductOriginName(String productOriginName) {
		this.productOriginName = productOriginName;
	}
	public String getProductCategoryName() {
		return productCategoryName;
	}
	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	public int getProductCost() {
		return productCost;
	}
	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productCategoryName == null) ? 0 : productCategoryName.hashCode());
		result = prime * result + productCost;
		result = prime * result + ((productName == null) ? 0 : productName.hashCode());
		result = prime * result + ((productNum == null) ? 0 : productNum.hashCode());
		result = prime * result + ((productOriginName == null) ? 0 : productOriginName.hashCode());
		result = prime * result + productPrice;
		result = prime * result + productQuantity;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (productCategoryName == null) {
			if (other.productCategoryName != null)
				return false;
		} else if (!productCategoryName.equals(other.productCategoryName))
			return false;
		if (productCost != other.productCost)
			return false;
		if (productName == null) {
			if (other.productName != null)
				return false;
		} else if (!productName.equals(other.productName))
			return false;
		if (productNum == null) {
			if (other.productNum != null)
				return false;
		} else if (!productNum.equals(other.productNum))
			return false;
		if (productOriginName == null) {
			if (other.productOriginName != null)
				return false;
		} else if (!productOriginName.equals(other.productOriginName))
			return false;
		if (productPrice != other.productPrice)
			return false;
		if (productQuantity != other.productQuantity)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Product [productNum=" + productNum + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productOriginName=" + productOriginName + ", productCategoryName=" + productCategoryName
				+ ", productCost=" + productCost + ", productQuantity=" + productQuantity + "]";
	}
	public Product(String productNum, String productName, int productPrice, String productOriginName,
			String productCategoryName, int productCost, int productQuantity) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productOriginName = productOriginName;
		this.productCategoryName = productCategoryName;
		this.productCost = productCost;
		this.productQuantity = productQuantity;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
