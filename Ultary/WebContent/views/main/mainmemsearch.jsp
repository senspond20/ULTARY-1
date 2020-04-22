<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList ,member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg");
	String absroute = request.getContextPath();
	ArrayList<Member> mList = (ArrayList<Member>)request.getAttribute("Mlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인검색</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mainmemsearch.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet"  href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
</head>
<body>
	<%@ include file="alertchat.jsp" %>

	<header>
		<div id="top-header">
			<div id="top-left">
				<% if((loginUser) != null) { %>
				<div class="top-button" id="chatbtn">
					<img class="top-buttonimg" src="<%= request.getContextPath() %>/image/메신저.png">
				</div>
				<div class="top-button" id="alertbuttondiv">
					<img class="top-buttonimg" id="alertbutton" src="<%= request.getContextPath() %>/image/알림.png">
				</div>
				<% } %>
			</div>
			<div id="top-right">
				<% if((loginUser) == null){ %>
				<button class="top-right" onclick="location.href='<%= request.getContextPath() %>/views/main/ultaryLoginMain.jsp'">로그인</button>
				<% } else{ %>
				<div id="member"><%= loginUser.getNickname() %></div>
				<div id="nim">님</div>
				<button class="top-right" onclick="location.href='<%= request.getContextPath() %>/logout.me?page=main'">로그아웃</button>
				<% } %>
			</div>
		</div>
		<div id="bottom-header">
			<div id="bottom-header-wrap">
				<div id="logeleft1"></div>
				<div id="logoleft2"></div>
				<div id="logo">
					<a href='<%= request.getContextPath() %>/views/main/main.jsp'><img id="logoimg" src="<%= request.getContextPath() %>/image/logo.png"></a>
				</div>
			</div>
		</div>
		<div id="category">
			<div id='cssmenu'>
					<ul>
						<li>
							<a>내울타리</a>
							<ul id="menu1">
								<li>
									<a>타임라인</a>
								</li>
								<li><a>게시글작성</a></li>
								<li><a>관심회원</a></li>
								<li><a>게시글 즐겨찾기</a></li>
								<li><a>내 위탁환경</a></li>
							</ul>
						</li>
						<li>
							<a>커뮤니티</a>
							<ul id="menu2">
								<li><a>공지사항</a></li>
								<li><a>모아보기</a></li>
								<li><a>펫일상</a></li>
								<li><a>펫지식</a></li>
								<li><a>펫리뷰</a></li>
								<li><a>펫분양</a></li>
							</ul>
						</li>
						<li><a href='#'>위탁매칭</a>
							<ul id="menu3">
								<li><a href='<%= request.getContextPath() %>/views/common/commonheader.jsp'>위탁검색</a></li>
								<li><a href='#'>의뢰 관리</a></li>
								<li><a href='#'>내가 남긴 리뷰</a></li>
							</ul>
						</li>
						<li><a href='#'>마이페이지</a>
							<ul id="menu4">
								<li><a href='#'>내 정보 관리</a></li>
								<li><a href='#'>비밀번호변경</a></li>
								<li><a href='#'>회원 탈퇴</a></li>
							</ul>
						</li>
						<li><a href='#'>고객센터</a>
							<ul id="menu5">
								<li><a href='#'>공지 사항</a></li>
								<li><a href='#'>자주하는 질문</a></li>
								<li><a href='#'>1:1 문의</a></li>
							</ul>
						</li>
					</ul>
				</div>
		</div>
	</header>
<script>
	<% if((loginUser) == null){ %>
	$('#cssmenu>ul a').click(function(){
		window.alert('로그인을 해주세요.');
	});
	<% } else{ %>
	$('#cssmenu>ul>li:eq(0)>a').click(function(){
		location.href="<%= request.getContextPath() %>/post.tl";
	});
	$('#menu1>li:eq(0) a').click(function(){
		location.href="<%= request.getContextPath() %>/post.tl";
	});
	$('#menu1>li:eq(1) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/postWrite.jsp";
	});
	$('#menu1>li:eq(2) a').click(function(){
		location.href="<%= request.getContextPath() %>/markmember.mem";
	});
	$('#menu1>li:eq(3) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/markPost.jsp";
	});
	$('#menu1>li:eq(4) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/trustEvm.jsp";
	});
	$('#cssmenu>ul>li:eq(1)>a').click(function(){
		location.href="<%= request.getContextPath() %>/cmnotice.po";
	});
	$('#menu2>li:eq(0) a').click(function(){
		location.href="<%= request.getContextPath() %>/cmnotice.po";
	});
	$('#menu2>li:eq(1) a').click(function(){
		location.href="<%= request.getContextPath() %>/cmAllList.po";
	});
	$('#menu2>li:eq(2) a').click(function(){
		location.href="<%= request.getContextPath() %>/cmdlist.po";
	});
	$('#menu2>li:eq(3) a').click(function(){
		location.href="<%= request.getContextPath() %>/cmklist.po";
	});
	$('#menu2>li:eq(4) a').click(function(){
		location.href="<%= request.getContextPath() %>/cmrlist.po";
	});
	$('#menu2>li:eq(5) a').click(function(){
		location.href="<%= request.getContextPath() %>/cmrelist.po";
	});
	$('#cssmenu>ul>li:eq(2)>a').click(function(){
		location.href="<%= request.getContextPath() %>/views/trustMatch/matching01.jsp";
	});
	$('#menu3>li:eq(0) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/trustMatch/matching01.jsp";
	});
	$('#cssmenu>ul>li:eq(4)>a').click(function(){
		location.href="<%= request.getContextPath() %>/slist.no";
	});
	$('#menu5>li:eq(0) a').click(function(){
		location.href="<%= request.getContextPath() %>/slist.no";
	});
	$('#menu5>li:eq(1) a').click(function(){
		location.href="<%= request.getContextPath() %>/faq.sv";
	});
	$('#menu5>li:eq(2) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/support/InquirySend.jsp";
	});
	<% } %>
</script>
	
	<div id="search">
		<div id="search-wrap">
			<div id="search-left"></div>
			<select id="searchselect">
				<option>회원</option>
				<option>게시글</option>
			</select>
			<input id="searchtext" type="search" placeholder="검색">
			<input id="searchbutton" type="submit" value="검색">
		</div>
	</div>
	<section>
		<div id="section-wrap">
		<% if(!mList.isEmpty()){ %>
			<% for(int i=0;i<mList.size();i++){ 
					Member m = mList.get(i); %>
			<div class="memdiv">
				<div class="memintro">
					<div id="memimg<%= i %>" class=memimg><img src="<%= request.getContextPath() %>/image/프로필.png"></div>
					<div id="memnick<%= i %>" class="memnick"><%= m.getNickname() %></div>
				</div>
				<div class="memlike">
					<div><%= m.getMarkscore() %> MARK</div>
				</div>
				<div class="memgender"><%= m.getGender() %></div>
			</div>
<script>
	$(function(){
		var memimg = "#memimg"+<%= i %>;
		var memnick = "#memnick"+<%= i %>;
		
		$(memimg).click(function(){
			location.href = "<%= request.getContextPath() %>/otherpost.tl?nickname=<%= m.getNickname()%>";
		});
		$(memnick).click(function(){
			location.href = "<%= request.getContextPath() %>/otherpost.tl?nickname=<%= m.getNickname()%>";
		});
	});
</script>
			<% } %>
		<% } else{ %>
			<h1>검색결과가 없습니다.</h1>
		<% } %>
		</div>
		
	</section>
	<footer>제작 : 한호성</footer>	
</body>
</html>