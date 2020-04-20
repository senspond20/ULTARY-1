<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티용</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching01.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/tr_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/tr_aside.jsp" %>
				<section>
				
				
				
					<div>
            <div id="title">
			   	<h1 id="title1">위탁매칭</h1>
			   		<hr>
			   	<h5>울타리 이용자들의 위탁 품앗이 공간</h5>
		   	</div>
    <div id="content-box">
    	<div id="matcontent">
    	 	<form action="<%= request.getContextPath() %>/SerchMember.sc"  id="myInfoForm" name="myInfoForm" onsubmit="return datacheck();">
    		<table>
				<tr>
					<td><div id="m-in" class="bar">지역필터</div>
						<div id=place1 class="selectall">
						  <select id="place11"name="h_area1" onChange="cat1_change(this.value,h_area2)" >
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
						<input type="text" placeholder="동/읍을 입력해주세요." name ="h_area3"class="pl1" id="text1">
						<input type="radio" name="check01" class="check01" value="3" ><label>위탁</label>
						<input type="radio" name="check01" class="check01" value="2"><label>방문</label>
						<input type="radio" name="check01" class="check01" value="1" ><label>산책</label>
						
						</div>
					</td>
				</tr>
				<br><br>
				<tr>
					<td><div id="m-in" class="bar">검색필터1</div>
						<div id="serchfilter1">
						<input type="checkbox" name="check1" class="check" value="픽업여부"><label>픽업여부</label>
						<input type="checkbox" name="check1" class="check" value="마당여부"><label>마당여부</label>
						<input type="checkbox" name="check1" class="check" value="야외산책"><label>야외산책</label><br>
						<input type="checkbox" name="check1" class="check" value="노령동물"><label>노령동물</label>
						<input type="checkbox" name="check1" class="check" value="대형동물"><label>대형동물</label>
						<input type="checkbox" name="check1" class="check" value="목욕가능"><label>목욕가능</label>
						</div>
					</td>
				</tr>
				<tr>
					<td><div id="m-in" class="bar">검색필터2</div>
						<div id="serchfilter2">
						<input type="checkbox" name="check2" class="check" value="1"><label>강아지</label>
						<input type="checkbox" name="check2" class="check" value="2"><label>고양이</label>
						<input type="checkbox" name="check2" class="check" value="3"><label>설치류</label><br>
						
						<input type="checkbox" name="check2" class="check" value="4"><label>어류&nbsp;</label>
						<input type="checkbox" name="check2" class="check" value="5"><label>파충류</label>
						<input type="checkbox" name="check2" class="check" value="6"><label>조류&nbsp; </label>
						<input type="checkbox" name="check2" class="check" value="7"><label>기타&nbsp; </label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input id="search01" type="submit" value="검색">
 						<!-- <button id="search01" onclick='location.href="views/위탁검색/matching02.jsp"'>검색</button>  -->
					</td>
				</tr>
			</table>
			</form>
		<script>
			function datacheck(){
				if($('#place11').val()=='-선택-' || $('#nation1').val=='-선택-' ||$('#text1').val()==""){
					alert("지역을 입력해주세요");
					return false;
				}else if($('input:radio[name="check01"]').is(':checked')==false){
					alert("위탁방식을 입력해주세요");
					return false;
					
				}else if($("input:checkbox[name='check1']:checked").length < 1){
					alert("검색필터 1을 체크해 주세요.");
					return false;
				}else if($("input:checkbox[name='check2']:checked").length < 1){
					alert("검색필터 2을 체크해 주세요.");
					return false;
				}else{
					return true;
				}
			}
		</script>
			</div>
   			 </div>
         </div>
				
				
				
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>