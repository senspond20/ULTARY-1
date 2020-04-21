<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script>
		/* 도로명 주소 */
		function goPopup(){ 
			//경로는 시스템에 맞게 수정하여 사용 
			//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
			//호출하게 됩니다. 
			var pop = window.open("popup/jusoPopup.jsp","pop","width=570, height=420, scrollbars=yes, resizable=yes");  
		}
	
		function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, 
				admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, 
				buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){     // zipNo , roadAddrPart1 , roadAddrPart2 addrDetail 
			// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.    
			document.joinForm.zipNo.value = zipNo;                 //우편번호			
			document.joinForm.roadAddrPart1.value = roadAddrPart1; //도로명주소(참고항목 제외)  
			document.joinForm.roadAddrPart2.value = roadAddrPart2; //도로명주소 참고항목
			document.joinForm.addrDetail.value = addrDetail;       //고객 입력 상세 주소
			
		}
</script>	

<meta charset="UTF-8">
<title>울타리 회원가입</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<link rel= "stylesheet" href="<%= request.getContextPath() %>/css/ultaryLogin.css" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


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

<!----회원가입 기본 테이블 섹션  시작--------------------------------------------------------------------->


	<section id="section_newMember">
		<form action="<%= request.getContextPath() %>/insert.mem" method="post" id="joinForm" name="joinForm" onsubmit="return emalivalidate();">
			<div class="tableArea">
				<h1 align="center">회 원 가 입</h1>
				<hr width=50% color="white">
				<br>
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td style="align:middle;">
								<input type="text" id="memberid" name="memberid" class="member" maxlength="11" required autofocus>
								<label id="idResult"></label>
								<img id="memberid_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="memberid_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" id="membername" name="membername" class="member" maxlength="11" required>
								<label id="nameResult"></label>
								<img id="membername_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="membername_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" id="nickname" name="nickname" class="member" maxlength="11" required>
								<label id="nickResult"></label>
								<img id="nickname_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="nickname_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" id=password name="password" class="member" required>
								<label id="pwdResult1"></label>
								<img id="password_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="password_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>
						<tr>
							<th>비밀번호 재확인</th>
							<td>
								<input type="password" id="passwordcheck" name="passwordcheck" class="member" required>
								<label id="pwdResult2"></label>
								<img id="passwordcheck_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="passwordcheck_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><select id="birth_year" name="birthY" class="member" required>
									<option disabled selected value="">년</option>
									<% for(int i=1950; i<2020;i++){ %>
									<option><%= i %></option>
									<% } %>
								</select>년
							<select id="birth_month" name="birthM" class="member" required>
									<option class="member" disabled selected value="">월</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select>월
							<select id="birth_day" name="birthD" required>
									<option disabled selected value="">일</option>
									<% for(int i=1;i<=31;i++){ %>
									<% if(i<10){ %>
									<option>0<%= i %></option>
									<% } else{ %>
									<option><%= i %></option>
									<% } %>
									<% } %>
							</select>일
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
							<input type="radio" id="gender_F" name="gender" class="member" value="F" required checked><label>여자</label>
							<input type="radio" id="gender_M" name="gender" class="member" value="M" required><label>남자</label>
							</td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td class="member">
								<select id="phone1" name="phone1" required>
									<option>010</option>
									<option>011</option>
									<option>019</option>
								</select> 
								- <input type="text" id="phone2" name="phone2" maxlength="4" placeholder="1234" style="width: 50px;" required>
								- <input type="text" id="phone3" name="phone3" maxlength="4" placeholder="5678" style="width: 50px;" required>
							</td>
						</tr>
						<tr>
							<th>본인 확인 이메일</th>
							<td>
								<input type="text" id="email_1" name="email_1" class="member" style="width: 100px;" required>@<input type="text" id="email_2" name="email_2" class="member" style="width: 100px;" disabled> 
									<select id="selectEmail" name="selectEmail" class="member" style="width: 100px; margin-right: 10px" required>
											<option Selected disabled value="">::선택하세요::</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="1">직접입력</option>
									</select><input type="button" value="메일인증" id="sendChkEmail" onclick="sendMail();">
								<label id="emailResult"></label>
								<img id="emailResult_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="emailResult_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>	
						<tr>	
							<th>인증 번호 확인</th>
							<td>
								<input type="text" id="email_Confirm" name="email_Confirm" class="member" placeholder="인증번호를 입력하세요." required>
								<label id="emailChkResult"></label>
								<input type="button" value="인증확인" id="chkNum">
								<img id="emailChkResult_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="emailChkResult_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>
<!--도로명주소 API 적용하기 --------------------------------------------------------------------------->	
<!-- 			document.joinForm.zipNo.value = zipNo;                 //1우편번호			 -->
<!-- 			document.joinForm.roadAddrPart1.value = roadAddrPart1; //2도로명주소(참고항목 제외)   -->
<!-- 			document.joinForm.roadAddrPart2.value = roadAddrPart2; //3도로명주소 참고항목 -->
<!-- 			document.joinForm.addrDetail.value = addrDetail;       //4고객 입력 상세 주소	-->
						<tr>
							<th>우편번호</th>
							<td>
			<!-- 1우편번호-->		<input type="text" id="zipNo" name="zipNo" width="60px" required />
			<!-- 팝업버튼 -->		<input type="button" value="검색" onclick="goPopup();">
							</td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td>
			<!--2도로명주소--> 		<input type="text" id="roadAddrPart1" name="roadAddrPart1" width="240px" required /><br>
							</td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td>
			<!-- 3참고주소 -->	    <input type="text" id="roadAddrPart2" name="roadAddrPart2" width="115px" required />
			<!-- 4고객입력 상세주소 --><input type="text" id="addrDetail" name="addrDetail" width="115px" required /><br>
							</td>
						</tr>
<!--도로명주소 API 적용하기 --------------------------------------------------------------------------->							
						<tr>
							<th>비밀번호 질문</th>
							<td><select id="pwquery" name="pwquery" class="member" required>
									<option Selected disabled value="">::비밀번호 질문을 선택하세요::</option>
									<option value="1">기억에 남는 추억의 장소는?</option>
									<option value="2">자신의 인생 좌우명은?</option>
									<option value="3">자신의 보물 제1호는?</option>
									<option value="4">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="5">인상 깊게 읽은 책 이름은?</option>
									<option value="6">자신이 두번째로 존경하는 인물은?</option>
									<option value="7">어릴적 별명은?</option>
									<option value="8">다시 태어나면 되고 싶은 것은?</option>
									<option value="9">내가 좋아하는 캐릭터는?</option>
									<option value="10">내가 좋아하는 색깔은?</option>
							</select></td>
						</tr>
						<tr>
							<th>비밀번호 답</th>
							<td><input type="text" id="pwqans" name="pwqans" class="member" required></td>
						</tr>
					</tbody>
				</table>
				<br> <label id="trustQ">&nbsp;반려동물 위탁 요청을 받으시겠습니까?</label> 
				<input type="radio" onclick="setDisplay1();" id="trust_Y" name="trust" value="Y"><label>네</label>
				<input type="radio" onclick="setDisplay2();" id="trust_N" name="trust" value="N" checked><label>아니요</label><br> <br>

<!----위탁 테이블 섹션  시작--------------------------------------------------------------------->
<!-- hide/show -->	

				<div id=newMember_animal style="display: none;">
					<h3>위 탁 환 경</h3>
					<hr width=50% color="white">
					<table>
						<tr>
							<th>
								<label class="trustway">돌봄방식</label>
							</th>
							<td>	
								<input type="radio" id="trustmeans1" name="turstmeans" value="1" ><label>위탁</label>
								<input type="radio" id="trustmeans2" name="turstmeans" value="2" ><label>방문</label>
								<input type="radio" id="trustmeans3" name="turstmeans" value="3" ><label>산책</label>
								<input type="radio" id="trustmeans4" name="turstmeans" value="4" ><label>전체가능</label>
							</td>						
						</tr>
						<tr>
							<th>
								<label class="trustway">돌봄조건</label>
							</th>
							<td><input type="checkbox" id="trust_con1" name="trustfield" value="픽업여부" class="sittercon"><label>픽업여부</label> 
								<input type="checkbox" id="trust_con2" name="trustfield" value="마당여부" class="sittercon"><label>마당여부</label> 
								<input type="checkbox" id="trust_con3" name="trustfield" value="야외산책" class="sittercon"><label>야외산책</label><br> 
								<input type="checkbox" id="trust_con4" name="trustfield" value="노령동물" class="sittercon"><label>노령동물</label> 
								<input type="checkbox" id="trust_con5" name="trustfield" value="대형동물" class="sittercon"><label>대형동물</label> 
								<input type="checkbox" id="trust_con6" name="trustfield" value="목욕가능" class="sittercon"><label>목욕가능</label>
							</td>
						</tr>
						<tr>
							<th style="padding-right: 20px;">
								<label class="">위탁세부사항</label>
							</th>
							<td>
								<textarea name="trustAdd" placeholder="내용을 입력하세요." cols="36" rows="3" style="resize: none;"></textarea>
							</td>
						</tr>
						</table>
				
			</div>
<!-- hide/show -->
<!----위탁 테이블 섹션  끝--------------------------------------------------------------------->	
			<hr width=50% color="white">
			<br>
			<button type=submit id="loginBtn_normal" class="loginBtn" value="가입하기" >가입하기</button>
			<br>
			<br>
			<br>
		</div>
		</form>
	</section>
<!---- 테이블 섹션  끝--------------------------------------------------------------------->	

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
					<td><div class="footer_link" onclick="gofindPwd();">비밀번호 찾기</div></td>
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
	
	/* 위탁요청  show hide */
	function setDisplay1(){
	    if($('input:radio[id=trust_Y]').is(':checked')){
	        $('#newMember_animal').show();
	    }else{
	        $('#newMember_animal').hide();
	    }
	}
	function setDisplay2(){
	    if($('input:radio[id=trust_N]').is(':checked')){
	        $('#newMember_animal').hide();
	    }else{
	        $('#newMember_animal').show();
	    }
	}
	

	
	
	/* 아이디 유효성 검사 ajax 중복불가*/
	var isidUsable = false; 	// 아이디 중복 시false, 사용가능시 true
	var isIdChecked = false;	// 아이디 중복확인을 했는지 안했는지 검사
	var re1 =/^[a-zA-Z\d]{4,11}$/; // 아이디 정규식
	
	$("#memberid").on('change paste keyup', function(){
		isIdChecked = false;
	});
	
	$('#memberid').change(function(){
		var userId = $('#memberid');
		
		if(!re1.test(userId.val())){ //아이디 값이 아니거나, 아이디값이 3자보다 짧으면
			alert('아이디는 영문자와 숫자로 4글자 이상 11글자 이하로 입력하세요.');
			userId.focus();
		} else{
			$.ajax({
				url:'<%= request.getContextPath() %>/idCheck.mem',
				data:{userId: userId.val()},
				success: function(data){ //data로 반환 받아옴
					
					if(data == "success"){
// 						$('#idResult').text('사용가능합니다.');
// 						$('#idResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
						isidUsable = true;
						isIdChecked= true;
						
						if($('#memberid_check').css("display")=="none"){
							$('#memberid_check').show();
							$('#memberid_checked').hide();
						}
						
					}else{
// 						$('#idResult').text('사용 불가능 합니다.');
// 						$('#idResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
						userId.focus();
						isidUsable = false;
						isIdChecked= false;
						
					 	if($('#memberid_checked').css("display")=="none"){
				 		$('#memberid_checked').show();
				 		$('#memberid_check').hide();
					 	}
						
					}
				}
			});
		}
	});
	
	/* 이름 유효성 검사 ajax 중복불가 */
	
	var isnameUsable = false; 	// 이름  false, 사용가능시 true
	var re2 = /^[가-힣]{2,}$/; // 이름 정규식
	
	$('#membername').change(function(){
		var membername = $('#membername');
		
		if(!re2.test(membername.val())){
// 			$('#nameResult').text('사용불가합니다.');
// 			$('#nameResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
			alert('이름은 한글로 2자이상 입력하세요.');
			isnameUsable = false;
			membername.focus();
			
			if($('#membername_checked').css("display")=="none"){
		 		$('#membername_checked').show();
		 		$('#membername_check').hide();
			 	}
			
		}else{
// 			$('#nameResult').text('사용가능합니다.');
// 			$('#nameResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
			isnameUsable = true;

			if($('#membername_check').css("display")=="none"){
				$('#membername_check').show();
				$('#membername_checked').hide();
			}
			
		}
	});
	
	/* 닉네임 유효성 검사 ajax 중복불가 */		
	var isnickUsable = false; 	// 닉네임 중복 시false, 사용가능시 true
	var isnickChecked = false;	// 닉네임 중복확인을 했는지 안했는지 검사
	var re3 = /^[가-힣a-zA-Z\d]{2,}$/; // 닉네임 정규식 한글 2자이상
	
	
	$("#nickname").on('change paste keyup', function(){
		isnickChecked = false;
	});
	
	$('#nickname').change(function(){
		var userNick = $('#nickname');
		
		if(!re3.test(userNick.val())){
			alert('닉네임은 영문 혹은 한글 2자리 이상이어야 합니다.');
// 			$('#nickResult').text('사용 불가능 합니다.');
// 			$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
			userNick.focus();
			
			if($('#nickname_checked').css("display")=="none"){ //반려
		 		$('#nickname_checked').show();
		 		$('#nickname_check').hide();
			}
			
		} else{
			$.ajax({
				url:'<%= request.getContextPath() %>/nickNameCheck.mem',
				data:{userNick: userNick.val()},
				success: function(data){ //data로 반환 받아옴
					
					if(data == "success"){
// 						$('#nickResult').text('사용가능합니다.');
// 						$('#nickResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
						isnickUsable = true;
						isnickChecked= true;
						
						if($('#nickname_check').css("display")=="none"){
					 		$('#nickname_check').show();
					 		$('#nickname_checked').hide();
						}
						
					}else{
// 						$('#nickResult').text('사용 불가능 합니다.');
// 						$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
						userNick.focus();
						isnickUsable = false;
						isnickChecked= false;
						
						if($('#nickname_checked').css("display")=="none"){
					 		$('#nickname_checked').show();
					 		$('#nickname_check').hide();
						 	}
						
					}
				}
			});
		}
	});
	
	/* 비밀번호 유효성 검사 ajax 중복불가 */		
	var ispassUsable = false;
	var ispassChecked = false;
	var re4 = /^[a-zA-Z\d]{7,11}$/; 
	var password = $('#password');
	var password2 = $('#passwordcheck');
	
	$("#password").on('change paste keyup', function(){
		ispassChecked = false;
	});
	
	$('#password').change(function(){ //패스워드 1만 정규식 체크 후 
		if(!re4.test(password.val())){
// 			$('#pwdResult1').text('사용 불가능 합니다.');
// 			$('#pwdResult1').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
			alert('비밀번호는 영문 7~11자리 이어야 합니다.');
			password.focus();
			ispassUsable = false;
			
			if($('#password_checked').css("display")=="none"){
		 		$('#password_checked').show();
		 		$('#password_check').hide();
			 	}
			
		} else {
// 			$('#pwdResult1').text('사용가능합니다.');
// 			$('#pwdResult1').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
			ispassUsable = true;
			
			if($('#password_check').css("display")=="none"){
		 		$('#password_check').show();
		 		$('#password_checked').hide();
			 	}
		}
	});
	
	//패스워드 1과 패스워트 2 동일한지 검사.
	$('#passwordcheck').keyup(function(){
		if(password.val() == password2.val()){
// 			$('#pwdResult2').text('사용가능합니다.');
// 			$('#pwdResult2').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
			ispassUsable = true;
			
			if($('#passwordcheck_check').css("display")=="none"){
		 		$('#passwordcheck_check').show();
		 		$('#passwordcheck_checked').hide();
			 	}
			
		}else{
// 			$('#pwdResult2').text('비밀번호가 일치하지 않습니다.');
// 			$('#pwdResult2').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
			password2.focus();
			ispassUsable = false;
			
			if($('#passwordcheck_checked').css("display")=="none"){
		 		$('#passwordcheck_checked').show();
		 		$('#passwordcheck_check').hide();
			 	}
			
		}
	});
		
	/*이메일 중복 확인메일 발송  */ //emailResult
	var ismailUsable = false; 	// 이메일 중복 시false, 사용가능시 true
// 	var ismailChecked = false;	// 이메일 중복확인을 했는지 안했는지 검사
	
	$('#email_1,#email_2').on('paste keyup', function(){
		ismailChecked = false;
	});
	
	function sendMail(){
		var email_1 = $('#email_1'); 
		var email_2 = $('#email_2'); 
		var email = email_1.val() + '@' + email_2.val();
		var email_Confirm =$('#email_Confirm');
		
		
		$.ajax({  //이메일이 중복되는지 확인
			url: '<%= request.getContextPath() %>/email.mem',
			data: {email:email},
			success: function(data){
				
				if(email_1.val() != "" && email_2.val() != "" && data == 'success'){ //중복아니라면 success =>인증메일 발송 가능
					$.ajax({ //이메일 보내기
						url: '<%= request.getContextPath() %>/send.do',
						data: {email:email},
						success: function(data1){

// 							$('#emailResult').text('이메일 인증을 진행해주세요.');
							alert('입력하신 이메일로 인증메일이 발송되었습니다.');
							
							if($('#emailResult_check').css("display")=="none"){
						 		$('#emailResult_check').show();
						 		$('#emailResult_checked').hide();
							 }
							
							$('#chkNum').click(function(){ //인증확인 버튼을 눌렀을 때
								if(data1.trim() == $('#email_Confirm').val().trim()){ //인증번호와 사용자 입력이 일치하면
// 									$('#emailResult').text('이메일 인증에 성공하였습니다.');
									ismailUsable = true;
								
								if($('#emailChkResult_check').css("display")=="none"){
							 		$('#emailChkResult_check').show();
							 		$('#emailChkResult_checked').hide();
								 }	
									
									
								} else{
// 									$('#emailResult').text('인증번호가 다릅니다.');
									ismailUsable = false;
									alert('인증번호가 일치하지 않습니다.');
									if($('#emailChkResult_checked').css("display")=="none"){
								 		$('#emailChkResult_checked').show();
								 		$('#emailChkResult_check').hide();
									 }
									
								}
							})
						}
					})
				} else{ //중복이라서 인증메일 발송 불가
					alert('중복된 이메일이거나 없는 이메일은 사용할 수 없습니다.');
					email_1.select();
					ismailUsable = false;
// 					$('#emailResult').text('중복된 이메일은 사용할 수 없습니다.');
					if($('#emailResult_checked').css("display")=="none"){
				 		$('#emailResult_checked').show();
				 		$('#emailResult_check').hide();
					 }
				}
			}
		});
		
	}
	
	/* 이메일 인증번호 안적었는데 인증확인 먼저 눌렀을때 */
	$('#chkNum').click(function(){
		var email_Confirm = $('#email_Confirm');	
	
		if(email_Confirm.val() == ""){
			if($('#emailChkResult_checked').css("display")=="none"){
				alert('인증번호를 입력하여 주시기 바랍니다.');
				email_Confirm.focus();
		 		$('#emailChkResult_checked').show();
		 		$('#emailChkResult_check').hide();
			}
		}
	});
	
	/* 메일인증 안하고 가입하기 눌렀을때 */
	function emalivalidate(){
		if(ismailUsable){
			return true; //가입
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
		function gofindPwd(){ // 비밀번호 찾기로 이동
			location.href='<%= request.getContextPath() %>/views/main/findMember/findPwdForm.jsp';
		}
	</script>
	
</body>
</html>