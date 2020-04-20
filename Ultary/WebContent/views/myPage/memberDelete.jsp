<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/myPage_css/memberDelete.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="script.js"></script>
    <script type="text/javascript">
//    function goPopup(){
	// var popup = window.open("", "_self"); // 같은 탭에서 열림
//	var win = window.open("/popup.html", "PopupWin", "width=500,height=600");

	//<a href="주소 입력" onClick="window.open(this.href, '', 'width=400, height=430'); return false;"></a>

	
	/* alert("정말 탈퇴하시겠습니까?"); */


</script>
<style>
#text{font-family: 'Nanum Gothic Coding', monospace;}

	#mypage{
		width:900px;
		height:1500px;
	}
	
	#title{
    font-size: 25px;
}

		#wow{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
		
		#memberD{
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
		#memberD:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#memberD:active {
		position:relative;
		top:1px;
		}
		
		table { margin-left: auto; margin-right: auto;
 		    border-spacing: 20px;
 		    border-collapse: separate;}
		th{background: hsla(197, 62%, 74%, 0.603); width: 140px; text-align: center;}
		
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
				<body>
	<div id="mypage">
		<div>
  		    <h2 align="center">현재 비밀번호를 입력해주세요</h2>
	<div id="wow">
    <table>
    	  <br>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="password" name="password" id="password"></td>
		</tr>	
	</table>
		<br>
        <center><button id="memberD" style='cursor:pointer;'>확인</button></center>
        <br>
        <br>
        </div>
  
		<script>
		$(function(){
			$('#memberD').click(function(){
				
				var password = $('#password').val();
				var loginPwd = '<%= loginUser.getPassword() %>';
				var re =/^[a-zA-Z\d]{7,11}$/;
				
				if(password == loginPwd){
					var result = window.confirm('정말 탈퇴하시겠습니까?');
					if(result){
						location.href="<%= request.getContextPath() %>/delete.mem";
					} else {
						alert("탈퇴 실패! 관리자에게 문의 바랍니다.");
					}
				} else{
					alert("비밀번호가 옳지 않음");
					location.href="<%= request.getContextPath() %>/views/myPage/memberDelete.jsp";
				}
				
				//console.log("으아아ㅏㅇ");
			});
		});
		
		
		</script>
		
        <br>
        <br>
	  </div>
</body>
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>