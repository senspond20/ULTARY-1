<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/myUltary/chat.css">
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

			
</body>
</html>