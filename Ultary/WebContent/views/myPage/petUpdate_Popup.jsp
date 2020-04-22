<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
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

	#mypage{
		width:900px;
		height:1500px;
	}
	
	#myForm2{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
	
	
	table { margin-left: auto; margin-right: auto;
 		    border-spacing: 20px;
 		    border-collapse: separate;
 		    
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


	th{background: hsla(197, 62%, 74%, 0.603); width: 120px; text-align: center;}
	h2{background: gainsboro; width: 200px;}
	u{font_underlinecolor: gainsboro;}
	

</style>
</head>
<body>
	<div id="mypage">
		<form id="myForm2" action="<%= request.getContextPath() %>/insert.pet" method="post" encType="multipart/form-data">
		<center><h2>반려동물 정보</h2></center>
	<table>
		<tr>
			<th>프로필  사진</th>
			<td>
				<input type=file name='file1' style='display: none;' id="petFileImg" multiple="multiple" onchange="LoadImg(this,1)">  
				<img src='<%= request.getContextPath() %>/image/catprofile.png' border='0' class="fileInput" id="basicImg" width="400px" height="240px" style='cursor:pointer;'>
				<img border='0' id="inputImg" width="400px" height="240px" class="fileInput" style='cursor:pointer;'>
				<!-- <div id=petFileImgDiv></div> -->
				<!-- <input type="file" id="petFileImg" multiple="multiple" name="petFileImg" onchange="LoadImg(this,1)"> -->
				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						/* 
						
						$("#mypage").click(function(){
							$("#petFileImg").click();
						}); */
						$("#inputImg").hide();
						$('.fileInput').click(function(){
							$("#petFileImg").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
									$("#inputImg").attr("src", e.target.result);
									$("#inputImg").show();
									$("#basicImg").hide();
								}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
			</td>
		</tr>
		<tr>
			<th>반려동물 이름</th>
			<td><input type="text" name="petname" id="petname" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
			<th>반려동물 종류</th>
			<td>		
			<select id="petkind" name="petkind" class="text" placeholder="반려동물" style="height: 25px;">
								<option value="1">강아지</option>
								<option value="2">고양이</option>
								<option value="3">설치류</option>
								<option value="4">파충류</option>
								<option value="5">조류</option>	
								<option value="6">어류</option>
								<option value="7">기타</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>성별 </th>
			<td><input type="radio" name="petgender" id="gender">여자
				<input type="radio" name="petgender" id="gender">남자
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="number" name="petage" id="petage" style="width: 50px;"></td>
		</tr>
		
	</table>
	<center><input id="retoch" type="submit" value="수정저장" style='cursor:pointer;'></button></center>
	</form>
	</div>
</body>
</html>