<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	System.out.println(loginMember); //null이면 로그인을 안한것 null이 아니면 로그인 한것
	String msg = (String)request.getAttribute("msg"); // 그리고 나서 서버에 나타나게 해줘야함
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 로그인</title>
<script type="text/javascript" src= "<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
 
<!-- 메뉴 icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
@charset "UTF-8";

/* 페이지 전체 상자 */
body{
	margin: 0px auto;
	width: 100%;
    display: block;
    min-width: 800px;
}
/* 메뉴 버튼, 로고뿐 */
header{
	min-width:800px;
	background: white;
	height: 150px;
	text-align: center;
}
/* 로고크기  */
#logo{
	margin-top: 30px;
} 

/* 좌측 상단 메뉴 버튼 - 사족기능이라고 생각 로그인에 메뉴 필요?*/
#toggleBtn{
    float: left;
    font-size: 33px;
    cursor: pointer;
    padding: 0px 0px 0px 10px;
}

/* 섹션 바탕 하얀색*/
section{
	min-width: 800px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

/* 로그인 메인 */
.tableArea {
	width: 100%;
	height: auto;
	padding-top: 50px;
 	background: rgb(177, 226, 245);
}

table{
	margin: auto;
    line-height: 3;
/*     border: 1px solid balck; */
}

/*로그인 아이디, 비번 입력창 크기 업 */
.input_login{
	height: 25px;
	width: 200px;
	font-size: 14px;
}

/* 로그인 기본 버튼 스타일(파랑색, 둥근테두리) */
.loginBtn{
	height: 30px;
	width: 200px;
	border-radius: 4px;
	border: 0px;
	font-size: 14px;
	font-weight: bold;
	background: rgb(0, 191, 255);
	color: white;
}
/* 버튼 호버 반응 */
.loginBtn:hover{
	height: 35px;
	width: 210px; 
	cursor: pointer;
	background: #0080ff; 
	color: #ffffff; 
	font-weight: bold;
}
</style>
</head>
<body>

<!----해더 시작--------------------------------------------------------------------->
	<header>
			<img id="logo" src="<%=request.getContextPath() %>/image/logo.png" width="120px" height="90px"> <!-- 구 id headerimg -->
	</header>
	

<!----테이블 섹션  시작--------------------------------------------------------------------->			
	<section><!--  id="section" -->
		<% if(loginMember == null){ %>
			<form id="loginForm" action="<%= request.getContextPath() %>/admin.login" method="post" onsubmit="return validate();">
				<div class="tableArea">
					<h1 align="center">관리자로 로그인</h1>
						<hr width=50% color="white">
						<br>
							<table>
								<tr>
									<td><input type="text" id="memberid" name="memberId" class="input_login" placeholder="아이디" autofocus></td>
								</tr>
								<tr>
									<td><input type="password" id="password" name="password" class="input_login" placeholder="비밀번호"></td>
								</tr>
								<tr>
									<td><button type=submit id="loginBtn_normal" class="loginBtn" value="로그인">로그인</button></td>
								</tr>
							</table>
							<br>
							<hr width=50% color="white">
						<br>
						<br>
				</div>
			</form>
										
			<% } else { %>
				<div id="userInfo" align="center">
					<label><%= loginMember.getNickname() %>님 로그인 중</label>
					<div class="btns"> 
						<div id="logoutBtn" onclick="logout();">로그아웃</div>
					</div> 
				</div>
			<% } %>
	</section>
<!----테이블 섹션  끝 --------------------------------------------------------------------->											

	
	<script>
		function validate(){
			if($('#memberid').val().trim().length==0){
				alert('아이디를 입력해주세요.');
				$('#memberid').focus();
			
				return false;
			}
			if($('#password').val().trim().length==0){
				alert('비밀번호를 입력해주세요.');
				$('#password').focus();
				
				return false;
			}
			return true;
		}
		
		function logout(){ //로그아웃
			location.href="<%= request.getContextPath() %>/logout.mem";
		}
		
	</script>
</body>
</html>