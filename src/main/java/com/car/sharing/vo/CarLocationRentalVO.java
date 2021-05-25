package com.car.sharing.vo;

public class CarLocationRentalVO {

	private int carSeq;
	private String carNo;
	private String locationCode;
	private String carKinds;
	private String carImg;
	private String carOil;
	private int carPrice;
	private String carStatus;
	private String locationName;
	private String locationAddress;
	private String latitude;
	private String longitude;
	private String rentalNo;
	private int userSeq;
	private String rentalTime;
	private String returnTime;
	private String rentalStatus;
	private int rentalPrice;
	private String reservationStatus;
	private String reservationString;
	
	public int getCarSeq() {
		return carSeq;
	}
	public void setCarSeq(int carSeq) {
		this.carSeq = carSeq;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public String getLocationCode() {
		return locationCode;
	}
	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}
	public String getCarKinds() {
		return carKinds;
	}
	public void setCarKinds(String carKinds) {
		this.carKinds = carKinds;
	}
	public String getCarImg() {
		return carImg;
	}
	public void setCarImg(String carImg) {
		this.carImg = carImg;
	}
	public String getCarOil() {
		return carOil;
	}
	public void setCarOil(String carOil) {
		this.carOil = carOil;
	}
	public int getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getLocationAddress() {
		return locationAddress;
	}
	public void setLocationAddress(String locationAddress) {
		this.locationAddress = locationAddress;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
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
	public String getRentalStatus() {
		return rentalStatus;
	}
	public void setRentalStatus(String rentalStatus) {
		this.rentalStatus = rentalStatus;
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
	public String getCarStatus() {
		return carStatus;
	}
	public void setCarStatus(String carStatus) {
		this.carStatus = carStatus;
	}
	
	@Override
	public String toString() {
		return "CarLocationRentalVO [carSeq=" + carSeq + ", carNo=" + carNo + ", locationCode=" + locationCode
				+ ", carKinds=" + carKinds + ", carImg=" + carImg + ", carOil=" + carOil + ", carPrice=" + carPrice
				+ ", carStatus=" + carStatus + ", locationName=" + locationName + ", locationAddress=" + locationAddress
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", rentalNo=" + rentalNo + ", userSeq="
				+ userSeq + ", rentalTime=" + rentalTime + ", returnTime=" + returnTime + ", rentalStatus="
				+ rentalStatus + ", rentalPrice=" + rentalPrice + ", reservationStatus=" + reservationStatus
				+ ", reservationString=" + reservationString + "]";
	}
	
}
