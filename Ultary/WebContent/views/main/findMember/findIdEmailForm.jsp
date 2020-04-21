<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일로 아이디 찾기</title>
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
		<form id=find_Id action="<%= request.getContextPath() %>/findidemail.mem" method="post" onsubmit="return validate();">
			<div class="tableArea">
				<h1>이메일로 아이디 찾기</h1>
				<hr width=40% color="white">
				<br>
				<table>
					<tr>
						<th style="padding-right:10px;">이름</th>
						<td>
							<input type="text" id="fine_ID_Name" name="fine_ID_Name" class="input_find" autofocus style="width: 220px;" required>
						</td>
						
					</tr>
					<tr>
						<th style="padding-right:10px;">이메일</th>
						<td>
<!-- 					<input type="email" id="fine_ID_Email" name="fine_ID_Email" class="input_find" placeholder="이메일"> -->
							<input type="text" id="email_1" name="email_1" class="input_find" style="width: 100px;" required>@<input type="text" id="email_2" name="email_2" class="input_find" style="width: 100px;" disabled> 
							<select id="selectEmail" name="selectEmail" class="input_find" style="width: 100px; margin-right: 10px">
									<option value="">::선택하세요::</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="1">직접입력</option>
							</select> 
						</td>
					</tr>
				</table>
				<br>
				<hr width=40% color="white">
				<br>
					<button type=submit id="loginBtn_normal" class="loginBtn">아이디 찾기</button>
				<br>
				<br>
				<br>
			</div>
		</form>
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
		
		/* 이메일 입력방식  */
		$('#selectEmail').change(function() {
			$("#selectEmail option:selected").each(function() {
				if ($(this).val() == '1') { //직접입력일 경우 
					$("#email_2").val(''); //값 초기화 
					$("#email_2").attr("disabled", false); //활성화 
				} else { //직접입력이 아닐경우 
					$("#email_2").val($(this).text()); //선택값 입력 
					$("#email_2").attr("disabled", false); //비활성화 
				}
			});
		});
		
		
		
		function validate(){ //모든항목 true 여야함, 빈칸없이.
			var check1 = $('#fine_ID_Name').val();
			var check2 = $('#email_1').val();
			var check3 = $('#selectEmail').val();
			
			if($('#selectEmail').val()==""){
				alert('모든 항목을 입력해주세요.');
				return false;
			}
			
			if(check1 != "" && check2 != "" && check3 != ""){
				return true;
			}else{
				alert('모든 항목을 입력해주세요.');
				return false;
			}
		}
		
// 		var isIdChecked = false;	// 아이디 중복확인을 했는지 안했는지 검사
// 			if(isUsable && isIdChecked){
// 				return true;
// 			}else{
// 				alert('아이디를 중복확인해 주세요');
// 				return false;
// 			}
		
		
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