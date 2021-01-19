<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common_lib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		$('#sel').on('change', function(){
			$('#sl').submit();
		})
		
		$('#sel').val('${param.lang}');
	})
</script>
</head>
<body>

	<%-- select box로 설정한 언어로 GREETTING, LANG 값을 표현 
		 select box는 사용자가 설정한 언어 값으로 선택이 되어있게 설정
	--%>
	<form id="sl" action="/JSTL/selectLang.jsp">
		<select id="sel" name="lang">
			<option value="ko">한국어</option>
			<option value="en">english</option>
			<option value="ja">日本語</option>
			<option value="etc">기타</option>
		</select>
	</form>
	
	<br><br>
	<fmt:setLocale value="${param.lang}"/>
	<fmt:bundle basename="kr.or.ddit.msg.msg">
		<fmt:message key="LANG"/> <br>
		<fmt:message key="GREETTING">
			<fmt:param value="brown"/>
		</fmt:message> <br>
	</fmt:bundle>
	
</body>
</html>