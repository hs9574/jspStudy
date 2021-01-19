package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PostEncodingFilter implements Filter{
	private static final Logger logger = LoggerFactory.getLogger(PostEncodingFilter.class);
	private String encoding = "utf-8";
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.debug("postEncodingFilter init()");
		ServletContext sc = filterConfig.getServletContext();
		sc.setAttribute("encoding", encoding);

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		logger.debug("encoding : {}", encoding);
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}
