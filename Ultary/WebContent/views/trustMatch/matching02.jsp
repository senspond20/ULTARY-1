<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, member.model.vo.*, trust.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	/* Media proImg = (Media)session.getAttribute("proImg"); */
	/* proImg.getWebName() */

	PageInfo pi =(PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
 	int maxPage = pi.getMaxPage();
 	int startPage = pi.getStartPage();
 	int endPage =pi.getEndPage();
 	
 	String h_area1= request.getParameter("h_area1");
 	String h_area2= request.getParameter("h_area2");
 	String h_area3= request.getParameter("h_area3");
 	String check01= request.getParameter("check01");
 	String[] check = request.getParameterValues("check1");
 	String check2 = request.getParameter("check2");
 	
 	String check1 = "";
 	for(int i=0;i<check.length;i++){ 
		check1  += "&check1="+ check[i]; 
 	}
 	
 	String query = "&h_area1="+h_area1+"&h_area2="+h_area2+"&h_area3="+h_area3+"&check01="+check01+check1+"&check2="+check2;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티용</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching02.css">
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
            <div id="matching">
			<h1 id="title">위탁검색</h1>
			<p id="title-1">울타리 이용자들의 위탁 품앗이 공간</p>
			<hr>
			<br clear="all">
			</div>
			<div id="page">
				<div id="page1">
				<div id="top-bar">검색필터 펼치기</div>
				<div id="introview" style="display:none;">
				<form>
				<div id="content-box">
		    	<div id="matcontent">
		    		<table>
						<tr>
							<td><div id="m-in" class="bar">지역필터</div>
								<div id=place1 class="selectall">
								<select name="place1" class="pl1">
									<option value="kw">강원도</option>
									<option value="kk">경기도</option>
									<option value="seoul">서울시</option>
									<option value="etc" selected>시/도</option>
								</select>
								<select name="nation1" class="pl1">
									<option value="kw">강원도</option>
									<option value="kk">경기도</option>
									<option value="seoul">서울시</option>
									<option value="etc" selected>군/구</option>
								</select>
								<input type="text" placeholder="동/읍을 입력해주세요." class="pl1" id="text1">
								<input type="radio" name="radio1"><label>위탁</label>
								<input type="radio" name="radio1"><label>방문</label>
								<input type="radio" name="radio1"><label>산책</label>
								
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
								<input type="checkbox" name="check2" class="check" value="강아지"><label>강아지</label>
								<input type="checkbox" name="check2" class="check" value="고양이"><label>고양이</label>
								<input type="checkbox" name="check2" class="check" value="설치류"><label>설치류</label><br>
								<input type="checkbox" name="check2" class="check" value="어류"><label>어류&nbsp;</label>
								<input type="checkbox" name="check2" class="check" value="파충류"><label>파충류</label>
								<input type="checkbox" name="check2" class="check" value="조류"><label>조류&nbsp; </label>
								<input type="checkbox" name="check2" class="check" value="기타"><label>기타&nbsp; </label>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<button id="search01" onclick='location.href="serch1.s1"'>검색</button>
							</td>
						</tr>
					</table>
				</div>
	   			 </div>
	   			 </form>
				</div>
				<script>
				$(function(){
					$('#top-bar').click(function(){
						$(this).next().slideToggle();
					});
				});
					
			
				</script>
				<h3 style="text-align:center;">조회결과</h3>
			</div>
			
			<%if(list.isEmpty()){ %>
				<h2>조회된 리스트가 없습니다.</h2>
			<% } else{%>
				<% for(Member m :list){ %>
					<div id="content1" class="content-profile">
					<img src="/Ultary/views/trustMatch/photo.jpg" id="profile" class="profile-photo">
					<div class="infoDiv">
					<span class="name" id="name1"><%=m.getNickname() %></span><br><br>
					<span class="address" id="class1"><%=m.getAddress()%></span>
					</div>
					<div class="infobutton1">관심등록</div><button id="like">좋아욤</button>
					<div class="infobutton2" ><a href="<%=request.getContextPath() %>/MemberDetail.tu?memberid=<%=m.getMemberId()%>">상세보기</a></div>
					</div>
				<%} %>
			<%} %>
			<div class="pagingArea" align="center">
		<!-- 페이징 -->
		<% if(!list.isEmpty()){ %>
			<!-- 맨 처음으로 가는 버튼 만들기-->
			<button type ="button" onclick="location.href='<%=request.getContextPath()%>/SerchMember.sc?currentPage=1<%=query%>'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button type="button" onclick="location.href='<%=request.getContextPath() %>/SerchMember.sc?currentPage=<%=currentPage-1 %><%=query %>'" id="beforeBtn">&lt;</button>	
			<script>
				if(<%=currentPage%> <=1){
					$('#beforeBtn').attr('disabled','true');
				}
			</script>
			
			<!-- 10개 페이지 목록 -->
			<% for(int p = startPage; p<=endPage;p++){ %>
				<%if(p == currentPage){ %>
			<button id="choosen" disabled><%=p %></button>
				<%} else { %>
					<button type="button" id="numBtn" onclick="location.href='<%=request.getContextPath()%>/SerchMember.sc?currentPage=<%=p%><%=query%>'"><%= p %></button>
				<%} %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button type="button" id="afterBtn" onclick="location.href='<%=request.getContextPath() %>/SerchMember.sc?currentPage=<%=currentPage+1 %><%=query%>'">&gt;</button>
			<script>
				if(<%=currentPage%> >= <%=maxPage%>){
					$('#afterBtn').attr('disabled','true');
				}
			</script>
			
			<!-- 맨 끝으로 -->
			<button type="button" onclick="location.href='<%=request.getContextPath() %>/SerchMember.sc?currentPage=<%=maxPage %><%=query%>'">&gt;&gt;</button>
			
		<% } %>
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