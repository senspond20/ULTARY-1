<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member loginMember = (Member)session.getAttribute("loginMember");
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

<!-- user style -->
<link rel= "stylesheet" href="<%= request.getContextPath() %>/css/ultaryLogin.css" type="text/css">


</head>
<body>

<!----해더 시작--------------------------------------------------------------------->
<!-- 시멘틱 태그 최대한 활용하기 -->
	<header>
			<img id="logo" src="<%= request.getContextPath() %>/image/logo.png" width="120px" height="90px"> <!-- 구 id headerimg -->
	</header>
	
<!----해더 끝--------------------------------------------------------------------->
<!-- nav 생략 -->

<!----테이블 섹션  시작--------------------------------------------------------------------->			
	<section><!--  id="section" -->
		<% if(loginMember == null){ %>
			<form id="loginForm" action="<%= request.getContextPath() %>/login.mem" method="post" onsubmit="return validate();">
				<div class="tableArea">
					<h1 align="center">로그인</h1>
						<hr width=50% color="white">
						<br>
							<table>
								<tr>
									<td><input type="text" id="memberid" name="memberid" class="input_login" placeholder="아이디" autofocus></td>
								</tr>
								<tr>
									<td><input type="password" id="password" name="password" class="input_login" placeholder="비밀번호"></td>
								</tr>
								<tr>
									<td><button type=submit id="loginBtn_normal" class="loginBtn" value="로그인">로그인</button></td>
								</tr>
								<tr>
									<td><button type=submit id="loginBtn_kakao" class="loginBtn">카카오톡 계정으로 로그인</button></td>
								</tr>
								<tr>
									<td><button type=submit id="loginBtn_naver" class="loginBtn">네이버 계정으로 로그인</button></td>
								</tr>
							</table>
							<br>
							<hr width=50% color="white">
						<br>
						<br>
				</div>
			</form>
<!----테이블 섹션  끝 --------------------------------------------------------------------->											
			<% } else { %>
				<div id="userInfo" align="center">
					<label><%= loginMember.getNickname() %>님 로그인 성공. 됐고 얼른 세미 프로젝트 완성해주세요.</label>
					<div class="btns"> 
						<div id="byPageBtn" onclick="myPage();">내 정보보기</div> ->울타리 전체메인에서 이동<br>
						<div id="logoutBtn" onclick="logout();">로그아웃</div> ->울타리 전체메인에서 이동
					</div> 
				</div>
			<% } %>
	</section>
<!----테이블 섹션  끝 --------------------------------------------------------------------->											

<!---- 풋터 시작 --------------------------------------------------------------------->											
	
	
	<footer>
		<table id="footer">
			<tbody>
				<tr>
					<td><div class="footer_link" onclick="goNotice();">공지사항</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="gofindId();">아이디 찾기</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="gofindPwd();">비밀번호 찾기</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="gomemberJoin();">회원가입</div></td>
				</tr>
			</tbody>
		</table>
	</footer>
	
<!---- 풋터 끝 --------------------------------------------------------------------->											
	
	
	<script>
		function validate(){
			//제이쿼리 사용해서 표현.
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
		
		var msg = "<%= msg %>";
		//var msg = 'null';
		//var msg = '회원가입에 성공했습니다.';
		$(function(){
			if(msg != 'null'){
				alert(msg);
			}
		});	
	
		function logout(){ //로그아웃
			location.href="<%= request.getContextPath() %>/logout.mem";
		}
		function goNotice(){ // 공지사항으로 이동
			location.href='<%= request.getContextPath() %>/#';
		}
		function gofindId(){ //아이디 찾기로 이동
			location.href='<%= request.getContextPath() %>/views/findId/findIdForm.jsp';
		}
		function gofindPwd(){ // 비밀번호 찾기로 이동
			location.href='<%= request.getContextPath() %>/views/findPwd/findPwdForm.jsp';
		}
		function gomemberJoin(){ //회원가입으로 이동
			location.href='<%= request.getContextPath() %>/views/main/memberJoinForm.jsp';
		}
		
	</script>
</body>
</html>