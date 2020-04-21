<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,post.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList<Post> klist = (ArrayList<Post>)request.getAttribute("klist");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
<%-- 	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/pet_know.css"> --%>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/board.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/togglebtn.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/cm_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/cm_aside.jsp" %>
				<section>
				<div class="maincap">
        			<p class="cap_p_head">펫지식</p><br>
        			<p class="cap_p_tag">반려동물에 관한 지식을  공유하는 게시판 입니다.</p>
        			<hr id="mainhr">
        		</div>
        			<form action="<%= request.getContextPath() %>/commnunity/cmSearch.po" method="post">
        			<div class="search_wrap">
        			<div class="searchselect">
		        		<select id="date">
		        			<option value="all" selected>전체기간</option>
		        			<option value="1day">1일</option>
		        			<option value="1week">1주</option>
		        			<option value="1month">1달</option>
		        		</select>
		        		<select id="searchcon">
		        			<option value="title+content" selected>제목+내용</option>
		        			<option value="onlytitle">제목만</option>
		        			<option value="writer">작성자</option>
		        		</select>
        				<input type="text" size=20 placeholder="검색할 내용을 입력하세요" class="textbox" name="textbox">
        				<input type="hidden" size=20 placeholder="검색할 내용을 입력하세요" class="textbox" name="textbox">
        				<input type="submit" value="검색" class="find">
        				<input type="hidden" value="검색" class="find" name="find">
        			</div>
        			</div>
        		</form>
        		<div class="array_wrap">
        			<hr id="hr2">
        			<select>
        				<option>최신순</option>
        				<option>추천순</option>
        			</select>
        			<div class="switch_wrap">
        			<label class="switch">
					  <input type="checkbox">
					  <span class="slider round"></span><br>
					  <br>
					</label>
					</div>
        		</div>
     	<div class="cmcontent">
     		<div class="cm_wrap">
     			<div class="board_all">
     				<div class="boardhead">
     					<div class="num">No</div>
     					<div class="tit">제목</div>
     					<div class="writer">작성자</div>
     					<div class="wdate">작성일</div>
     					<div class="recommend">추천</div>
     					<div class="view">조회</div>
     				</div>
					<div class="boardbody">
     				<% if(klist.isEmpty()) { %>
     					<div>존재하는 글 없음</div>
     				<% } else { 
     					for(Post n : klist){
     				%>	
     					<div class="boardcontent">
	     					<div class="num"><%= n.getPostNum() %></div>
		     				<div class="tit"><a href="#"><%= n.getPostTitle() %></a></div>
		     				<div class="writer"><%= n.getMemberid() %></div>
		     				<div class="wdate"><%= n.getPostDate() %></div>
		     				<div class="recommend"><%= n.getPostLike() %></div>
		     				<div class="view"><%= n.getPostclick() %></div>
     					</div>	
     				<div class="boardopen">
	     				<div class="oprofile">
	     						<img src="image/account.PNG">
	  					</div>
	  					<div class="opencontent">
	  						<div class="otitle"><a href="#"><%= n.getPostTitle() %></a></div>
	  						<div class="odetail"><%= n.getPostContent() %></div>
	  						<div class="commen"><label class="cwriter">댓글쓴</label><label>댓글댓글</label></div>
	  						</div>
	  						<div class="likecount">
	  						<img src="<%=request.getContextPath()%>/image/heart.png">&nbsp;32 &nbsp;&nbsp;
	  						<img src="<%=request.getContextPath()%>/image/like.png">&nbsp;100
	  					</div>
	     			</div>
     				<%
     					} 
     				}
     				%> 
     				</div>
     					<div class="wbtn_wrap"><div class="wbtn"><img src="<%=request.getContextPath()%>/image/연필.png" id="pencil">글쓰기</div></div>
	     		</div>
	     		<!-- 페이징 -->
	     		<div class="pagingArea" align="center">
	     		<% if(!klist.isEmpty()) { %>
	     			<!-- 맨 처음으로 가는 버튼 -->
	     				<button onclick="location.href='<%=request.getContextPath()%>/cmklist.po?currentPage=1'">&lt;&lt;</button>
	     			<!-- 이전 페이지로  -->
				<button onclick="location.href='<%= request.getContextPath()%>/cmklist.po?currentPage=<%= currentPage -1 %>'" id="beforeBtn">&lt;</button>
				<script>
					if(<%= currentPage %> <= 1){
					$('#beforeBtn').attr('disabled','true');
					}
					</script>
					<!-- 10개 페이지 목록 -->
					<% for(int p = startPage; p<= endPage;p++){ %>
						<% if(p ==currentPage){ %>
					<button id="choosen" disabled><%= p %></button>
						<% } else {%>
							<button id="numBtn" onclick="location.href='<%=request.getContextPath() %>/cmklist.po?currentPage=<%= p %>'"><%= p %></button>
						<% } %>
					<% } %>
					<!-- 다음 페이지로 -->	
					<button id="afterBtn" onclick="location.href='<%= request.getContextPath()%>/cmklist.po?currentPage=<%= currentPage+1 %>'"	>&gt;</button>
					<script>
						if(<%= currentPage %> >= <%= maxPage %>){
							$('#afterBtn').attr('disabled','true');
						}
					</script>
					<!-- 맨 끝으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/cmklist.po?&currentPage=<%=maxPage %>'">&gt;&gt;</button>
						<% } %>
	     			</div>
	     		</div>
	     		</div>
	     		</section>
     			</div>
			</div>
			<footer>from.hoseong</footer>
		</div>
		<script>
				$(function(){
					$('.boardcontent div').mouseenter(function(){
						$(this).parent().css({'background':'#EAEAEA','cursor':'pointer'});
					}).mouseout(function(){
						$(this).parent().css('background','none');
					}).click(function(){
						var num =$(this).parent().children().eq(0).text();
						location.href="<%= request.getContextPath() %>/cmdetail.po?pno=" + num;
					});
				});
				var check = $("input[type='checkbox']");
				check.click(function(){
					$('.boardopen').slideToggle();
				});
				
				var text = $("input[type='text']");
				var btn = $("input[type='submit']");
				
				btn.click(function(){
					if(text.val() == ""){
						alert('검색어를 입력해주세요');
						return false;
					}
					return true;
				});
				 $('.wbtn').click(function(){
			        	location.href="<%= request.getContextPath() %>/views/community/cmpostWrite.jsp?cnum=3";
			        });
		</script>
</body>
</html>