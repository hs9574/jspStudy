package kr.or.ddit.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.user.model.EmpVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;

@WebServlet("/allEmp")
public class AllEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserServiceI userService = new UserService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<EmpVo> emplist = userService.selectAllEmp();
		
		request.setAttribute("emplist", emplist);
		
		request.getRequestDispatcher("/user/allEmp.jsp").forward(request, response);
	}

}
