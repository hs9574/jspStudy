package kr.or.ddit.servlet.basic;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;

/* web.xml에 설정하는 servlet, servlet-mapping을 어노테이션을 통해 설정하는 방법 */
@WebServlet("/loginController")
public class LoginController extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	private UserServiceI userService = new UserService();
	
	@Override
	protected void doPost(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException ,java.io.IOException {
		// 사용자가 userid, pass 파라미터를 전송 했다는 가정으로 개발
		
		//로그인 성공시 main.jsp로 이동
		//로그인 프로세스
		//db에 저장된 사용자 정보와 일치하는지 검증해야하나, db연동이 아직 준비되지 않은 관계로
		//userid가 brown일 때 비밀번호가 brownpass 인 경우에 한해 로그인이 성공되었다고 판단
		//그 외 경우는 로그인 실패로 간주
		//로그인 성공시 : main.jsp로 forward
		//  forward : 요청을 처리할 다른 jsp, servlet에게 위임
		//			  서버 안에서 이루어 지는 작업으로 클라이언트 입장에서는 누가 응답을 생성 했는지 알 수 없다.
		//			  request.getRequestDispatcher(url)를 이용하여 requestDispatcher
		//			  객체를 얻어 forward(request, response)를 실행
		//			  ** 같은 웹 어플리케이션 안에서 일어나는 일이므로 contextPath를 지정하지 않는다
		//로그인 실패시 : login.jsp로 redirect(문법적으로 배우기 위해, 올바른 상황에 대해서는 추후 다시..)
		// redirect : 클라이언트에게 정해진 주소로 재요청 할 것을 지시
		//			  redirect 응답을 받은 클라이언트는 재요청 주소로 서버에게 요청한다
		//			  원 요청 + 재 요청 : 요청이 총 2번 필요
		//			  response.sendRedirect("클라이언트가 새롭게 요청할 주소");
		//		"클라이언트가 새롭게 요청할 주소" ==> 클라이언트가 사용하는 웹브라우저 주소줄에 표시
		//		** contextPath가 있을경우 지정을 해야함
		
		// 1. userid, pass 파라미터를 문자열 변수에 저장
		// 2. userid, pass 값이 지정한 값과 일치하는지 비교
		// 3. 2번 비교 시항이 true일 때 webapp/main.jsp로 forward (main.jsp는 생성)
		// 4. 2번 비교 시항이 false일 때 webapp/login.jsp로 redirect
		
		String userid = req.getParameter("userid");
		String pass = req.getParameter("pass");
		
		UserVo user = userService.selectUser(userid);
		//로그인성공 ==> service를 통해 데이터베이스에 저장된 값과 일치할 때
		// session에 데이터베이스에서 조회한 사용자 정보(userVo)를 저장
		if(user != null && pass.equals(user.getPass())) {
			HttpSession session = req.getSession();
			session.setAttribute("S_USER", user);
			req.getRequestDispatcher(req.getContextPath() + "/jsp/main.jsp").forward(req, resp);
		}
		//로그인 실패
		else {
			resp.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
		}
	}
}
