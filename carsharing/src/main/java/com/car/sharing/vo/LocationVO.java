package com.car.sharing.vo;

public class LocationVO {
	
	private String locationCode;
	private String locationName;
	private String locationAddress;
	private String latitude;
	private String longitude;
	
	public String getLocationCode() {
		return locationCode;
	}
	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
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
	
	@Override
	public String toString() {
		return "LocationVO [locationCode=" + locationCode + ", locationName=" + locationName + ", locationAddress="
				+ locationAddress + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
	
}
