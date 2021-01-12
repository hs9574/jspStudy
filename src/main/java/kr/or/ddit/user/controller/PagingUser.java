package kr.or.ddit.user.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;

@WebServlet("/pagingUser")
public class PagingUser extends HttpServlet {

	private UserServiceI service = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * int page = 0; int pageSize = 0; if(req.getParameter("page") == null
		 * req.getParameter("pageSize")).equals(null){ int page = 1; int pageSize =5; }
		 */

		// left, jsp: /pagingUser?page= page=1&pageSize = 5
		// ---> /paging

		// doGet메서드에서 page, pageSize 파라미터가 request객체에 존재 하지 않을때
		// page는 1로 pageSize 5로 생각을 코드를 작성
		// 파라미터가 존재하면 해당 파라미터를 이용

		// primitive Type ==> class(Wrapper) Integer
		// if/else =-> ?//조건? //true일때 반환할 값 : false일때 반환할 값
		//refactoring : 코드를 (깔끔하게)바꾸는데 기존 동작방식을 유지한채로 변경하는 기법
		String pageParam = req.getParameter("page");
		String pageSizeParam = req.getParameter("pageSize");

		int page = req.getParameter("page") == null ? 1 : Integer.parseInt(pageParam);
		int pageSize = req.getParameter("pageSize") == null ? 5 : Integer.parseInt(pageSizeParam);

		PageVo pageVo = new PageVo(page, pageSize);
		
		Map<String, Object> map = service.selectPagingUser(pageVo);
		List<UserVo> userList = (List<UserVo>) map.get("userList");
		int userCnt = (int)map.get("userCnt");
		int pagination = (int)Math.ceil((double)userCnt/pageSize);
		
		req.setAttribute("userList", userList);
		req.setAttribute("pagination", pagination);
		req.setAttribute("pageVo", pageVo);
		
		req.getRequestDispatcher("/user/pagingUser.jsp").forward(req, resp);
	}
}