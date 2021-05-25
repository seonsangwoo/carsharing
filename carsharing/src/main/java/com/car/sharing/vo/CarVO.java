package com.car.sharing.vo;

public class CarVO {
	
	private int carSeq;
	private String carNo;
	private String locationCode;
	private String carKinds;
	private String carImg;
	private String carOil;
	private int carPrice;
	private String carStatus;
	
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
	public String getCarStatus() {
		return carStatus;
	}
	public void setCarStatus(String carStatus) {
		this.carStatus = carStatus;
	}
	
	@Override
	public String toString() {
		return "CarVO [carSeq=" + carSeq + ", carNo=" + carNo + ", locationCode=" + locationCode + ", carKinds="
				+ carKinds + ", carImg=" + carImg + ", carOil=" + carOil + ", carPrice=" + carPrice + ", carStatus="
				+ carStatus + "]";
	}
	
}
