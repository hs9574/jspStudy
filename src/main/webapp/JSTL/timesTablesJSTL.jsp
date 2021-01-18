<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width : 100%;
}
td{
	border : 1px solid black;
	padding : 10px;
}
</style>
</head>
<body>
	표현식, 스크립툴릿을 EL, JSTL로 변경
	<table>
		<c:forEach begin="1" end="9" var="i">
			<tr>
				<c:forEach begin="2" end="9" var="k">
					<td>${k} * ${i} = ${k*i}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>