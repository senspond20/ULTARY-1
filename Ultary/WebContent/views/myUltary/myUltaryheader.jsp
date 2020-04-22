<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/myUltaryheader.css">
</head>
<body>
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
			<a href='<%= request.getContextPath() %>/views/main/main.jsp'><img id="logimg" src="<%= request.getContextPath() %>/image/logo.png"></a>
			<div id="header-topR">
				<div id="nick"><%= loginUser.getNickname() %></div>
				<div id="nim">님</div>
				<button id="logout" class="top-right" onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</button>
			</div>
		</div>
		<div id="header-bottom">
			<img id="backimg" src="<%= request.getContextPath() %>/image/1.png">
			<div id="ultaryhost"></div>
		</div>
		<div id="proimgdiv">
				<div id="promaindiv">
					<img style="width: 100%; height: 100%" src="<%= request.getContextPath() %>/image/사진변경.png">
				</div>
				<% if(proImg != null){ %>
				<img id="proimg" src="<%= request.getContextPath() %>/uploadFiles/<%= proImg.getWebName() %>">
				<% } else{ %>
				<img id="proimg" src="<%= request.getContextPath() %>/image/프로필.png">
				<% } %>
			</div>
	</header>
	<div id="tlhostdiv">
		<div id="tlhost"><%= loginUser.getNickname() %></div>
	</div>
<script>
	$(function(){
		$('#profileimgdiv').hide();
		
		$('#promaindiv').hover(function(){
			$('#promaindiv').css("opacity", "1");
		}, function(){
			$('#promaindiv').css("opacity", "0");
		});
		<% if(proImg != null){ %>
		$('#promaindiv').click(function(){
			window.open('<%= request.getContextPath() %>/views/myUltary/profilePOPUP.jsp?originImg=<%= proImg.getWebName() %>', '프로필변경', "width=500, height=500, top=200, left=300", true);
		});
		<% } else{ %>
		$('#promaindiv').click(function(){
			window.open('<%= request.getContextPath() %>/views/myUltary/profilePOPUP.jsp?', '프로필변경', "width=500, height=500, top=200, left=300", true);
		});
		<% } %>
	});
</script>
</body>
</html>