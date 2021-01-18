<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/blog.css" rel="stylesheet">
<% UserVo user = (UserVo)request.getAttribute("user"); %>
<script>
//문서 로딩이 완료 되었을 때
$(function(){
	$('#modifyBtn').on("click", function(){
		$('#frm').attr("method", "get")
		$('#frm').attr("action", "<%= request.getContextPath() %>/userModify")
		$('#frm').submit();
	});
	$("#deleteBtn").on("click", function(){
		$('#frm').attr("method", "post")
		$('#frm').attr("action", "<%= request.getContextPath() %>/deleteUser")
		$('#frm').submit();
	});
})
</script>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid">
		<div class="col-sm-3 col-md-2 sidebar">
			<%@ include file="/common/left.jsp"%>
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form class="form-horizontal" id="frm" role="form">
				<input type="hidden" name="userid" value="<%= user.getUserid() %>"/>
				
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">사용자 사진</label>
					<div class="col-sm-10">
						<img src="${pageContext.request.contextPath}/profile/<%= user.getUserid() %>.png"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
					<div class="col-sm-10">
						<label class="control-label"><%= user.getUserid() %></label>
					</div>
				</div>

				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
					<div class="col-sm-10">
						<label class="control-label"><%= user.getUsernm() %></label>
					</div>
				</div>

				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">별명</label>
					<div class="col-sm-10">
						<label class="control-label"><%= user.getAlias() %></label>
					</div>
				</div>
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<label class="control-label">******</label>
					</div>
				</div>
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">등록일시</label>
					<div class="col-sm-10">
						<label class="control-label"><%= user.getReg_dt_fmt() %></label>
					</div>
				</div>
				 
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">도로주소</label>
					<div class="col-sm-10">
						<label class="control-label"><%= user.getAddr1() %></label>
					</div>
				</div>
				
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">상세주소</label>
					<div class="col-sm-10">
						<label class="control-label"><%= user.getAddr2() %></label>
					</div>
				</div>
				
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">우편번호</label>
					<div class="col-sm-10">
						<label class="control-label"><%= user.getZipcode() %></label>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<!-- 사용자 수정 : method : get action = /userModify
						사용자 삭제 : method : post action = /deleteUser
						파라미터는 둘다 userid 하나만 있으면 가능 -->
						<button type="button" id="modifyBtn" class="btn btn-default">사용자 수정</button>
						<button type="button" id="deleteBtn" class="btn btn-default">사용자 삭제</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>