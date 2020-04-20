<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Media proImg = (Media)session.getAttribute("proImg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁 환경</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/trustEvm.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="chat.jsp" %>
	<div id="all">
		<div id="all-wrap">
	<%@ include file="myUltaryheader.jsp" %>
	<%@ include file="navaside.jsp" %>
			<section>
				<div id="sDiv">
					<div id="sEnvir">
						<label>돌봄환경</label>
						<hr>
						<label>픽업여부</label><input type="checkbox">
						<label>마당여부</label><input type="checkbox">
						<label>산책가능</label><input type="checkbox">
						<label>목욕가능</label><input type="checkbox">
						<label>온도조절</label><input type="checkbox">
						<label>픽업가능</label><input type="checkbox">
					</div>
					<div id="sArea">
						<label>거주지역</label>
						<hr>
						<div>지도API</div>
					</div>
					<div id="sDetail">
						<label>세부사항</label>
						<hr>
						<textarea></textarea>
					</div>
					<div id="sModify">
						<button>Modify</button>
					</div>
				</div>
			</section>
		</div>
		<footer>제작사:hoseong</footer>
	</div>
</body>
</html>