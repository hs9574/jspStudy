<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/mulCalculation" method="post">
		<input type="text" name="start"><br>
		<input type="text" name="end"><br>
		<input type="submit"><br>
	</form>
</body>
</html>