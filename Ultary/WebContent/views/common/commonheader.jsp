<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header틀</title>
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/common/commonheader.css">
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
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
			<header>
				<div id="alert-wrap">
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
				<div id="header-top">
					<div id="chatbtn"><img class="headerimg" src="<%= request.getContextPath() %>/image/메신저.png"></div>
					<div id="alertbuttondiv"><img class="headerimg" src="<%= request.getContextPath() %>/image/알림.png"></div>
					<div id="header-topR">
						<div id="nick"><%= loginUser.getNickname() %></div>
						<div id="nim">님</div>
						<button id="logout" class="top-right" onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</button>
					</div>
				</div>
				<div id="header-bottom">
					<a href='<%= request.getContextPath() %>/views/main/main.jsp'><img id="logoimg" src="<%= request.getContextPath() %>/image/logo.png"></a>
				</div>
			</header>
</body>
</html>