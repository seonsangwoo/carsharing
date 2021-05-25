package com.car.sharing.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.car.sharing.vo.CarLocationRentalVO;
import com.car.sharing.vo.RentalVO;
import com.car.sharing.vo.UserVO;

@Mapper
public interface UserMapper {

	//회원가입 - 아이디 중복체크
	int idCheck(UserVO userVO) throws Exception;

	//회원가입 - 핸드폰번호 중복체크
	int phoneCheck(UserVO userVO) throws Exception;

	//회원가입 - 면허증번호 중복체크
	int licenseCheck(UserVO userVO) throws Exception;

	//회원가입 - 유저정보 insert
	int joinUser(UserVO userVO) throws Exception;

	//차량 예약 내역 가져오기
	ArrayList<CarLocationRentalVO> reservationList(UserVO userVO) throws Exception;

	//차량 예약취소
	int reservationCancel(RentalVO rentalVO) throws Exception;

	//비밀번호 변경
	int pwChange(UserVO userVO) throws Exception;

}
