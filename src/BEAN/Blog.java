package BEAN;

public class Blog {
	private int BlogId;
	private String Name;
	private String Image;
	private String Content;
	private int CategoryForBlogId;
	private String Meta;
	/**
	 * @return the blogId
	 */
	public int getBlogId() {
		return BlogId;
	}
	/**
	 * @param blogId the blogId to set
	 */
	public void setBlogId(int blogId) {
		BlogId = blogId;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return Name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		Name = name;
	}
	/**
	 * @return the image
	 */
	public String getImage() {
		return Image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		Image = image;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return Content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		Content = content;
	}
	/**
	 * @return the categoryForBlogId
	 */
	public int getCategoryForBlogId() {
		return CategoryForBlogId;
	}
	/**
	 * @param categoryForBlogId the categoryForBlogId to set
	 */
	public void setCategoryForBlogId(int categoryForBlogId) {
		CategoryForBlogId = categoryForBlogId;
	}
	/**
	 * @return the meta
	 */
	public String getMeta() {
		return Meta;
	}
	/**
	 * @param meta the meta to set
	 */
	public void setMeta(String meta) {
		Meta = meta;
	}

}
