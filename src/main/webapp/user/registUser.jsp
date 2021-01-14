<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/blog.css" rel="stylesheet">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	$('#addrBtn').on('click', function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            $('#addr1').val(data.roadAddress);		//도로주소
	            $('#zipcode').val(data.zonecode);		//우편번호
	            
	            //사용자 편의성을 위해 상세주소 입력 input 태그로 focus 설정
	            $('#addr2').focus();
	        }
	    }).open();
	})
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
			<form class="form-horizontal" role="form" action="<%= request.getContextPath() %>/registUser" method="post">
				
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
					<div class="col-sm-8">
					<% String userid = request.getParameter("userid");
						userid = userid == null ? "" : userid;%>
						<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디 입력" value="<%=userid %>">
					</div>
					<div class="col-sm-2">
						<button type="button" id="checkBtn" class="btn btn-default">중복검사</button>
					</div>
				</div>

				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
					<div class="col-sm-10">
					<% String usernm = request.getParameter("usernm");
						usernm = usernm == null ? "" : usernm;%>
						<input type="text" class="form-control" id="usernm" name="usernm" placeholder="이름 입력" value="<%=usernm%>">
					</div>
				</div>

				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">별명</label>
					<div class="col-sm-10">
					<% String alias = request.getParameter("alias");
							alias = alias == null ? "" : alias;%>
						<input type="text" class="form-control" id="alias" name="alias" placeholder="별명 입력" value="<%=alias%>">
					</div>
				</div>
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
					<% String pass = request.getParameter("pass");
						pass = pass == null ? "" : pass;%>
						<input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호" value="<%=pass%>">
					</div>
				</div>
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">등록일시</label>
					<div class="col-sm-10">
					<% String reg_dt = request.getParameter("reg_dt");
						reg_dt = reg_dt == null ? "" : reg_dt;%>
						<input type="text" class="form-control" id="reg_dt" name="reg_dt" placeholder="날짜" value="">
					</div>
				</div>
				
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">도로주소</label>
					<div class="col-sm-8">
					<% String addr1 = request.getParameter("addr1");
						addr1 = addr1 == null ? "" : addr1;%>
						<input type="text" class="form-control" id="addr1" name="addr1" placeholder="도로주소" value="<%= addr1 %>" readonly>
					</div>
					<div class="col-sm-2">
						<button type="button" id="addrBtn" class="btn btn-default">주소검색</button>
					</div>
				</div>
				
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">상세주소</label>
					<div class="col-sm-10">
					<% String addr2 = request.getParameter("addr2");
						addr2 = addr2 == null ? "" : addr2;%>
						<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소" value="<%=addr2%>">
					</div>
				</div>
				
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">우편번호</label>
					<div class="col-sm-10">
					<% String zipcode = request.getParameter("zipcode");
						zipcode = zipcode == null ? "" : zipcode;%>
						<input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" value="<%=zipcode%>" readonly>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">등록 하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>