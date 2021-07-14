package com.car.sharing.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.car.sharing.vo.UserVO;

@Mapper
public interface LoginMapper {

	//로그인 - id,pw 체크
	UserVO loginCheck(UserVO userVO) throws Exception;

	ArrayList<UserVO> test() throws Exception;

}
