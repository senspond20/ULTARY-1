<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>

<%
   Member NaverUser = (Member)request.getAttribute("NaverUser");
 	System.out.println("NaverUser : " +NaverUser);
   String birth = ((Member)request.getAttribute("NaverUser")).getBirth();
   String[] birthArr = birth.split("-");
%>
<!DOCTYPE html>
<html>
<head>

<script>
		/* 도로명 주소 */
		function goPopup(){ 
			//경로는 시스템에 맞게 수정하여 사용 
			//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
			//호출하게 됩니다. 
			var pop = window.open("<%= request.getContextPath() %>/views/main/popup/jusoPopup.jsp","pop","width=570, height=420, scrollbars=yes, resizable=yes");  
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
<title>울타리 네이버 연동 회원가입</title>
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
		<form action="<%= request.getContextPath() %>/naverInsert.mem" method="post" id="joinForm" name="joinForm">
			<div class="tableArea">
				<h1 align="center">네이버 연동 회원가입</h1>
				<hr width=50% color="white">
				<br>
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" id="memberid" name="memberid" class="member" maxlength="15" value="<%= NaverUser.getMemberId() %>" readonly>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" id="membername" name="membername" class="member" maxlength="10" value="<%= NaverUser.getMemberName() %>" readonly>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" name="nickname" id="nickname" value="<%= NaverUser.getNickname() %>" autofocus>
								<label id="nickResult"></label>
								<img id="nickname_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="nickname_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
							</td>
						</tr>
						<!-- 소셜로그인 비밀번호 필요없음 -->
						<tr>
							<th>생년월일</th>
							<td>
							<select id="birth_year" name="birthY" class="member" required>
									<option disabled selected value="">년</option>
									<% for(int i=1950; i<2020;i++){ %>
									<option><%= i %></option>
									<% } %>
								</select>년
								<input type="text" id="birth_month" name="birthM" class="member" style="width: 20px;" value="<%= birthArr[0] %>" readonly />월
								<input type="text" id="birth_day" name="birthD" class="member" style="width: 20px;" value="<%= birthArr[1] %>"readonly />일
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<input type="radio" id="gender_F" name="gender" class="member" value="F"><label>여자</label>
								<input type="radio" id="gender_M" name="gender" class="member" value="M"><label>남자</label>
							</td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td class="member">
								<select id="phone1" name="phone1">
									<option selected>010</option>
									<option>011</option>
									<option>019</option>
								</select> 
								- <input type="text" id="phone2" name="phone2" maxlength="4" placeholder="1234" style="width: 50px;" required>
								- <input type="text" id="phone3" name="phone3" maxlength="4" placeholder="5678" style="width: 50px;" required>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" id="naverEmail" name="naverEmail" class="member" style="width: 150px;" value="<%= NaverUser.getEmail() %>" readonly>
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
			<button type=submit id="loginBtn_normal" class="loginBtn" value="가입하기" onclick="validate()">가입하기</button>
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
	
		/* 성별 받아오기 */
		$(function(){
			var navergender = '<%= NaverUser.getGender() %>';
			console.log(navergender);
			if(navergender == 'F'){
				$('#gender_F').attr('checked',true);
	  		} else if(navergender == 'M'){
	         	$('#gender_M').attr('checked',true);
	      	}
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
			
		/* 닉네임 유효성 검사 ajax 중복불가 */		
		var isnickUsable = false; 	// 닉네임 중복 시false, 사용가능시 true
		var isnickChecked = false;	// 닉네임 중복확인을 했는지 안했는지 검사
		var re3 = /^[가-힣a-zA-Z\d]{2,4}$/; // 닉네임 정규식
		
		
		$("#nickname").on('change paste keyup', function(){
			isnickChecked = false;
		});
		
		$(function(){
			var userNick = $('#nickname');
			if(userNick != null){ //네이버에서 가져오자 마자 울타리 기준으로 닉네임 한번 확인하고
				if(!re3.test(userNick.val())){
					alert('닉네임은 영문 혹은 한글로 2~4자리여야 합니다.');
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
								isnickUsable = true;
								isnickChecked= true;
								
								if($('#nickname_check').css("display")=="none"){//허용
							 		$('#nickname_check').show();
							 		$('#nickname_checked').hide();
								}
								
							}else{
								userNick.focus();
								isnickUsable = false;
								isnickChecked= false;
								
								if($('#nickname_checked').css("display")=="none"){ //반려
							 		$('#nickname_checked').show();
							 		$('#nickname_check').hide();
								}
							}
						}
					});
				}
			}
		});
		$('#nickname').change(function(){ //회원이 바꾸었을 때 다시 확인함 
			var userNick = $('#nickname');
			
			if(!re3.test(userNick.val())){
				alert('닉네임은 영문 혹은 한글로 2~4자리여야 합니다.');
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
							isnickUsable = true;
							isnickChecked= true;
							
							if($('#nickname_check').css("display")=="none"){//허용
						 		$('#nickname_check').show();
						 		$('#nickname_checked').hide();
							}
							
						}else{
							userNick.focus();
							isnickUsable = false;
							isnickChecked= false;
							
							if($('#nickname_checked').css("display")=="none"){ //반려
						 		$('#nickname_checked').show();
						 		$('#nickname_check').hide();
							}
						}
					}
				});
			}
		});
		
		
//---------------------------------------------------------------------------------------------------------------------------		
//---------------------------------------------------------------------------------------------------------------------------		
//---------------------------------------------------------------------------------------------------------------------------		
//---------------------------------------------------------------------------------------------------------------------------		
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