<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
 
<!--네이버 로그인 전용 임포트  -->    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>    
    
<%
	Member loginMember = (Member)session.getAttribute("loginUser");
	System.out.println(loginMember); //null이면 로그인을 안한것 null이 아니면 로그인 한것
	String msg = (String)request.getAttribute("msg"); // 그리고 나서 서버에 나타나게 해줘야함
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 로그인</title>

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
			<form id="loginForm" action="<%= request.getContextPath() %>/login.mem" method="post" onsubmit="return loginvalidate();">
				<div class="tableArea">
					<h1 align="center">로그인</h1>
						<hr width=50% color="white">
						<br>
							<table>
								<tr>
									<td><input type="text" id="memberid" name="memberid" class="input_login" placeholder="아이디" autofocus required></td>
								</tr>
								<tr>
									<td><input type="password" id="password" name="password" class="input_login" placeholder="비밀번호" required></td>
								</tr>
								<tr>
									<td><button type=submit id="loginBtn_normal" class="loginBtn" value="로그인">로그인</button></td>
								</tr>
<!----네이버 로그인 연동 시작--------------------------------------------------------------------->
							 <%
							 	String clientId = "I5f2j4CStj0Q0BPbHYAM";//애플리케이션 클라이언트 아이디값";
							    String redirectURI = URLEncoder.encode("http://localhost:8866/ULTARY/views/main/callback.jsp", "UTF-8");
							    SecureRandom random = new SecureRandom();
							    String state = new BigInteger(130, random).toString();
							    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							    apiURL += "&client_id=" + clientId;
							    apiURL += "&redirect_uri=" + redirectURI;
							    apiURL += "&state=" + state;
							    session.setAttribute("state", state);
							 %>
								<tr>
									<td>
								<!-- 	<button type=button id="loginBtn_naver" class="loginBtn" onclick="location.href='/controller/naverlogin.do';" >네이버 계정으로 로그인</button> -->
				<!--네이버 계정으로 로그인 버튼  --><a href="<%=apiURL%>"><img height="30px" width="200px" class="loginBtn" src="<%= request.getContextPath() %>/image/네이버 아이디로 로그인_완성형_White.PNG"/></a>
									</td>
								</tr>
<!----네이버 로그인 연동 끝--------------------------------------------------------------------->								
							</table>
							<br>
							<hr width=50% color="white">
						<br>
				</div>
			</form>
	</section>
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
	
// 		/* 유효성 검사*/
// 		var isidUsable = false; 	// 아이디 중복 시false, 사용가능시 true
// 		var ispasswordUsable = false;	// 아이디 중복확인을 했는지 안했는지 검사
		
// 		$("#memberid").on('change paste keyup', function(){
// 			isidUsable = false; 
// 		});
		
// 		$("#password").on('change paste keyup', function(){
// 			ispasswordUsable = false;
// 		});
		
// 		$('#memberid, #password').change(function(){
// 			var userId = $('#memberid');
// 			var password = $('#password');
			
			
// 				$.ajax({
<%-- 					url:'<%= request.getContextPath() %>/login.mem', --%>
// 					data:{userId: userId.val(), password: password.val()},
// 					success: function(data){ 
// 					//success = 회원 있음 / fail = 회원 없음
						
// // 						if(data == "fail"){
// // 							isIdChecked = false;
// // 							ispasswordUsable = false;
// // 							alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
// // 						}
// 					}
					
// 				})
// 		};
		
		function loginvalidate(){
			if($('#userId').val().trim().length==0){
				alert('아이디를 입력해주세요');
				$('#userId').focus();
				return false;
			}
			
			if($('#userPwd').val().trim().length==0){
				alert('비밀번호를 입력해주세요.');
				$('#userPwd').focus();
				return false;
			}
			var userId = $('#memberid');
			var password = $('#password');
			if(userId != null && password != null){
				alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
				return false;
			}
			return true;
		}
		
		
		function logout(){ //로그아웃
			location.href="<%= request.getContextPath() %>/logout.mem";
		}
		function goNotice(){ // 공지사항으로 이동
			location.href='<%= request.getContextPath() %>/#';
		}
		function gofindId(){ //아이디 찾기로 이동
			location.href='<%= request.getContextPath() %>/views/main/findMember/findIdForm.jsp';
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