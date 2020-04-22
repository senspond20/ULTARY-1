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
		</div>
		<div id="proimgdiv">
				<div id="promaindiv">
					<img style="width: 100%; height: 100%" src="<%= request.getContextPath() %>/image/사진변경.png">
				</div>
				<% if(proimgroute != ""){ %>
				<img id="proimg" src="<%= request.getContextPath() %>/uploadFiles/<%= proimgroute %>">
				<% } else{ %>
				<img id="proimg" src="<%= request.getContextPath() %>/image/프로필.png">
				<% } %>
			</div>
	</header>
	<div id="tlhostdiv">
		<div id="tlhost"><%= nickname %></div>
		<div id="tlmark"><div id="tlmark1"><%= markscore %> Follow!!</div></div>
	</div>
<script>
	$(function(){
		$('#tlmark').click(function(){
			var markmem = "<%= nickname %>";
			var memberid = "<%= loginUser.getMemberId() %>";
			$.ajax({
				url: 'markmember.mark',
				data: {markmem:markmem, memberid:memberid},
				success: function(data){
					location.reload();
				}
			});
		});
		<% if(markbl){ %>
		$('#tlmark1').css("background", "gold");
		$('#tlmark1').mouseover(function(){
			$('#tlmark1').css("background", "crimson");
		}).mouseout(function(){
			$('#tlmark1').css("background", "gold");
		});
		<% } else{ %>
		$('#tlmark1').css("background", "crimson");
		$('#tlmark1').mouseover(function(){
			$('#tlmark1').css("background", "gold");
		}).mouseout(function(){
			$('#tlmark1').css("background", "crimson");
		});
		<% } %>
	});
</script>
</body>
</html>