<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<table>
		<%for(int i=1; i<=9; i++) {
			out.write("<tr>");
			for(int j=2; j<=9; j++) { 
				 out.write("<td>" +j + "*" + i + "=" + i*j + "</td>");
			}
			out.write("</tr>");
		} %>
	</table>
</body>
</html>