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
<title>게시물 즐겨찾기</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/markPost.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="chat.jsp" %>
	<div id="all">
		<div id="all-wrap">
	<%@ include file="myUltaryheader.jsp" %>
	<%@ include file="navaside.jsp" %>
			<section>
				<div class="sectiondiv">
					<div class="writer">
						<div class="sectionimg">
							<img class="sectionpic" src="<%= request.getContextPath() %>/image/프로필.png">
							<div class="sectionNick">닉네임</div>
						</div>
						<div class="contentTitle">제목제목제목</div>
						<div class="writerR">게시일 | 2022. 12. 6 (SAT) 15:34</div>
					</div>
					<div class="media">
						<img id="contentpicture" src="<%= request.getContextPath() %>/image/3.png">
					</div>
					<div class="content">
						내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
						내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
						내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
						내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
						내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
					</div>
					<div class="explain">
						<div class="expansionbox">카테고리</div>
						<div id="petlife">펫 일상</div>
						<div class="expansionbox">관심글 등록</div>
						<div id="like">♡</div>
						<div class="expansionbox">222 like</div>
						<img id="likeimg" src="<%= request.getContextPath() %>/image/좋아요.png">
					</div>
					<div class="comment">
						<div class="comment0">댓글</div>
						<hr>
						<div class="comment1">
							<div class="comment2-1"><img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png"></div>
							<div class="comment2-2">댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글</div>
						</div>
						
						<div class="commentans">답글답글답글답글답글답글답글답글답글답글답글답글답글답글답글</div>
						<div class="commenttextdiv">
							<div class="writercomment"><img class="writercommentimg" src="<%= request.getContextPath() %>/image/프로필.png"></div>
							<input class="commenttext" type="text" placeholder="내용을 입력해주세요">
							<input class="commentsubmit" type="submit" value="댓글달기">
						</div>
					</div>
				</div>
			</section>
		</div>
		<footer>제작사:hoseong</footer>
	</div>
</body>
</html>