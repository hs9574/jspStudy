<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% int mul = (int)session.getAttribute("mulResult"); %>
</head>
<body>
	session에 저장된 mulResult 값 : <%= mul %>
</body>
</html>