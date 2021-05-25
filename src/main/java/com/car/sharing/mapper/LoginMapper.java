package com.car.sharing.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.car.sharing.vo.UserVO;

@Mapper
public interface LoginMapper {

	//로그인 - id,pw 체크
	UserVO loginCheck(UserVO userVO) throws Exception;

}
