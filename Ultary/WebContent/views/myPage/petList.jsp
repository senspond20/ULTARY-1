<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Pet> loginPet = (ArrayList<Pet>)session.getAttribute("loginPet");
	ArrayList<Media> loginMedia = (ArrayList<Media>)session.getAttribute("loginMedia");
	String petkind = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 수정</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/myPage_css/memberUpdate.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="script.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function showPopup(){
	var popup = window.open("", "POPup", "width=500 , height=300");
	
	popup.document.write(
			'<html><body><center><h2>주소 검색<br><input type="text" name="시" id="시">시<br><input type="text" name="구" id="구">구<br><input type="text" name="동" id="동">동</h2></center><br><br><center><button>확인</button></center></body></html>' 
			);
}
$(function(){
    //직접입력 인풋박스 기존에는 숨어있다가
$("#direct").hide();
$("#self").change(function() {
              //직접입력을 누를 때 나타남
		if($("#self").val() == "direct") {
			$("#direct").show();
		}  else {
			$("#direct").hide();
		}
	}) 
});
</script>
<style>
.text{font-family: 'Nanum Gothic Coding', monospace;}

	
	#myForm2{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;overflow:hidden;}
	
	
	table { margin-left: auto; margin-right: auto;
 		    border-spacing: 20px;
 		    border-collapse: separate;
 		    border-right: 1px solid gray;
 		    
}

	#pp{
		float: right;
		width: 80px;
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
		#pp:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#pp:active {
		position:relative;
		top:1px;
		}
			
		input:focus {
	    outline: none;
		}
		
		
		#pd{
		float: right;
		width: 80px;
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
		#pd:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#pd:active {
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


	th{background: hsla(197, 62%, 74%, 0.603); width: 120px; text-align: center;}
	h2{background: gainsboro; width: 200px;}
	u{font_underlinecolor: gainsboro;}
	

</style>
</head>
<body>
	<div id="myForm2">
		<center><h2>반려동물 정보</h2></center>
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
				<tr>
					<td colspan="2">
						<input type="button" id="pd" style="cursor:pointer;" value="삭제">
						<input type="button" id="pp" style="cursor:pointer;" value="수정">
					</td>		
				</tr>
			</table>
				<% } %>
			<% } %>
		<% } %>
		<script>
			var pp = $('#pp'); // 수정버튼
			var pd = $('#pd'); // 삭제버튼
			
			function pp(){ // 수정버튼
				
				if(pp > 0){
					return true;
				}
			}
		
			function pd(){ // 삭제버튼
				
			}
		
		
	
		</script>
	</div>
</body>
</html>