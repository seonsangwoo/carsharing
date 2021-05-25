package com.car.sharing.vo;

public class PaymentVO {

	private String paymentNo;
	private String rentalNo;
	private String paymentMethod;
	private String paymentString;
	
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getRentalNo() {
		return rentalNo;
	}
	public void setRentalNo(String rentalNo) {
		this.rentalNo = rentalNo;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getPaymentString() {
		return paymentString;
	}
	public void setPaymentString(String paymentString) {
		this.paymentString = paymentString;
	}
	
	@Override
	public String toString() {
		return "PaymentVO [paymentNo=" + paymentNo + ", rentalNo=" + rentalNo + ", paymentMethod=" + paymentMethod
				+ ", paymentString=" + paymentString + "]";
	}
	
	
}
