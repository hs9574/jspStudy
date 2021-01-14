package kr.or.ddit.user.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.user.model.EmpVo;
import kr.or.ddit.user.model.UserVo;

public interface UserServiceI {
	// 반환타입 메소드명();
	List<UserVo> selectAllUser();

	// userid에 해당하는 사용자 한명의 정보 조회
	UserVo selectUser(String userid);

	Map<String , Object> selectPagingUser(PageVo pvo);
	
	List<EmpVo> selectAllEmp();
	
	//사용자 정보 수정
	int modifyUser(UserVo userVo);
	
	//사용자 추가
	int registUser(UserVo userVo);
	
	//사용자 삭제
	int deleteUser(String userid);
}
