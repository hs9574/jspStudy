package kr.or.ddit.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.user.model.EmpVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;
import kr.or.ddit.user.repository.UserDaoI;

public class UserService implements UserServiceI{
	private UserDaoI dao = new UserDao();
	
	@Override
	public List<UserVo> selectAllUser() {
		List<UserVo> userlist = dao.selectAllUser();
		return userlist;
	}

	@Override
	public UserVo selectUser(String userid) {
		return dao.selectUser(userid);
	}

	@Override
	public Map<String , Object> selectPagingUser(PageVo pvo) {
		Map<String, Object> map = new HashMap<>();
		
		List<UserVo> userList = dao.selectPagingUser(pvo);
		int userCnt = dao.selectAllUserCnt();
		
		map.put("userList", userList);
		map.put("userCnt", userCnt);
		
		return map;
	}

	@Override
	public List<EmpVo> selectAllEmp() {
		return dao.selectAllEmp();
	}

	@Override
	public int modifyUser(UserVo userVo) {
		return dao.modifyUser(userVo);
	}

	@Override
	public int registUser(UserVo userVo) {
		return dao.registUser(userVo);
	}

	@Override
	public int deleteUser(String userid) {
		return dao.deleteUser(userid);
	}
}
