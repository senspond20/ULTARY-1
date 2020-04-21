<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Pet> loginPet = (ArrayList<Pet>)session.getAttribute("loginPet");
	ArrayList<Media> loginMedia = (ArrayList<Media>)session.getAttribute("loginMedia");
	String add = ((Member)session.getAttribute("loginUser")).getAddress();
	String[] addArr = add.split("/");
	String petkind = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/myPage_css/memberUpdate.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="script.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("addressUpdate_Popup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, 
        admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, 
        buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		 document.myForm.zipNo.value = zipNo;                 //우편번호         
         document.myForm.roadAddrPart1.value = roadAddrPart1; //도로명주소(참고항목 제외)  
         document.myForm.roadAddrPart2.value = roadAddrPart2; //도로명주소 참고항목
         document.myForm.addrDetail.value = addrDetail;       //고객 입력 상세 주소	
}


// <a href="주소 입력" onClick="window.open(this.href, '', 'width=400, height=430'); return false;">하고픈 말</a>

</script>
<style>
.text{font-family: 'Nanum Gothic Coding', monospace;}

	#mypage{
		width:900px;
		height:1500px;
	}
	
	#myForm{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
	#myForm2{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
	
	
	table { margin-left: auto; margin-right: auto;
 		    border-spacing: 20px;
 		    border-collapse: separate;
 		    
}
	#newMember_animal{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 5px; margin: 20px; margin-left: 150px; margin-right: 150px;
		
	}

	#petplus{
		width: 140px;
		box-shadow: 0px 1px 0px 0px #f0f7fa;
		background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
		background-color:#33bdef;
		border-radius:6px;
		border:1px solid #057fd0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:14px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px -1px 0px #5b6178;
		}
		#petplus:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#petplus:active {
		position:relative;
		top:1px;
		}
		
		input:focus {
	    outline: none;
		}
		
	#retoch{
		width: 140px;
		box-shadow: 0px 1px 0px 0px #f0f7fa;
		background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
		background-color:#33bdef;
		border-radius:6px;
		border:1px solid #057fd0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:18px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px -1px 0px #5b6178;
		}
		#retoch:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#retoch:active {
		position:relative;
		top:1px;
		}
		
		input:focus {
	    outline: none;
		}
		
		input:focus {
	    outline: none;
		}
		
		#retoch2{
		width: 140px;
		box-shadow: 0px 1px 0px 0px #f0f7fa;
		background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
		background-color:#33bdef;
		border-radius:6px;
		border:1px solid #057fd0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:18px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px -1px 0px #5b6178;
		}
		#retoch2:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#retoch2:active {
		position:relative;
		top:1px;
		}
		
		input:focus {
	    outline: none;
		}


	th{background: hsla(197, 62%, 74%, 0.603); width: 120px; text-align: center;}
	h2{background: gainsboro; width: 200px;}
	u{font_underlinecolor: gainsboro;}
	

</style>
</head>
<body>
	<div id="all">
		<div id="all-wrap">
			<header>
				<div id="header-top">
					<img class="headerimg" src="<%= request.getContextPath() %>/image/알림.png">
					<img class="headerimg" src="<%= request.getContextPath() %>/image/메신저.png">
					<div id="header-topR">
						<div id="nick"><%= loginUser.getNickname() %></div>
						<div id="nim">님</div>
						<button id="logout" class="top-right" onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</button>
					</div>
				</div>
				<div id="header-bottom">
					<img id="logoimg" src="<%= request.getContextPath() %>/image/logo.png">
				</div>
			</header>
			<nav>
				<div id='cssmenu'>
					 <ul>
                  <li>
                     <a href='#'>내울타리</a>
                     <ul id="menu1">
                        <li><a href='#'>타임라인</a></li>
                        <li><a href='#'>게시글작성</a></li>
                        <li><a href='#'>관심회원</a></li>
                        <li><a href='#'>게시글 즐겨찾기</a></li>
                        <li><a href='#'>내 위탁환경</a></li>
                     </ul>
                  </li>
                  <li>
                     <a href='#'>커뮤니티</a>
                     <ul id="menu2">
                        <li><a href='#'>공지사항</a></li>
                        <li><a href='#'>모아보기</a></li>
                        <li><a href='#'>펫일상</a></li>
                        <li><a href='#'>펫지식</a></li>
                        <li><a href='#'>펫리뷰</a></li>
                        <li><a href='#'>펫분양</a></li>
                     </ul>
                  </li>
                  <li><a href='#'>위탁매칭</a>
                     <ul id="menu3">
                        <li><a href='#'>위탁검색</a></li>
                        <li><a href='#'>의뢰 관리</a></li>
                        <li><a href='#'>내가 남긴 리뷰</a></li>
                     </ul>
                  </li>
                  <li class='active'><a href='#'>마이페이지</a>
                     <ul id="menu4">
                        <li><a href="<%= request.getContextPath() %>/views/myPage/memberUpdate.jsp">내 정보 관리</a></li>
						<li><a href="<%= request.getContextPath() %>/views/myPage/pwdUpdate.jsp">비밀번호 변경</a></li>
						<li><a href="<%= request.getContextPath() %>/views/myPage/memberDelete.jsp">회원 탈퇴</a></li>
                     </ul>
                  </li>
                  <li><a href='#'>고객센터</a>
                     <ul id="menu5">
                        <li><a href='#'>공지 사항</a></li>
                        <li><a href='#'>자주하는 질문</a></li>
                        <li><a href='#'>1:1 문의</a></li>
                     </ul>
                  </li>
               </ul>
            </div>
			</nav>
			<div id="asidesection">
				<aside>
					<ul>
						<li>내 정보 관리</li>
						<li>비밀번호 변경</li>
						<li>회원 탈퇴</li>
					</ul>
				</aside>
				<section>
	
	<center><h1><u>내 정보 관리</u></h1></center>
	<hr width=50% color="white">
	<div id="mypage">
	<form id="myForm" name = "myForm" action="<%= request.getContextPath() %>/update.mem" method="post">
	<center><h2>내 정보</h2></center>
	<table>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" value="<%= loginUser.getNickname() %>"><button>중복체크</button></td>
		
		</tr>
		<tr>
			<th>이름 </th>
			<td><%= loginUser.getMemberName() %></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%= loginUser.getMemberId() %></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%= loginUser.getBirth() %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<%= loginUser.getGender() %>
			</td>
		</tr>
			<tr>
			<th>E-mail</th>
			<td><%= loginUser.getEmail() %></td>
		</tr>
		<tr>
			<th>Phone</th>
			<td><input name="phone" id="phone" value="<%= loginUser.getPhone() %>"></td>
		</tr>
		<tr>
                     <th>우편번호</th>
                     <td>
         <!-- 1우편번호-->      <input type="text" id="zipNo" name="zipNo" width="60px" value="<%= addArr[0] %>"/>
        			
       				
         <!-- 팝업버튼 -->      <input type="button" value="검색" onclick="goPopup();">
                     </td>
                  </tr>
                  <tr>
                     <th>도로명주소</th>
                     <td>
         <!--2도로명주소-->       <input type="text" id="roadAddrPart1" name="roadAddrPart1" width="240px" value="<%= addArr[1] %>"/><br>
         			<%-- <%= loginUser.getAddress().split(regex) %> --%>
                     </td>
                  </tr>
                  <tr>
                     <th>상세주소</th>
                     <td>
         <!-- 3참고주소 -->       <input type="text" id="roadAddrPart2" name="roadAddrPart2" width="115px" value="<%= addArr[2] %>"/>
         			<%-- <%= loginUser.getAddress().split(regex) %> --%>
         <!-- 4고객입력 상세주소 --><input type="text" id="addrDetail" name="addrDetail" width="115px" value="<%= addArr[3] %>"/><br>
         			<%-- <%= loginUser.getAddress().split(regex) %> --%>
                     </td>
                  </tr>
		<tr>
			<th>비밀번호 질문</th>
			<td>
				<select id="pwquery" name="pwquery" class="member">
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
				</select>
			</td>
			</tr>
			<tr>
				<th>비밀번호 답</th>
				<td>
					<input type="text" id="pwqans" name="pwqans"class="member" value="<%= loginUser.getPwqAns() %>">
				</td>
			</tr>
		
		<tr>
			<th>위탁여부</th>
			<td>
				<input
					type="radio" onclick="setDisplay1();" id="trust_Y" name="trust"
					value="Y"><label>네</label> <input type="radio"
					onclick="setDisplay2();" id="trust_N" name="trust" value="N"
					checked><label>아니요</label>
			</td>
		</tr>
		<script>
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
</script>
<script>
	$(function(){
		if(<%= loginUser.getTrust() %>== "Y"){
			$('#trust_Y').attr('checked','checked');
		} else if(<%= loginUser.getTrust() %>== ""){
			$('#trust_N').attr('checked','checked');
</script>
		</table>
		<div id=newMember_animal style="display: none;">	
		<table>
		<tr>
			<th>
				<label class="trustway">돌봄방식</label>
			</th>
			<td>	
				<input type="radio" id="trustmeans1" name="trustmeans" value="1" ><label>위탁</label>
				<input type="radio" id="trustmeans2" name="trustmeans" value="2" ><label>방문</label>
				<input type="radio" id="trustmeans3" name="trustmeans" value="3" ><label>산책</label>
				<input type="radio" id="trustmeans4" name="trustmeans" value="4" ><label>전체가능</label>
			</td>
		</tr>
<script>
	$(function(){
		if(<%= loginUser.getTrustmeans() %>== "1"){
			$('#trustmeans1').attr('checked','checked');
		} else if(<%= loginUser.getTrustmeans() %>== "2"){
			$('#trustmeans2').attr('checked','checked');
		} else if(<%= loginUser.getTrustmeans() %>== "3") {
			$('#trustmeans3').attr('checked','checked');
		} else if(<%= loginUser.getTrustmeans() %>== "4") {
			$('#trustmeans4').attr('checked','checked');
		} 	
	});
</script>
		<tr>
			<th>돌봄조건</th>
			<td>
			<input type="checkbox" name="trustfield" value="픽업" id="dolbombom" <%= "trustfield[0]" %>> <label>픽업여부</label>
			<input type="checkbox" name="trustfield" value="미당" id="dolbombom" <%= "trustfield[1]" %>> <label>마당여부</label>
			<input type="checkbox" name="trustfield" value="야외" id="dolbombom" <%= "trustfield[2]" %>> <label>야외산책</label><br>
			<input type="checkbox" name="trustfield" value="노령" id="dolbombom" <%= "trustfield[3]" %>> <label>노령여부</label>
			<input type="checkbox" name="trustfield" value="대형" id="dolbombom" <%= "trustfield[4]" %>> <label>대형동물</label>
			<input type="checkbox" name="trustfield" value="목욕" id="dolbombom" <%= "trustfield[5]" %>> <label>목욕가능</label>	
			</td>
		</tr>
		<tr>
			<th style="padding-right: 20px;"><label class="">위탁 추가 사항</th>
			<td><textarea name="trustAdd" placeholder="추가사항을 입력해주세요"
									cols="36" rows="3" style="resize: none;" <%= loginUser.getTrustAdd() %>></textarea></td>
		</tr>
		</div>
	</table>
	</div>
		<center><input type="submit" id="retoch2" value="수정저장" style='cursor:pointer;'></center><br>
	</form>
	
		<center><h2>반려동물 정보</h2></center>
	<!-- 여기부터 반려동물 정보칸 -->
		<div id="petdiv">
		<% for(int i=0;i<loginPet.size();i++){ 
			Pet p = loginPet.get(i);
			switch(p.getPetKind()){
			case '1': petkind="강아지"; break;
			case '2':	petkind="고양이"; break;
			case '3':	petkind="설치류"; break;
			case '4':	petkind="파충류"; break;
			case '5':	petkind="조류"; break;
			case '6':	petkind="어류"; break;
			case '7':	petkind="기타"; break;
			} %>
			<% for(int j=0;j<loginMedia.size();j++){
				Media m = loginMedia.get(j); %>
				<% if(p.getPetNum() == m.getPetNum()){ %>
			<table class="petone">
				<tr>
					<th>프로필  사진</th>
					<td>
						<img src='<%= request.getContextPath() %>/uploadFiles/<%= m.getWebName() %>' border='0' class="fileInput" id="basicImg" width="200px" height="126px" style='cursor:pointer;'>
					</td>
				</tr>
				<tr>
					<th>반려동물 이름</th>
					<td><%= p.getPetName() %></td>
				</tr>
				<tr>
					<th>반려동물 종류</th>
					<td>
						<%= petkind %>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<%= p.getPetGender() %>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>
						<%= p.getPetage() %>
					</td>
				</tr>
			</table>
				<% } %>
			<% } %>
		<% } %>
		</div>
		<center><input type="button" id="petplus" style="cursor:pointer;" value="반려동물 변경"></center>
		<script>
			$('#petplus').click(function(){
				window.open('<%= request.getContextPath()%>/views/myPage/petList.jsp', 'pop', 'width=950, height=650');
			});
		</script>
	</div>
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>