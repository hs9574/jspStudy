<%@page import="kr.or.ddit.common.model.PageVo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
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
<link rel="icon" href="<%=request.getContextPath()%>/../favicon.ico">

<title>user</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/blog.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
List<UserVo> userList = (List<UserVo>) request.getAttribute("userList");
%>
<script>
//문서 로딩이 완료되고 나서 실행되는 영역
$(function(){
	$('.user').on("click",function(){
		// this : 클릭이벤트가 발생한 element
		// data-속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
		// data-userId ==> data-userid
		var userid = $(this).data("userid");
		$('#userid').val(userid);
		$('#frm').submit();
	});
	
	$('#insBtn').on("click",function(){
		location.href= '<%=request.getContextPath() %>/registUser';
	})
})
</script>
</head>
<body>
	<form id="frm" action="<%=request.getContextPath()%>/user">
		<input type="hidden" name="userid" id="userid" value=""/>
	</form>
	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid">
		<div class="col-sm-3 col-md-2 sidebar">
			<%@ include file="/common/left.jsp"%>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

			<div class="row">
				<div class="col-sm-8 blog-main">
					<h2 class="sub-header">사용자</h2>
					<div class="table-responsive">
						<table class="table table-striped">
							<tr>
								<th>사용자 아이디</th>
								<th>사용자 이름</th>
								<th>사용자 별명</th>
								<th>등록일시</th>
							</tr>
							<%
							for (int i = 0; i < userList.size(); i++) {
								UserVo vo = userList.get(i);
								out.write("<tr class=user data-userid="+ vo.getUserid() + ">");
								out.write("<td>" + vo.getUserid() + "</td>");
								out.write("<td>" + vo.getUsernm() + "</td>");
								out.write("<td>" + vo.getAlias() + "</td>");
								out.write("<td>" + vo.getReg_dt_fmt() + "</td>");
								out.write("</tr>");
							}
							%>
						</table>
					</div>
					<a id="insBtn" class="btn btn-default pull-right">사용자 등록</a>

					<div class="text-center">
						<% PageVo vo = ((PageVo)request.getAttribute("pageVo")); 
						   int pagination = (int)request.getAttribute("pagination");%>
						<ul class="pagination">
							<%-- pagination 값이 4이므로 1부터 4까지 4번 반복된다.
								 전체 사용자수 : 16명
								 페이지 사이즈 : 5
								 전체 페이지 수 : 4페이지
							 --%>
							 <li class="prev"><a href="<%=request.getContextPath()%>/pagingUser?page=1&pageSize=<%=vo.getPagesize()%>">«</a></li>
							<%for(int i=1; i<= pagination; i++){
								if(vo.getPage() == i){ %>
									<li class="active"><span><%=i %></span></li>
								<%}else{ %>
									<li><a href="<%=request.getContextPath()%>/pagingUser?page=<%=i %>&pageSize=<%=vo.getPagesize()%>"><%=i %></a></li>
								<%}
							} %>
							<li class="next"><a href="<%=request.getContextPath()%>/pagingUser?page=<%=pagination %>&pageSize=<%=vo.getPagesize()%>">»</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>