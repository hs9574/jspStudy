package kr.or.ddit.user.repository;

import java.util.List;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.user.model.EmpVo;
import kr.or.ddit.user.model.UserVo;

public interface UserDaoI {

	// 전체 사용자 정보 조회
	/*
	 * SELECT * FROM users;
	 */

	//반환타입 메소드명();
	List<UserVo> selectAllUser();
	
	//userid에 해당하는 사용자 한명의 정보 조회
	UserVo selectUser(String userid);
	
	
	List<UserVo> selectPagingUser(PageVo pvo);
	
	//emp 모든 정보 가져오기
	List<EmpVo> selectAllEmp();
	
	//사용자 전체 수 조회
	int selectAllUserCnt();
}