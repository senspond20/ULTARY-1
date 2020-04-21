<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 비밀번호 찾기</title>

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
		<form id=find_Pwd action="<%= request.getContextPath() %>/views/main/findMember/newPwdForm.jsp" method="post" onsubmit="return validate();">
			<div class="tableArea">
				<h1>이메일로 비밀번호 찾기</h1>
				<hr width=50% color="white">
				<br>
				<table>
					<tr>
						<th style="padding-right:10px;">아이디</th>
						<td>
							<input type="text" id="fine_Pwd_Id" name="fine_Pwd_Id" class="input_find" autofocus style="width: 220px;" required> 
						</td>
					</tr>
					<tr>
						<th style="padding-right:10px;">이메일</th>
						<td>
							<input type="text" id="email_1" name="email_1" class="input_find" style="width: 100px;" required>@<input type="text" id="email_2" name="email_2" class="input_find" style="width: 100px;" disabled> 
							<select id="selectEmail" name="selectEmail" class="input_find" style="width: 100px; margin-right: 10px" required>
									<option Selected disabled value="">::선택하세요::</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="1">직접입력</option>
							</select> 
						</td>
						<td>
							<input type="button" value="메일인증" id="sendChkEmail" onclick="sendMail();">
							<img id="emailResult_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
							<img id="emailResult_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>	
						<th style="padding-right:10px;">인증 번호 확인</th>
						<td>
							<input type="text" id="email_Confirm" name="email_Confirm" class="member" placeholder="인증번호를 입력하세요." required>
							<input type="button" value="인증확인" id="chkNum">
							<img id="emailChkResult_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
							<img id="emailChkResult_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
						</td>
					</tr>
				</table>
				<br>
				<hr width=50% color="white">
				<br>
					<button type=submit id="loginBtn_normal" class="loginBtn">확인</button>
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
					<td><div class="footer_link" onclick="gofindId();">아이디 찾기</div></td>
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
	
	/*이메일 중복 확인메일 발송  */
	var ismailUsable = false; 
	
	$('#email_1,#email_2').on('paste keyup', function(){
		var ismailUsable = false; 
	});
	
	function sendMail(){
		var userId = $('#fine_Pwd_Id'); 
		
		var email_1 = $('#email_1'); 
		var email_2 = $('#email_2'); 
		var email = email_1.val() + '@' + email_2.val();
		
		var email_Confirm =$('#email_Confirm');
		
		$.ajax({  //이메일, 아이디가 중복되는지 확인 ->FindPwdEmailServlet
			url: '<%= request.getContextPath() %>/findPwdEmail.mem',
			data: {email:email, userId:userId.val()},
			success: function(data){
			
				
				if(userId.val() != "" && email_1.val() != "" && email_2.val() != null && data == 'success'){ //중복아니라면 success =>인증메일 발송 가능
					
					$.ajax({ //<메일 보내기 서블릿 >
						url: '<%= request.getContextPath() %>/send.do',
						data: {email:email},
						success: function(data2){ //data1는 랜덤키
							alert('입력하신 이메일로 인증메일이 발송되었습니다.');
							
							if($('#emailResult_check').css("display")=="none"){ //파란버튼
						 		$('#emailResult_check').show();
						 		$('#emailResult_checked').hide();
							}
							
							$('#chkNum').click(function(){ //인증확인 버튼을 눌렀을 때
								if(data2.trim() == email_Confirm.val().trim()){ //인증번호와 사용자 입력이 일치하면
									ismailUsable = true;
									if($('#emailChkResult_check').css("display")=="none"){ //파란버튼
								 		$('#emailChkResult_check').show();
								 		$('#emailChkResult_checked').hide();
									}
								} else {  //인증번호와 사용자 입력이 일치하지않으면
									ismailUsable = false;
									alert('인증번호가 일치하지 않습니다.');
									email_Confirm.select();
									
									if($('#emailChkResult_checked').css("display")=="none"){ //빨간버튼
								 		$('#emailChkResult_checked').show();
								 		$('#emailChkResult_check').hide();
									}
								}
							})
						}
					});
						
				} else{ //아이디나 이메일이 같은 회원이 없음.
					alert('등록되지 않은 아이디나 이메일은 사용할 수 없습니다.');
					userId.select();
					ismailUsable = false;
					
					if($('#emailResult_checked').css("display")=="none"){ //빨간버튼
				 		$('#emailResult_checked').show();
				 		$('#emailResult_check').hide();
					 }
				}
			}
			
		});
		
	};

	/* 이메일 인증번호 안적었는데 인증확인 먼저 눌렀을때 */
	$('#chkNum').click(function(){
		var email_Confirm = $('#email_Confirm');	
	
		if(email_Confirm.val() == ""){
			alert('인증번호를 입력하여 주시기 바랍니다.');
			email_Confirm.focus();
			if($('#emailChkResult_checked').css("display")=="none"){
		 		$('#emailChkResult_checked').show();
		 		$('#emailChkResult_check').hide();
			}
		}
	});
		
	/* 메일인증 안하고 가입하기 눌렀을때 */
	function validate(){
		if(ismailUsable){
			return true; //새비번입력창으로
		}else{
			alert('메일인증을 진행해주세요.');
			email_Confirm.focus();
			return false; //반려
		}
	}
	
//------------------------------------------------------------------------------------------------------------			
	
	function goNotice(){ // 공지사항으로 이동
		location.href='<%= request.getContextPath() %>/#';
	}
	function goUltaryLoginMain(){ //로그인으로 이동
		location.href='<%= request.getContextPath() %>/views/main/ultaryLoginMain.jsp';
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