package com.car.sharing.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.car.sharing.vo.CarLocationRentalVO;
import com.car.sharing.vo.LocationVO;
import com.car.sharing.vo.RentalVO;

public interface RentalService {

	//검색버튼 클릭하여 좌표값 가져오기
	ArrayList<LocationVO> getlatlong(RentalVO rentalVO, HttpSession session) throws Exception;

	//차량 상세 정보 리스트 가져오기
	ArrayList<CarLocationRentalVO> getcarinfolist(CarLocationRentalVO clrVO) throws Exception;
	
	//차량 예약하기
	int payment(RentalVO rentalVO, HttpSession session) throws Exception;

	//차량 예약 불가능한 시간 보기
	ArrayList<RentalVO> impossibletime(RentalVO rentalVO) throws Exception;
	

}
