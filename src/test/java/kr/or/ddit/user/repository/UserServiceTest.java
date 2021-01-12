package kr.or.ddit.user.repository;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;

public class UserServiceTest {
	
	@Test
	public void selectAllUsertest() {
		/*** Given ***/
		UserServiceI userService = new UserService();

		/*** When ***/
		List<UserVo> userList = userService.selectAllUser();

		/*** Then ***/
		assertEquals(16, userList.size());
	}
	
	
	@Test
	public void selectUsertest() {
		/***Given***/
		UserServiceI userService = new UserService();
		String userid = "brown";

		/***When***/
		UserVo user = userService.selectUser(userid);
		/***Then***/
		assertNotNull(user);
		assertEquals("브라운", user.getUsernm());
	}
	
	@Test
	public void selectUserNotExsistTest() {
		/***Given***/
		UserServiceI userService = new UserService();
		String userid = "NOTbrown";

		/***When***/
		UserVo user = userService.selectUser(userid);
		/***Then***/
		assertNull(user);
	}
	
	@Test
	public void selectPagingUsertest() {
		/***Given***/
		UserServiceI userService = new UserService();
		
		PageVo pvo = new PageVo();
		pvo.setPage(2);
		pvo.setPagesize(5);

		/***When***/
		//List<UserVo> userlist = userService.selectPagingUser(pvo);
		Map<String, Object> map = userService.selectPagingUser(pvo);
		List<UserVo> userList = (List<UserVo>)map.get("userList");
		int userCnt = (int)map.get("userCnt");
		/***Then***/
		assertEquals(5, userList.size());
		assertEquals(16, userCnt);
	}

}
