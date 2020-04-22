<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member m = (Member)request.getAttribute("m");
	Pet pet = (Pet)request.getAttribute("pet");
	
	String petKind="";
	switch(pet.getPetKind()){
	case '1' : petKind="강아지"; break;
	case '2' : petKind ="고양이"; break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티용</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching03.css">
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/tr_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/tr_aside.jsp" %>
				<section>
				
				
					<div>
            <form action="<%=request.getContextPath()%>/Tpostsend.tu" onsubmit="return datacheck();">
            <div id="matching">
				<h1 id="title">의뢰관리</h1>
				<p id="title-1">위탁 내용 상세보기와 진행사항을 보여드립니다.</p>
					<hr style="margin-left:10px;">
				<br clear="all">
				</div>
			<div id="page">
				<div id="page1">
					<div id="page2">
						<div id="page2-1">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="userphoto">
							<h3 id="nick1"><%=m.getNickname() %><input type="hidden" name = "memberid" value="<%=m.getMemberId()%>"></h3>
						</div>
						<div id="page2-2">
							<h3 id="pcoment">님 에게 위탁 요청</h3>
						</div>
					</div>
					<div id= "page3">
						<div id="page3-1">
							<h3>반려동물 정보</h3>
						</div>
						<div id="page3-2">
							<table id="page3_table">
								<tr>
									<td class="page3_td"><div class="petname">반려동물 이름</div></td>
									<td><label><%=pet.getPetName() %></label><input type="hidden" name="petnum" value="<%=pet.getPetNum()%>"></td>
									
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">반려동물 종류</div></td>
									<td><label><%=petKind %></label></td>
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">성별</div></td>
									<td><label><%=pet.getPetGender() %></label></td>
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">반려동물 나이</div></td>
									<td><label><%=pet.getPetage() %>살</label></td>
								</tr>
							</table>
						</div>
						<div id="page3-3">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="pet-photo">
						</div>
					</div>
					<div id="page4">
						<table id="page4-in">
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">거주지역</div>
								</td>
								<td colspan ="2">
									<select id="place11" name="h_area1" onChange="cat1_change(this.value,h_area2)" >
									<option>-선택-</option>
									<option value='1'>서울</option>
									<option value='2'>부산</option>
									<option value='3'>대구</option>
									<option value='4'>인천</option>
									<option value='5'>광주</option>
									<option value='6'>대전</option>
									<option value='7'>울산</option>
									<option value='8'>강원</option>
									<option value='9'>경기</option>
									<option value='10'>경남</option>
									<option value='11'>경북</option>
									<option value='12'>전남</option>
									<option value='13'>전북</option>
									<option value='14'>제주</option>
									<option value='15'>충남</option>
									<option value='16'>충북</option>
								  	</select>
								
								
								<select id="nation1" name="h_area2">
						  				<option>-선택-</option>
						  		</select>
						  			<input type="text" placeholder="동/읍을 입력해주세요." name ="h_area3"class="pl1" id="text1">
								</td>
					<script>
					 		var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
							 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');
							 var cat2_num = new Array();
							 var cat2_name = new Array();
							 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
							 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
							 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
							 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
							 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');
							 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');
							 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');
							 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
							 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');
							 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
							 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
							 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
							 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
							 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');
							 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
							 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
					function cat1_change(key,sel){
						if(key == '') return;
							 var name = cat2_name[key];
							var val = cat2_num[key];
							 for(i=sel.length-1; i>=0; i--)
							  sel.options[i] = null;
 							 sel.options[0] = new Option('-선택-','', '', 'true');
							 for(i=0; i<name.length; i++){
							  sel.options[i+1] = new Option(name[i],name[i]);
							 }
							}
							-->
							</script>
							</tr>
						
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">돌봄기간</div>
								</td>
								<td>
									<label>시작날자</label><input type="date" name="startDate" id="startDate">
								</td>
								<td>
									<label>끝나는 날자</label><input type="date" name="endDate" id="endDate">
								</td>
							</tr>
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">위탁방식</div>
								</td>
								<td>
									<select id="select3" name ="trustmeans">
										<option hidden="hidden" selected value="">선택</option>
										<option value="2">방문돌봄</option>
										<option value="3">위탁돌봄</option>
										<option value="1">산책돌봄</option>
										<option value="4">모두가능</option>
									</select>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">비상연락처</div>
								</td>
								<td>
									<input type="tel" name="tel" id="tel" value="">
								</td>
								<td>
								</td>
							</tr>
						</table>
					<div id="page5">
					<br><br>
						<div id="page5-title">
						<%=m.getNickname() %> 님에게 보내는 메세지
						</div>
							<textarea id="page5-textarea" cols="30" rows="30" name="trustAdd">-</textarea>

					</div>
						<input type="submit" id="sub" value="요청하기">
					</div>
				</div>
			</div>
            </form>
         <script>
         function datacheck(){
        	 var startdate = $('#startDate').val();
	         var enddate = $('#endDate').val();
        	 
	         if($('#place11').val()=='-선택-' || $('#nation1').val=='-선택-' ||$('#text1').val()==""){
					alert("지역을 입력해주세요");
					return false;
	         }else if($('#startDate').val()==""){
	        	 alert("시작날자를 입력해주세요");
	        	 return false;
	         }else if($('#endDate').val()==""){
	        	 alert("끝나는 날자를 입력해주세요");
	        	 return false;
	         }else if($('#select3').val()=="선택"){
	        	 alert("위탁 방식을 선택해주세요");
	        	 $('#select3').focus();
	        	 return false;
	         }else if($('#tel').val()=""){
	        	 alert("비상연락처를 입력해주세요");
	        	 $('#tel').focus();
	        	 return false;
	         }else if(startdate > enddate){
	        	 alert("종료날자는 시작날자보다 빠를수 없습니다.")
	        	 return false;
	         }else{
	        	 return true;
	         }
	         
	         
	         
         }
         </script>
         </div>
				
				
				
				
				
				
				
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>