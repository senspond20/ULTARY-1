<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/navaside.css">
</head>
<body>
			<nav>
				<div id='cssmenu'>
					<ul>
						<li class='active'>
							<a href="<%= request.getContextPath() %>/post.tl">내울타리</a>
							<ul id="menu1">
								<li>
									<a href="<%= request.getContextPath() %>/post.tl">타임라인</a>
								</li>
								<li><a href="<%= request.getContextPath() %>/views/myUltary/postWrite.jsp">게시글작성</a></li>
								<li><a href="<%= request.getContextPath() %>/markmember.mem">관심회원</a></li>
								<li><a href="<%= request.getContextPath() %>/views/myUltary/markPost.jsp">게시글 즐겨찾기</a></li>
								<li><a href="<%= request.getContextPath() %>/views/myUltary/trustEvm.jsp">내 위탁환경</a></li>
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
						<li><a href='#'>마이페이지</a>
							<ul id="menu4">
								<li><a href='#'>내 정보 관리</a></li>
								<li><a href='#'>비밀번호변경</a></li>
								<li><a href='#'>회원 탈퇴</a></li>
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
</body>
</html>