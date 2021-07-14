package com.car.sharing.vo;

public class UserVO {
	
	private int userSeq;
	private String userId;
	private String pw;
	private String name;
	private String phone;
	private String address;
	private String licensenumber;
	private String joinDate;
	
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLicensenumber() {
		return licensenumber;
	}
	public void setLicensenumber(String licensenumber) {
		this.licensenumber = licensenumber;
	}
	public String getjoinDate() {
		return joinDate;
	}
	public void setjoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "UserVO [userSeq=" + userSeq + ", userId=" + userId + ", pw=" + pw + ", name=" + name + ", phone="
				+ phone + ", address=" + address + ", licensenumber=" + licensenumber + ", joinDate=" + joinDate
				+ "]";
	}
	
}
