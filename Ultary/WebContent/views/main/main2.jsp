<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet"  href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
</head>
<body>
	<div class="alert">
		<div id="alerttitle">전체알림</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div class="alertcontentdiv">
			<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
			<div class="alertclose">&nbsp;&nbsp;X</div>
		</div>
		<div id="alertspace"></div>
	</div>
<script>
	$("body").click(function(e){
		if($('.alert').css('display') == 'block'){
			if(!$('.alert').has(e.target).length) {
				$('.alert').hide();
			}
		} else if($('.alert').css('display') == 'none'){
			if($('#alertbuttondiv').has(e.target).length) {
				$('.alert').show();
			}
		}
	});
</script>
	<div id="chatdiv">
		<div id="chatdivleft">
			<div id="chatdivleft1">
				<img id="individualtalk" src="<%= request.getContextPath() %>/image/갠톡.png">
			</div>
			<div id="chatdivleft2">
				<img id="grouptalk" src="<%= request.getContextPath() %>/image/단체톡.png">
			</div>
		</div>
		<div id="chatdivright">
			<div id="chattitle">울타리 톡</div>
			<div id="chatsearch">
				<div id="chatsearchdiv">
					<img id="chatsearchimg" src="<%= request.getContextPath() %>/image/검색.png">
					<input id="chatsearchtext" type="search" placeholder="검색할 회원이나 채팅방을 입력해주세요.">
				</div>
			</div>
			<div class="chatcontent">
				<div class="chatcontentprofile">
					<div class="chatcontentprofileimg">
						<img class="chatcontentimg" src="<%= request.getContextPath() %>/image/프로필.png">
					</div>
					<div class="chatcontentprofilename">
						닉네임
					</div>
				</div>
				<div class="chatcontentright">
					<div class="chatcontentrightL">
						<div class="chatcontent1">대화내용1</div>
						<div class="chatcontent2">대화내용2</div>
						<div class="chatcontent3">대화내용3</div>
					</div>
					<div class="chatcontentrightR">
						<div class="chatcontentnum">5</div>
						<div class="chatcontentfix">☆</div>
					</div>
				</div>
			</div>
			<div class="chatcontent">
				<div class="chatcontentprofile">
					<div class="chatcontentprofileimg">
						<img class="chatcontentimg" src="image/프로필.png">
					</div>
					<div class="chatcontentprofilename">
						닉네임
					</div>
				</div>
				<div class="chatcontentright">
					<div class="chatcontentrightL">
						<div class="chatcontent1">대화내용1</div>
						<div class="chatcontent2">대화내용2</div>
						<div class="chatcontent3">대화내용3</div>
					</div>
					<div class="chatcontentrightR">
						<div class="chatcontentnum">5</div>
						<div class="chatcontentfix">☆</div>
					</div>
				</div>
			</div>
			<div class="chatcontent">
				<div class="chatcontentprofile">
					<div class="chatcontentprofileimg">
						<img class="chatcontentimg" src="image/프로필.png">
					</div>
					<div class="chatcontentprofilename">
						닉네임
					</div>
				</div>
				<div class="chatcontentright">
					<div class="chatcontentrightL">
						<div class="chatcontent1">대화내용1</div>
						<div class="chatcontent2">대화내용2</div>
						<div class="chatcontent3">대화내용3</div>
					</div>
					<div class="chatcontentrightR">
						<div class="chatcontentnum">5</div>
						<div class="chatcontentfix">☆</div>
					</div>
				</div>
			</div>
			<div class="chatcontent">
				<div class="chatcontentprofile">
					<div class="chatcontentprofileimg">
						<img class="chatcontentimg" src="image/프로필.png">
					</div>
					<div class="chatcontentprofilename">
						닉네임
					</div>
				</div>
				<div class="chatcontentright">
					<div class="chatcontentrightL">
						<div class="chatcontent1">대화내용1</div>
						<div class="chatcontent2">대화내용2</div>
						<div class="chatcontent3">대화내용3</div>
					</div>
					<div class="chatcontentrightR">
						<div class="chatcontentnum">5</div>
						<div class="chatcontentfix">☆</div>
					</div>
				</div>
			</div>
			<div class="chatcontent">
				<div class="chatcontentprofile">
					<div class="chatcontentprofileimg">
						<img class="chatcontentimg" src="<%= request.getContextPath() %>/image/프로필.png">
					</div>
					<div class="chatcontentprofilename">
						닉네임
					</div>
				</div>
				<div class="chatcontentright">
					<div class="chatcontentrightL">
						<div class="chatcontent1">대화내용1</div>
						<div class="chatcontent2">대화내용2</div>
						<div class="chatcontent3">대화내용3</div>
					</div>
					<div class="chatcontentrightR">
						<div class="chatcontentnum">5</div>
						<div class="chatcontentfix">☆</div>
					</div>
				</div>
			</div>
			<div class="chatcontent">
				<div class="chatcontentprofile">
					<div class="chatcontentprofileimg">
						<img class="chatcontentimg" src="<%= request.getContextPath() %>/image/프로필.png">
					</div>
					<div class="chatcontentprofilename">
						닉네임
					</div>
				</div>
				<div class="chatcontentright">
					<div class="chatcontentrightL">
						<div class="chatcontent1">대화내용1</div>
						<div class="chatcontent2">대화내용2</div>
						<div class="chatcontent3">대화내용3</div>
					</div>
					<div class="chatcontentrightR">
						<div class="chatcontentnum">5</div>
						<div class="chatcontentfix">☆</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$("body").click(function(e){
		if($('#chatdiv').css('display') == 'block'){
			if(!$('#chatdiv').has(e.target).length) {
				$('#chatdiv').hide();
			}
		} else if($('#chatdiv').css('display') == 'none'){
			if($('#chatbtn').has(e.target).length) {
				$('#chatdiv').show();
			}
		}
	});
</script>
	<div id="expansion">
		<div id="expansionIn">
			<div id="expansiontop">
				<div id="expansionL">
					<img id="mainimg"src="<%= request.getContextPath() %>/image/1.png">
				</div>
				<div id="expansionR">
					<div id="expansionexit">X</div>
					<div id="expansionRheader">
						<div id="expansionWriter">
							<img id="expansionimg" src="<%= request.getContextPath() %>/image/프로필.png">
							<span id="expansionWri">닉네임</span>
						</div>
						<div id="expansiondate">게시일 | 2020. 03. 29 (SUN) 17:55</div>
					</div>
					<div id="expansionRsection">
						<div id="expansionTitle">Title | 제목<hr></div>
						<div id="expansioncontent">
							내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
							내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
							내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
							<hr>
						</div>
						<div id="expansioncomment">
							<div class="comment">댓글</div>
								<div class="commentans">답글</div>
								<div class="commentans">답글</div>
								<div class="commentans">답글</div>
								<div class="commentans">답글</div>
							<div class="comment">댓글</div>
							<div class="comment">댓글</div>
							<div class="comment">댓글</div>
							<div class="comment">댓글</div>
							<div class="comment">댓글</div>
							<div class="comment">댓글</div>
							<div class="comment">댓글</div>
							<div class="comment">댓글</div>
						</div>
					</div>
				</div>
			</div>
			<div id="expansionbottom">
				<div class="expansionbox">카테고리</div>
				<div id="petlife">펫 일상</div>
				<div class="expansionbox">관심글 등록</div>
				<div id="like">♡</div>
				<div class="expansionbox">222 like</div>
				<img id="likeimg" src="<%= request.getContextPath() %>/image/좋아요.png">
				<div id="commenttextdiv">
					<input id="commenttext" type="text" placeholder="내용을 입력해주세요">
					<input id="commentsubmit" type="submit" value="댓글달기">
				</div>
			</div>
		</div>
	</div>
<script>
	$("body").click(function(e){
		if($('#expansion').css('display') == 'block'){
			if(!$('#expansion').has(e.target).length) {
				$('#expansion').hide();
			}
		} else if($('#expansion').css('display') == 'none'){
			if($('.exBtn').has(e.target).length) {
				$('#expansion').show();
			}
		}
	});
</script>
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
					<a><img id="logoimg" src="<%= request.getContextPath() %>/image/logo.png"></a>
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
<script>
	<% if((loginUser) == null){ %>
	$('#cssmenu>ul a').click(function(){
		window.alert('로그인을 해주세요.');
	});
	<% } else{ %>
	$('#cssmenu>ul>li:eq(0)>a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/ultaryMain.jsp";
	});
	$('#menu1>li:eq(0) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/ultaryMain.jsp";
	});
	$('#menu1>li:eq(1) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/postWrite.jsp";
	});
	$('#menu1>li:eq(2) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/markMember.jsp";
	});
	$('#menu1>li:eq(3) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/markPost.jsp";
	});
	$('#menu1>li:eq(4) a').click(function(){
		location.href="<%= request.getContextPath() %>/views/myUltary/trustEvm.jsp";
	});
	<% } %>
</script>
						
						<li>
							<a href='#'>커뮤니티</a>
							<ul id="menu2">
								<li><a href='#'>공지사항</a></li>
								<li><a href='#'>모아보기</a></li>
								<li><a href='#'>펫일상</a></li>
								<li><a href='#'>펫지식</a></li>
								<li><a href='#'>펫리뷰</a></li>
								<li><a href='#'>펫분양</a></li>
							</ul>
						</li>
						<li><a href='#'>위탁매칭</a>
							<ul id="menu3">
								<li><a href='#'>위탁검색</a></li>
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
								<li><a href='<%= request.getContextPath() %>/slist.no'>공지 사항</a></li>
								<li><a href='<%= request.getContextPath() %>/faq.sv'>자주하는 질문</a></li>
								<li><a href='<%= request.getContextPath() %>/views/support/InquirySend.jsp'>1:1 문의</a></li>
							</ul>
						</li>
					</ul>
				</div>
		</div>
	</header>
	
	<section>
		<div id="mainleft">
			<img class="arrow" src="<%= request.getContextPath() %>/image/왼쪽 화살표.png">
		</div>
		<div id="mainright">
			<img class="arrow" src="<%= request.getContextPath() %>/image/오른쪽 화살표.png">
		</div>
		<div id="main">
			<ul id="slider" class="slider">
                <li class="item1">
                </li>
                <li class="item2">
                </li>
                <li class="item3">
                </li>
                <li class="item4">
                </li>
                <li class="item5">
                </li>
                <li class="item6">
                </li>
            </ul>
		</div>
<script>
	$(document).ready(function() {
   		$("#slider").lightSlider({
			mode:'slide',    // 이미지가 표시되는 형식 (fade / slide)
   	     	loop:true,       // 무한반복 할 것인지
   	    	auto:true,       // 자동 슬라이드
   	     	keyPress:true,   // 키보드 탐색 허용
   	     	pager:false,     // 페이지 표시
   	     	speed:1500,      // 슬라이드 되는 속도
   	     	pause:3000       // 이미지가 머무는 시간
   	 	});
	});
</script>
	</section>
	
	<div id="search">
		<div id="search-wrap">
			<div id="search-left"></div>
			<input id="searchtext" type="search" placeholder="검색">
			<input id="searchbutton" type="submit" value="검색">
		</div>
	</div>
	
	<article>
		<div id="articlewrap">
			<div id="article1" class="article">
				<div class="articleTitle">공지사항</div>
				<div class="articlecontent">
					<div class="articleinner">
						<ul>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="article2" class="article">
				<div class="articleTitle">최신글</div>
				<div class="articlecontent">
					<div class="articleinner">
						<ul>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="article3" class="article">
				<div class="articleTitle">인기글</div>
				<div class="articlecontent">
					<div class="articleinner">
						<ul>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="article4" class="article">
				<div class="articleTitle">반려동물 행사</div>
				<div class="articlecontent">
					<div class="articleinner">
						<ul>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</article>
	<footer>제작 : 한호성</footer>	
</body>
</html>