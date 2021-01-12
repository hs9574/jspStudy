<%@page import="kr.or.ddit.user.model.EmpVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%= request.getContextPath() %>/../favicon.ico">

<title>user</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet"><!-- Bootstrap core CSS -->
<link href="<%= request.getContextPath() %>/css/dashboard.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/blog.css" rel="stylesheet">
<% List<EmpVo> empList =(List<EmpVo>) request.getAttribute("emplist"); %>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<div class="container-fluid">
<div class="col-sm-3 col-md-2 sidebar">
	<%@ include file="/common/left.jsp" %>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<div class="row">
		<div class="col-sm-8 blog-main">
			<h2 class="sub-header">직원</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<tr>
						<th>사원번호</th>
						<th>사원 이름</th>
						<th>사원 부서</th>
						<th>매니저번호</th>
						<th>입사일자</th>
						<th>연봉</th>
						<th>상여금</th>
						<th>부서번호</th>
					</tr>
					<% for(int i=0; i<empList.size(); i++){
							EmpVo vo = empList.get(i);
							out.write("<tr>");
							out.write("<td>" + vo.getEmpno() + "</td>");
							out.write("<td>" + vo.getEname() + "</td>");
							out.write("<td>" + vo.getJob() + "</td>");
							out.write("<td>" + vo.getMgr() + "</td>");
							out.write("<td>" + vo.getHiredate() + "</td>");
							out.write("<td>" + vo.getSal() + "</td>");
							out.write("<td>" + vo.getComm() + "</td>");
							out.write("<td>" + vo.getDeptno() + "</td>");
							out.write("</tr>");
						}
					%>
				</table>
			</div>
			<a class="btn btn-default pull-right">사용자 등록</a>

			<div class="text-center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>