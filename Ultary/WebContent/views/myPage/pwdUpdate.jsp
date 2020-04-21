<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/myPage_css/pwdUpdate.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="script.js"></script>
    <style>
.text{font-family: 'Nanum Gothic Coding', monospace;}

	#mypage{
		width:900px;
		height:1500px;
		table-layout: fixed;
	}
	
	#title{
    font-size: 25px;
}

		#myForm{border: 1px solid hsla(197, 62%, 74%, 0.603);
   				border-width: 20px;
    			background: white;
    			margin: 20px
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
		
		table {margin-left: auto; margin-right: auto;
 	 		   border-spacing: 35px;
 		   	   border-collapse: separate;
 		    
}
		th{background: hsla(197, 62%, 74%, 0.603); width: 140px; text-align: center;}
		td{text-align: center;}

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
					<img id="logoimg" src="<%= request.getContextPath() %>/image/logo.png" type="onclick" style='cursor:pointer;'>
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
                  <li class='active'>
                 	 <a href='#'>마이페이지</a>
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
            <form id="myForm" action="<%= request.getContextPath() %>/pwdupdate.mem" method="post">
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td>
				<input type="password" name="password" id="password">
			</td>
			<td align="left"><label id="pwdcheck"></label></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td>
				<input type="password" name="passwordN" id="passwordN" placeholder="최소 7자 이상">
			</td>
			<td align="left"><label id="pwdcheck1"></label></td>
		</tr>
		<tr>
			<th>새 비밀번호 확인</th>
			<td><input type="password" name="passwordNC" id="passwordNC"></td>
			<td align="left"><label id="pwdcheck2"></label></td>
		</tr>
	</table>
		<center><input type="submit" id="retoch" value="변경하기" onclick="return test()" style='cursor:pointer;'></center><br>
		
    </form>
   </div>
	</div>
</body>
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
		<script>
				 var pwdcheckUsable = false;    // 비번 중복 시false, 사용가능시 true
			     var pwdcheckChecked = false;   // 비번 중복확인을 했는지 안했는지 검사
			     var newpwdcheck = false; // 새 비밀번호와 새 비밀번호 확인이 일치 하는지 검사
			     var testnewpwd = false; // 새 비밀번호 정규식 검사 여부
			     var re =/^[a-zA-Z\d]{7,11}$/;  // 비번 정규식	
			    	 
			      	$('#password').val('');
			     	$('#password').focus();
					$('#password').on("propertychange change keyup paste input", function(){
						pwdcheck = false;
					});
			    
					//기존비번과 현재비번이 일치하는지 확인
			     	$('#password').keyup(function(){
			     		var password = $('#password');
			     		var oldPwd = '<%= loginUser.getPassword() %>';
			     		
			     		if(password.val() == oldPwd){
			     			$('#pwdcheck').text('현재 비밀번호와 일치합니다');
			            	 $('#pwdcheck').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'10px'});
			            	 pwdcheckUsable = true;
		                     pwdcheckChecked= true;
			     		}else{
			     			 $('#pwdcheck').text('현재 비밀번호가 아닙니다');
			                 $('#pwdcheck').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'10px'});
			                 pwdcheckUsable = false;
			                 pwdcheckChecked= false;
			     		}
			        });
			     	
					//새비번을 받아서 정규식확인, 정규식이 맞으면 디비에 보내서 저장
					//새로 새비번, 비번확인 맞는지 확인
					
					//패스워드 1과 패스워트 2 동일한지 검사.
				    $('#passwordNC').keyup(function(){
				    	var passwordN = $('#passwordN');
						var passwordNC = $('#passwordNC');
						
				       if(passwordN.val() == passwordNC.val()){
				          $('#pwdcheck2').text('비밀번호가 일치합니다');
				          $('#pwdcheck2').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
				          newpwdcheck = true;
				       }else{
				          $('#pwdcheck2').text('비밀번호가 일치하지 않습니다');
				          $('#pwdcheck2').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
				          newpwdcheck = false;
				       }
				    });
					
					// 
					function test() {
						if(pwdcheckUsable && pwdcheckChecked && newpwdcheck) {
							return true;
						} else {
							alert('다시 입력해주세요.');
							return false;
						}
					}
					
			     	//정규식을 이용한 에이작스
// 			     		if(!re.test(password.val())){ 	
// 			     		password.focus();
// 			     			$.ajax({
<%-- 			                    url:'<%= request.getContextPath() %>/pwdupdate.mem', --%>
// 			                    data:{password: password.val()},
// 			                    success: function(data){ //data로 반환 받아옴      
// 			                    	console.log(data);
// 			              if(data == "success"){
// 			                 $('#pwdcheck').text('현재 비밀번호와 일치합니다');
// 			            	 $('#pwdcheck').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'10px'});
// 			            	 pwdcheckUsable = true;
// 		                     pwdcheckChecked= true;
// 			              }	else {
// 			            	 $('#pwdcheck').text('현재 비밀번호가 아닙니다');
// 			                 $('#pwdcheck').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'10px'});
// 			                 pwdcheckUsable = false;
// 			                 pwdcheckChecked= false;
// 			                 }
// 			              }
// 			           });
// 			        }
			     	
			     	

				</script>
								
	<%-- 			   <script>
		$(function(){
			$('#memberD').click(function(){
				
				var password = $('#password').val();
				var loginPwd = <%= loginUser.getPassword() %>;
				
				if(password == loginPwd){
					response.sendRedirect("views/myPage/pwdUpdate.jsp");
					if(result){
						location.href="<%= request.getContextPath() %>/views/main/main.jsp";
					} else {
						alert("비밀번호 변경 실패! 다시 시도해주시길 바랍니다.");
						location.href="<%= request.getContextPath() %>/views/myPage/pwdUpdate.jsp";
					}
				}
			});
		});
		</script> --%>
	</div>
</body>
</html>