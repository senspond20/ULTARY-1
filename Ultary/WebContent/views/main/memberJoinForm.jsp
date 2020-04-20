<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
			<img id="logo" src="<%= request.getContextPath() %>/image/logo.png" width="120px" height="90px"> <!-- 구 id headerimg -->
	</header>
	
<!----해더 끝--------------------------------------------------------------------->
<!-- nav 생략 -->

<!----회원가입 기본 테이블 섹션  시작--------------------------------------------------------------------->			

	<section id="section_newMember">
		<form action="<%= request.getContextPath() %>/insert.mem" method="post" id="joinForm" name="joinForm">
			<div class="tableArea">
				<h1 align="center">회 원 가 입</h1>
				<hr width=60% color="white">
				<br>
				<table>
					<tbody>
						<tr>
							<th><label class="must">*</label>아이디</th>
							<td><input type="text" id="memberid" name="memberid" class="member" maxlength="15" required>
							<label id="idResult"></label></td>
<!-- 						<span><button id="idCheck" onclick="checkId();">중복확인</button></span> -->
<!-- 							<td width="200px"><label id="idResult"></label></td> -->
						</tr>
						<tr>
							<th><label class="must">*</label>이름</th>
							<td>
							<input type="text" id="membername" name="membername" class="member" maxlength="10" required>
							</td>
						</tr>
						<tr>
							<th><label class="must">*</label>닉네임</th>
							<td><input type="text" id="nickname" name="nickname" class="member" maxlength="10" required>
							<label id="nickResult"></label>
<!-- 								<span><button id="nickCheck" onclick="checkNick();">중복확인</button></span> -->
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id=password name="password"
								class="member"></td>
						</tr>
						<tr>
							<th>비밀번호 재확인</th>
							<td><input type="password" id="password2" name="password2"
								class="member"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><select id="birth_year" name="birthY" class="member">
									<option>년</option>
									<% for(int i=1950; i<2020;i++){ %>
									<option><%= i %></option>
									<% } %>
								</select>년
							<select id="birth_month" name="birthM" class="member">
									<option class="member">월</option>
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
							<select name="birthD">
									<option>일</option>
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
							<td><input type="radio" id="gender_F" name="gender"
								class="member" value="F"><label>여자</label> <input
								type="radio" id="gender_M" name="gender" class="member"
								value="M"><label>남자</label></td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td>
							<input type="tel" maxlength="11" id="phone" name="phone" class="member" placeholder="(-없이)01012345678">
							</td>
						</tr>
						<tr>
							<th>본인 확인 이메일</th>
							<td>
								<input type="text" id="email_1" name="email_1" class="member" style="width: 100px;">@ 
								<input type="text" id="email_2" name="email_2" style="width: 100px;" disabled> 
									<select id="selectEmail" name="selectEmail" style="width: 100px; margin-right: 10px">
											<option Selected>::선택하세요::</option>
											<option value="1">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
									</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
							</td>
						</tr>
						<tr>
							<th>인증 번호 확인</th>
							<td>
							<input type="text" id="email_Confirm" name="email_Confirm" class="member" placeholder="인증번호를 입력하세요.">
								<span>
									<button>인증메일</button>
								</span>
								<!-- 본인 이메일로 이동하여 인증확인!-->
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>
								<!--도로명주소 API 적용하기  --> <input type="hidden" id="confmKey"
								name="confmKey" value=""> <input type="text" id="zipNo"
								name="zipNo" readonly> <input type="button" value="주소검색"
								onclick="goPopup();">
							</td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" id="roadAddrPart1"></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" id="addrDetail" value=""> <input
								type="text" id="roadAddrPart2" name="address" value="">
							</td>
						</tr>
						<tr>
							<th>비밀번호 질문</th>
							<td><select id="pwquery" name="pwquery" class="member">
									<option>비밀번호 질문</option>
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
							<td><input type="text" id="pwqans" name="pwqans"
								class="member"></td>
						</tr>
					</tbody>
				</table>

				<br> <label id="trustQ">&nbsp;반려동물 위탁 요청을 받으시겠습니까?</label> <input
					type="radio" onclick="setDisplay1();" id="trust_Y" name="trust"
					value="Y"><label>네</label> <input type="radio"
					onclick="setDisplay2();" id="trust_N" name="trust" value="N"
					checked><label>아니요</label><br> <br>
<!----위탁 테이블 섹션  시작--------------------------------------------------------------------->
<!-- hide/show -->	
				<div id=newMember_animal style="display: none;">
					<h3>위 탁 환 경</h3>
					<hr width=50% color="white">
					<table>
						<tr>
							<th><label class="trustway">돌봄방식</label></th>
							<td>	
								<input type="radio" id="trustmeans1" name="turstmeans" value="1" ><label>위탁</label>
								<input type="radio" id="trustmeans2" name="turstmeans" value="2" ><label>방문</label>
								<input type="radio" id="trustmeans3" name="turstmeans" value="3" ><label>산책</label>
								<input type="radio" id="trustmeans4" name="turstmeans" value="4" ><label>전체가능</label>
								
							</td>						
						</tr>
						<tr>
							<th><label class="trustway">돌봄조건</label></th>
							<td><input type="checkbox" id="trust_con1" name="trustfield"
								value="픽업여부" class="sittercon"><label>픽업여부</label> <input
								type="checkbox" id="trust_con2" name="trustfield" value="마당여부"
								class="sittercon"><label>마당여부</label> <input
								type="checkbox" id="trust_con3" name="trustfield" value="야외산책"
								class="sittercon"><label>야외산책</label> <br> <input
								type="checkbox" id="trust_con4" name="trustfield" value="노령동물"
								class="sittercon"><label>노령동물</label> <input
								type="checkbox" id="trust_con5" name="trustfield" value="대형동물"
								class="sittercon"><label>대형동물</label> <input
								type="checkbox" id="trust_con6" name="trustfield" value="목욕가능"
								class="sittercon"><label>목욕가능</label></td>

						</tr>
						<tr>
							<th style="padding-right: 20px;"><label class="">위탁세부사항</label></th>
							<td><textarea name="trustAdd" placeholder="내용을 입력하세요."
									cols="36" rows="3" style="resize: none;"></textarea></td>
						</tr>
					</table>
					<hr width=50% color="white">
					<br>
				</div>
<!-- hide/show -->
<!----위탁 테이블 섹션  끝--------------------------------------------------------------------->	
			<button type=submit id="loginBtn_normal" class="loginBtn" value="가입하기">가입하기</button>
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
		/*닉네임 중복체크  */
		function checkNick(){
			window.open('nickNameCheckForm.jsp','checkForm','width=500','height=300');
		}
		/*아이디 중복체크  */
// 		function checkId(){
// 			window.open('idCheckForm.jsp','checkForm','width=500','height=300');
// 		}
		
		/* 이메일 입력방식 선택 디비에 셀렉티트한 값을 어떻게 보내?? */
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
		
/* 아이디 유효성 검사 ajax */
		var isidUsable = false; 		// 아이디 중복 시false, 사용가능시 true
		var isIdChecked = false;	// 아이디 중복확인을 했는지 안했는지 검사
		
		$("#memberid").on('change paste keyup', function(){
			isIdChecked = false;
		});
		
		$('#memberid').change(function(){
			var userId = $('#memberid');
			
			if(!userId || userId.val().length < 4){
				alert('아이디는 최소 4자리 이상이어야 합니다.');
				userId.focus();
			} else{
				$.ajax({
					url:'<%= request.getContextPath() %>/idCheck.mem',
					data:{userId: userId.val()},
					success: function(data){ //data로 반환 받아옴
						
						if(data == "success"){
							$('#idResult').text('사용가능합니다.');
							$('#idResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
							isidUsable = true;
							isIdChecked= true;
						}else{
							$('#idResult').text('사용 불가능 합니다.');
							$('#idResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'20px'});
							isidUsable = false;
							isIdChecked= false;
						}
					}
				});
			}
		});
		
		function validate(){
			if(isUsable && isIdChecked){
				return true;
			}else{
				alert('아이디를 중복확인해 주세요');
				return false;
			}
		}
		
/* 닉네임 유효성 검사 ajax */		
		var isnickUsable = false; 		// 아이디 중복 시false, 사용가능시 true
		var isnickChecked = false;	// 아이디 중복확인을 했는지 안했는지 검사
		
		$("#nickname").on('change paste keyup', function(){
			isnickChecked = false;
		});
		
		$('#nickname').change(function(){
			var userNick = $('#nickname');
			
			if(!userNick || userNick.val().length < 4){
				alert('닉네임은 최소 4자리 이상이어야 합니다.');
				userNick.focus();
			} else{
				$.ajax({
					url:'<%= request.getContextPath() %>/nickNameCheck.mem',
					data:{userNick: userNick.val()},
					success: function(data){ //data로 반환 받아옴
						
						if(data == "success"){
							$('#nickResult').text('사용가능합니다.');
							$('#nickResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
							isnickUsable = true;
							isnickChecked= true;
						}else{
							$('#nickResult').text('사용 불가능 합니다.');
							$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'20px'});
							isnickUsable = false;
							isnickChecked= false;
						}
					}
				});
			}
		});
		
		function validate(){
			if(isnickUsable && isnickChecked){
				return true;
			}else{
				alert('닉네임을 중복 됩니다.');
				return false;
			}
		}

			
	</script>
	
</body>
</html>