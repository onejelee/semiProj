package com.fr.jsp.product.model.vo;

public class ProductSimple implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8269690660877403820L;
	
	
	private String productNum;
	private String productName;
	private int productPrice;
	private String image;
	private int reviewCount;
	
	
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + ((productName == null) ? 0 : productName.hashCode());
		result = prime * result + ((productNum == null) ? 0 : productNum.hashCode());
		result = prime * result + productPrice;
		result = prime * result + reviewCount;
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
		ProductSimple other = (ProductSimple) obj;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
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
		if (productPrice != other.productPrice)
			return false;
		if (reviewCount != other.reviewCount)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ProductForList [productNum=" + productNum + ", productName=" + productName + ", image=" + image
				+ ", reviewCount=" + reviewCount + ", productPrice=" + productPrice + "]";
	}
	public ProductSimple(String productNum, String productName, String image, int reviewCount, int productPrice) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.image = image;
		this.reviewCount = reviewCount;
		this.productPrice = productPrice;
	}
	public ProductSimple() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
