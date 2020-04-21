<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript" src= "<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<!-- user style -->
<link rel= "stylesheet" href="<%= request.getContextPath() %>/css/ultaryLogin.css" type="text/css">

</head>
<body>

<!----해더 시작--------------------------------------------------------------------->
<!-- 시멘틱 태그 최대한 활용하기 -->
	<header>
			<a href='<%= request.getContextPath() %>/views/main/main.jsp' target="_self">
			<img id="logo" src="<%= request.getContextPath() %>/image/logo.png" width="120px" height="90px" /></a>
	</header>
	
<!----해더 끝--------------------------------------------------------------------->
<!-- nav 생략 -->

<!----테이블 섹션  시작--------------------------------------------------------------------->			
	<section>
		<div class="tableArea">
			<h1 align="center">아이디 찾기</h1>
				<hr width=50% color="white">
				<br>
				<table>
					<tr>
						<td>
							<button id="fineEmail" class="find_link" onclick="location.href='<%= request.getContextPath() %>/views/main/findMember/findIdEmailForm.jsp'">이메일로 아이디 찾기</button>
						</td>
					</tr>
					<tr>
						<td>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							<button id="finePhone" class="find_link" onclick="location.href='<%= request.getContextPath() %>/views/main/findMember/findIdPhoneForm.jsp'">전화번호로 아이디 찾기</button>
						</td>
					</tr>
				</table>
				<br>
				<hr width=50% color="white">
			<br>
		</div>
	</section>
<!----테이블 섹션  끝 --------------------------------------------------------------------->											

<!---- 풋터 시작 --------------------------------------------------------------------->											

	<footer>
		<table id="footer">
			<tbody>
				<tr>
					<td><div class="footer_link" onclick="goNotice();">공지사항</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="goUltaryLoginMain();">로그인</div></td>
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
		
		function goNotice(){ // 공지사항으로 이동
			location.href='<%= request.getContextPath() %>/#';
		}
		function goUltaryLoginMain(){ //로그인으로 이동
			location.href='<%= request.getContextPath() %>/views/main/ultaryLoginMain.jsp'
		}
		function gofindPwd(){ // 비밀번호 찾기로 이동
			location.href='<%= request.getContextPath() %>/views/main/findMember/findPwdForm.jsp';
		}
		function gomemberJoin(){ //회원가입으로 이동
			location.href='<%= request.getContextPath() %>/views/main/memberJoinForm.jsp';
		}
		
		</script>

</body>

</html>