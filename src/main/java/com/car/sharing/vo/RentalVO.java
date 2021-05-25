package com.car.sharing.vo;

public class RentalVO {

	private String rentalNo;
	private int userSeq;
	private int carSeq;
	private String rentalTime;
	private String returnTime;
	private int rentalPrice;
	private String reservationStatus;
	private String reservationString;
	
	public String getRentalNo() {
		return rentalNo;
	}
	public void setRentalNo(String rentalNo) {
		this.rentalNo = rentalNo;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getCarSeq() {
		return carSeq;
	}
	public void setCarSeq(int carSeq) {
		this.carSeq = carSeq;
	}
	public String getRentalTime() {
		return rentalTime;
	}
	public void setRentalTime(String rentalTime) {
		this.rentalTime = rentalTime;
	}
	public String getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}
	public int getRentalPrice() {
		return rentalPrice;
	}
	public void setRentalPrice(int rentalPrice) {
		this.rentalPrice = rentalPrice;
	}
	public String getReservationStatus() {
		return reservationStatus;
	}
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}
	public String getReservationString() {
		return reservationString;
	}
	public void setReservationString(String reservationString) {
		this.reservationString = reservationString;
	}
	
	@Override
	public String toString() {
		return "RentalVO [rentalNo=" + rentalNo + ", userSeq=" + userSeq + ", carSeq=" + carSeq + ", rentalTime="
				+ rentalTime + ", returnTime=" + returnTime + ", rentalPrice=" + rentalPrice + ", reservationStatus="
				+ reservationStatus + ", reservationString=" + reservationString + "]";
	}
	
}
