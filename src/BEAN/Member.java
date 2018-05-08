package BEAN;

public class Member {
	private int memberId;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String created;
	private int memberCategoryId;
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getMemberCategoryId() {
		return memberCategoryId;
	}
	public void setMemberCategoryId(int memberCategoryId) {
		this.memberCategoryId = memberCategoryId;
	}

}
