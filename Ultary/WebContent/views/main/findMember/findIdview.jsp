<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    
<%
// 	Member findId1 = (Member)request.getAttribute("findId1");
// 	if(request.getAttribute("findId1") != null){
// 		String findId1 = (String)request.getAttribute("findId1");
// 	}else if(request.getAttribute("findId2") != null){
// 		String findId2 = (String)request.getAttribute("findId2");
// 	}
	String findId1 = (String)request.getAttribute("findId1");
	System.out.println("뷰에서 뽑아보는 이메일 아이디 찾기: "+findId1);
	String findId2 = (String)request.getAttribute("findId2");
	System.out.println("뷰에서 뽑아보는 전화번호 아이디 찾기: "+findId2);
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일로 아이디 찾기 결과</title>
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
			<form id=find_Id>
				<h1>아이디 찾기 조회결과</h1>
				<hr width=40% color="white">
				<br>
				<table>
					<tr>
 					<% if(findId1 != null){ %>
						<th style="padding-right:10px;">조회된 아이디</th>
						<td>
							<label id="findResult"><%= findId1 %></label>
						</td>	
						<% }else if(findId2 != null){ %>
						<th style="padding-right:10px;">조회된 아이디</th>
						<td>
							 <label id="findResult"><%= findId2 %></label>
						</td>
						<% }else { %>
						<td>
							 <label>조회된 아이디가 없습니다.</label>
						</td>
						<% } %>
					</tr>
				</table>
				</form>
				<br>
				<hr width=40% color="white">
				<br>
					<button id="loginBtn_normal" class="loginBtn" onclick="goUltaryLoginMain();">로그인하러 가기</button>
				<br>
				<br>
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
		
// 		$(function(){
// 			var findId1 = findId1
// 			console.log(findId1);
// 			if(findId1 != null){
// 				$('#findResult').text(findId1);
// 			}
// 		});
		
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