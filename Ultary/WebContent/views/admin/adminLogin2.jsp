<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	//System.out.println(loginUser);
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP&Servlet</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto');

body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-flow: column nowrap;
	justify-content: center;
	overflow-x: hidden;
}

h1 {
	margin: 2em 0 1.5em 0;
}

nav {
	width: 100%;
	display: flex;
	justify-content: center;
	position: relative;
	background: whitesmoke;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

#main-menu {
	background: skyblue;;
}

#main-menu>li {
	float: left;
	position: relative;
}

#main-menu>li>a {
	font-size: 0.85rem;
	color: whitesmoke;
	text-align: center;
	text-decoration: none;
	letter-spacing: 0.05em;
	display: block;
	padding: 14px 36px;
	border-right: 1px solid rgba(0, 0, 0, 0.15);
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
}

#main-menu>li:nth-child(1)>a {
	border-left: 1px solid rgba(0, 0, 0, 0.15);
}

#sub-menu {
	position: absolute;
	background: whitesmoke;
	opacity: 0;
	visibility: hidden;
	transition: all 0.15s ease-in;
}

#sub-menu>li {
	padding: 12px 16px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.15);
}

#sub-menu>li>a {
	color: royalblue;
	text-decoration: none;
}

#main-menu>li:hover {
	background: rgb(7, 148, 167);
}

#main-menu>li:hover #sub-menu {
	opacity: 1;
	visibility: visible;
}

#sub-menu>li>a:hover {
	text-decoration: underline;
}

#intro {
	font-size: 14px;
}

#logo-title {
	margin-top: 50px;
	text-align: center;
}

#logo-title p {
	margin-left: 70px; font-size : 20px;
	font-weight: bold;
	font-size: 20px;
}

#logoimg {
	display: inline;
	margin-left: 70px;
	width: 130px;
	height: 100px;
	cursor: pointer;
}
section{
	width : auto;
	height: 350px;
	margin-top: 50px;
}


</style>
</head>

<body>

	<header>

	<div id ="header-ele">
		<div id="logo-title">
			<img id="logoimg" src="<%=request.getContextPath()%>/image/logo.png">
			<p>관리자 페이지</p>
		</div>
	</div>
	</header>


	<nav role="navigation">
		<ul id="main-menu">
			<li><a href="#">게시판관리</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="subemnu">공지사항(고객센터)</a></li>
					<li><a href="#" aria-label="subemnu">공지사항(커뮤니티)</a></li>
					<li><a href="#" aria-label="subemnu">신고게시판</a></li>
				</ul>

			</li>
			<li><a href="#">회원관리</a></li>
			<li><a href="#">1:1문의처리</a></li>
		</ul>
	</nav>
	
	<section>
		
	<div id ="loginArea">
	<% if(loginUser == null) { %>
		<br>
		<form id ="lognForm" action ="<%=request.getContextPath() %>/admin.login" method = "post" onsubmit ="return validate();">
		<table>
			<tr>
				<td><label>ID : </label></td>
				<td><input type ="text" name ="memberId" id ="memberId"></td>
			</tr>
			<tr>
				<td><label>PWD : </label></td>
				<td><input type ="password" name="password" id="memberPwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<div id ="loginBtn"><br><input type="submit" value ="로그인(관리자)"></div>
				</td>
			</tr>
		</table>
		</form>
	<% } else { %>
	
		<table>
			<tr>
				<td><label>접속한 ID : </label></td>
				<td><%= loginUser.getMemberId() %></td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
		</table>
		<button>로그아웃</button>
		
	<% } %>
	</div>
	</section>
	<script type="text/javascript">
	
	   function validate(){
		if($('#userId').val().trim().length == 0){
			alert('아이디를 입력해주세요');
			$('#userId').focus();
			return false;
		}
		if($('#userPwd').val().trim().length == 0){
			alert('비밀번호를 입력해주세요');
			$('#userPwd').focus();
			return false;
		}
		
		return true;
	   }
	   
		$('#sub-menu li').click(function(){
			alert('관리자로 로그인 하셔야 합니다.');
		});
	
	</script>
</body>
</html>









