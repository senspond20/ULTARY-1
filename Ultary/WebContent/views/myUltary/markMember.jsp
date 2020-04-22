<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Media proImg = (Media)session.getAttribute("proImg");
	ArrayList<Member> markList = (ArrayList)request.getAttribute("markList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심회원</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/markMember.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="chat.jsp" %>
	<div id="all">
		<div id="all-wrap">
	<%@ include file="myUltaryheader.jsp" %>
	<%@ include file="navaside.jsp" %>
			<section>
				<% for(int i=0;i<markList.size();i++){ %>
				<div class="markmember">
					<div class=markimg><img src="<%= request.getContextPath() %>/image/프로필.png"></div>
					<div class="marknick"><%= markList.get(i).getNickname() %></div>
					<div class="marklike">
						<div><%= markList.get(i).getMarkscore() %> MARK</div>
						<button>Cancel</button>
					</div>
				</div>
				<% } %>
			</section>
		</div>
		<footer>제작사:hoseong</footer>
	</div>
</body>
</html>