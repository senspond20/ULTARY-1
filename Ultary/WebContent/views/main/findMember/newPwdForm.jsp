<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String memberId = request.getParameter("memberId");
	String email = request.getParameter("email");
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 새 비밀번호</title>
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
		<form action="<%= request.getContextPath() %>/findPwdUpdate.mem" id=find_Pwd name=find_Pwd method="post" onsubmit="return validate();">
			<div class="tableArea">
				<h1>새 비밀번호 설정</h1>
				<hr width=30% color="white">
				<br>
				<table>
					<tr>
						<th class="new_password">새 비밀번호</th>
						<td>
							<input type="password" id="fine_newPwd" name="fine_newPwd" class="input_find" placeholder="새 비밀번호 입력" autofocus required>
							<img id="fine_newPwdd_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
							<img id="fine_newPwd_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th class="new_password">새 비밀번호 확인</th>
						<td>
							<input type="password" id="fine_newPwd_Confirm" name="fine_newPwd_Confirm" class="input_find" placeholder="새 비밀번호 확인" required>
							<img id="fine_newPwd_Confirm_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
							<img id="fine_newPwd_Confirm_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
						</td>
					</tr>
				</table>
				<br>
				<!-- 업데이트하기 위해 히든으로 숨겨줌 -->
				<input type="hidden" name="memberId" value="<%= memberId %>">
				<input type="hidden" name="email" value="<%= email %>">
				<input type="hidden" name="email" value="고쳐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!고쳐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!">
				<input type="hidden" name="email" value="고쳐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!고쳐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!">
				<button type=submit id="loginBtn_normal" class="loginBtn">변경하기</button>
				<br>
				<br>
				<hr width=30% color="white">
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
					<td><div class="footer_link" onclick="gofindId();">아이디 찾기</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="gomemberJoin();">회원가입</div></td>
				</tr>
			</tbody>
		</table>
	</footer>
<!---- 풋터 끝 --------------------------------------------------------------------->											
	<script>
	
	/* 비밀번호 유효성 검사 ajax 중복불가 */		
	var ispassUsable = false;
	var ispassChecked = false;
	var re = /^[a-zA-Z\d]{7,11}$/; 
	var password = $('#fine_newPwd');
	var password2 = $('#fine_newPwd_Confirm');
	
	$("#fine_newPwd, #fine_newPwd_Confirm").on('change paste keyup', function(){
		ispassChecked = false;
		ispassChecked = false;
	});
	
	$('#fine_newPwd').change(function(){ //패스워드 1만 정규식 체크 후 
		if(!re.test(password.val())){
			alert('비밀번호는 영문 7~11자리 이어야 합니다.');
			password.focus();
			ispassUsable = false;
			
			if($('#fine_newPwd_checked').css("display")=="none"){ //반려
		 		$('#fine_newPwd_checked').show();
		 		$('#fine_newPwdd_check').hide();
			}
		} else {
			
			ispassUsable = true;
			if($('#fine_newPwdd_check').css("display")=="none"){ //허가
		 		$('#fine_newPwdd_check').show();
		 		$('#fine_newPwd_checked').hide();
			}
		}
	});
	
	//패스워드 1과 패스워트 2 동일한지 검사.
	$('#fine_newPwd_Confirm').keyup(function(){
		if(password.val() == password2.val()){
			ispassChecked = true;
			
			if($('#fine_newPwd_Confirm_check').css("display")=="none"){ //허가
		 		$('#fine_newPwd_Confirm_check').show();
		 		$('#fine_newPwd_Confirm_checked').hide();
			 	}
			
		}else{
			password2.focus();
			ispassChecked = false;
			
			if($('#fine_newPwd_Confirm_checked').css("display")=="none"){ //반려
		 		$('#fine_newPwd_Confirm_checked').show();
		 		$('#fine_newPwd_Confirm_check').hide();
			}
			
		}
	});
	
	/* 메일인증 안하고 가입하기 눌렀을때 */
	function validate(){
		if(ispassUsable && ispassChecked){
			return true; //비번 업데이트!
		}else{
			alert('새 비밀번호를 다시 확인하여 주시기 바랍니다.');
			password.focus();
			return false; //반려
		}
	}
	
	function goNotice(){ // 공지사항으로 이동
		location.href='<%= request.getContextPath() %>/#';
	}
	function goUltaryLoginMain(){ //로그인으로 이동
		location.href='<%= request.getContextPath() %>/views/main/ultaryLoginMain.jsp'
	}
	function gofindId(){ //아이디 찾기로 이동
		location.href='<%= request.getContextPath() %>/views/main/findMember/findIdForm.jsp';
	}
	function gomemberJoin(){ //회원가입으로 이동
		location.href='<%= request.getContextPath() %>/views/main/memberJoinForm.jsp';
	}
	
	</script>

</body>
</html>