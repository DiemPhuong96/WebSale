package BEAN;

public class Products {
	private int productId;
	private int productCategoryId;
	private String productName;
	private float price;
	private int discount;
	private String created;
	private int size;
	private String color;
	private int imageProductId;
	private String description;
	private String Avartar;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductCategoryId() {
		return productCategoryId;
	}
	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
	public int getSize() {
		return size;
	}
	/**
	 * @param size the size to set
	 */
	public void setSize(int size) {
		this.size = size;
	}
	/**
	 * @return the color
	 */
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	
	public int getImageProductId() {
		return imageProductId;
	}

	public void setImageProductId(int imageProductId) {
		this.imageProductId = imageProductId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAvartar() {
		return Avartar;
	}

	public void setAvartar(String avartar) {
		this.Avartar = avartar;
	}
	

}
