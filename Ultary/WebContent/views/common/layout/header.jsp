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
<title>Insert title here</title>
<style>

/* 헤더 */

header{
	width:100%;
	min-width:1200px;
	height:241px;
}
#top-header{
	height:40px;
	width:100%;
	min-width:1200px;
	overflow: hidden;
}
#top-left{
	overflow: hidden;
	height:100%;
	float:left;
}
.top-button{
	overflow: hidden;
	margin-top:5px;
	margin-left:10px;
	height:30px;
	width:30px;
	float:left;
}
.top-buttonimg{
	height:100%;
	width:100%;
	cursor: pointer;
}
#top-right{
	overflow: hidden;
	height:100%;
	float:right;
	width:240px;
}
#proimgdiv{
	margin-left: 150px;
	margin-top: 5px;
	margin-right: 5px;
	float:left;
	width:30px;
	height:30px;
}
#proimg{
	width: 100%;
	height: 100%;
	border-width: 0;
	border-radius: 10px;
	cursor: pointer;
}
#member{
	margin-top: 4px;
	float:left;
	font-size:25px;
	color: red;
	text-align: right;
    width: 90px;
}
#nim{
	margin-top: -3.5px;
	margin-left: 5px;
	float:left;
	font-size: 35px;
}
.top-right{
	float:right;
	margin-top:6px;
	margin-right: 5px;
	width: 80px;
	height: 30px;
	font-size:11px;
	font-weight:bold;
	color:white;
	background-color: #FFDC6C;
	border-width: 0;
	border-radius: 10px;
	cursor: pointer;
}

/* -----헤더 밑에---------------------------------------- */

#bottom-header{
	height:160px;
	width:100%;
	min-width:1200px;
	overflow: hidden;
}
#bottom-header-wrap{
	width:1060px;
	margin:0 auto;
	height:100%;
	overflow: hidden;
}
#logoleft2{
	float:left;
	width:396.1px;
	height:100%;
	overflow: hidden;
}
#logo{
	float:left;
	width:230px;
	height:100px;
	margin-top: 30px;
}
#logoimg{
	display:inline;
	margin-left:70px;
	width:130px;
	height:100px;
	cursor: pointer;
}

</style>

</head>
<body>


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
</header>

</body>
</html>