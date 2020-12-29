package kr.or.ddit.servlet.basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimesTablesServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println("<html>");
		pw.println("	<head>");
		pw.println("		<title>TimesTablesServlet</title>");
		pw.println("	</head>");
		pw.println("	<body>");
		pw.println("		<table border=1 width=100% height=50%>");
		for(int i=1; i<=9; i++) {
			pw.println("<tr>");
			for(int j=2; j<=9; j++) {
				pw.println("<td>"+j + "*" + i + "=" + i*j + "</td>" );
			}
			pw.println("</tr>");
		}
		pw.println("	</body>");
		pw.println("</html>");
		
		pw.flush();
		pw.close(); 
	}

}
