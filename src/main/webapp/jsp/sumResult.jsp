<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% int sum = (int)session.getAttribute("sumResult"); %>
</head>
<body>
	session에 저장된 sumResult 값 : <%= sum %>
</body>
</html>