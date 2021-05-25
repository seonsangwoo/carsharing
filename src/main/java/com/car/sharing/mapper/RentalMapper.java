package com.car.sharing.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.car.sharing.vo.CarLocationRentalVO;
import com.car.sharing.vo.LocationVO;
import com.car.sharing.vo.RentalVO;

@Mapper
public interface RentalMapper {
	
	//예약하려는 시간에 같은 회원이 동일시간에 예약한 차량이 있는지 확인
	int rentalcheck(RentalVO rentalVO) throws Exception;
		
	//검색버튼 클릭하여 좌표값 가져오기
	ArrayList<LocationVO> getlatlong() throws Exception;

	//차량 상세 정보 리스트 가져오기
	ArrayList<CarLocationRentalVO> getcarinfolist(CarLocationRentalVO clrVO) throws Exception;

	//차량 정보 가져오기 (결제 페이지)
	CarLocationRentalVO getcarinfo(int carSeq) throws Exception;

	//차량 예약하기
	int payment(RentalVO rentalVO) throws Exception;

	//차량 예약 불가능한 시간 보기
	ArrayList<RentalVO> impossibletime(RentalVO rentalVO) throws Exception;

	
	

}
