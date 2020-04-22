<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="member.model.vo.*,post.model.vo.*, java.util.ArrayList"%>
    
<% 
   ArrayList<Post> slist = (ArrayList)request.getAttribute("list"); 
  
	String searchtext = (String)request.getAttribute("searchtext");

	Media proImg = (Media)session.getAttribute("proImg");

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
<title>검색결과</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/all_search.css">
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/togglebtn.css">
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/pagingbtn.css">
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
			<form action="<%= request.getContextPath() %>/commnunity/cmSearch.po" method="post" onsubmit="return check();">
           <div id="main">
              <p id="p1"><%= searchtext %>로 검색한 결과 입니다</p>
              <p id="p2">검색 결과  : <%= slist.size() %>개의 결과가 나왔습니다<p>
              <hr class="hr">
           </div>
              <div class="selecttop">
                 <div class="searchselect">
                    <select>
                       <option value="all" selected>전체기간</option>
                       <option value="1day">1일</option>
                       <option value="1week">1주</option>
                       <option value="1month">1달</option>
                    </select>
                    <select>
                       <option value="allboard" selected>전체게시판</option>
                       <option value="daily">펫일상</option>
                       <option value="knowledge">펫지식</option>
                       <option value="review">펫리뷰</option>
                    </select>
                    <select>
                       <option value="title+content" selected>제목+내용</option>
                       <option value="onlytitle">제목만</option>
                       <option value="writer">작성자</option>
                    </select>
                    <input type="text" size=20 placeholder="검색할 내용을 입력하세요" class="textbox">
                    &nbsp;
                    <input type="submit" value="검색" class="find">
                 </div>
              </div>
                 </form>
              <div class="open">
              <hr class="mainhr">
                 <div class="wrap_openbtn">
                 <select>
                    <option selected>추천순</option>
                    <option>최신순</option>
                 </select>   
                 <label class="switch">
                 <input type="checkbox">
                 <span class="slider round"></span><br>
               </label>
               </div>
              </div>

        <div class="cmcontent">
           <div class="cm_wrap">
              <div class="board_all">
                 <div class="boardhead">
                    <div class="num">No</div>
                   <div class="allcategory">카테고리</div>
                    <div class="tit">제목</div>
                    <div class="writer">작성자</div>
                    <div class="wdate">작성일</div>
                    <div class="recommend">추천</div>
                    <div class="view">조회</div>
                 </div>
                 <div class="boardbody">
                    <% if(slist.isEmpty()) {  %>
                    <div>검색 결과 없음  </div>
                    <% } else {
                           for(Post p : slist){
                    %>
                       <% String cname ="";
                       switch(p.getCategorynum()){
                       case 2: cname ="펫일상"; break;
                       case 3: cname ="펫지식";break;
                       case 4: cname ="펫리뷰";break;
                       case 5: cname ="펫분양";break;
                       }
                       %>
                       <div class="boardcontent">
                      <div class="num"><%= p.getPostNum() %></div>
                      <div class="allcategory"><%= cname %></div>
                      <div class="tit"><%= p.getPostTitle() %></div>
                      <div class="writer"><%= p.getMemberid() %></div>
                      <div class="wdate"><%= p.getPostDate() %></div>
                      <div class="recommend"><%= p.getPostLike() %></div>
                      <div class="view"><%= p.getPostclick() %></div>
                      </div>      
                      <div class="boardopen">
                    <div class="oprofile">
                    <img class="sectionpic" src="<%= request.getContextPath() %>/uploadFiles/<%= proImg.getWebName() %>">
                    </div>
                       <div class="opencontent">
                       <div class="otitle"><a href="#"><%= p.getPostTitle() %></a></div>
                       <div class="odetail"><%= p.getPostContent() %></div>
                       <div class="commen"><label class="cwriter">댓글쓴</label><label>댓글댓글</label></div>
                       </div>
                       <div class="likecount">
                       <img src="<%=request.getContextPath()%>/images/heart.png">&nbsp;32 &nbsp;&nbsp;
                       <img src="<%=request.getContextPath()%>/images/like.png">&nbsp;100
                    </div>
                 </div>
                 <%
                           }
                    }   
                    %>
                             
                 <div class="wbtn_wrap"><div class="wbtn"><img src="<%=request.getContextPath()%>/image/연필.png" id="pencil">글쓰기</div></div>
              </div>
              </div>
              </div>
              <!-- 페이징 -->
              <div class="pagingArea" align="center">
              <% if(!slist.isEmpty()) { %>
                 <!-- 맨 처음으로 가는 버튼 -->
                    <button onclick="location.href='<%=request.getContextPath()%>/cmSearch.po?currentPage=1'">&lt;&lt;</button>
                 <!-- 이전 페이지로  -->
            <button onclick="location.href='<%= request.getContextPath()%>/cmSearch.po?currentPage=<%= currentPage -1 %>'" id="beforeBtn">&lt;</button>
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
               <button id="numBtn" onclick="location.href='<%=request.getContextPath() %>/cmSearch.po?currentPage=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
         <!-- 다음 페이지로 -->   
         <button id="afterBtn" onclick="location.href='<%= request.getContextPath()%>/cmSearch.po?currentPage=<%= currentPage+1 %>'"   >&gt;</button>
         <script>
            if(<%= currentPage %> >= <%= maxPage %>){
               $('#afterBtn').attr('disabled','true');
            }
         </script>
         <!-- 맨 끝으로 -->
         <button onclick="location.href='<%= request.getContextPath() %>/cmSearch.po?currentPage=<%=maxPage %>'">&gt;&gt;</button>
      <% } %>
              </div>
           <script>
           var check = $("input[type='checkbox']");
         check.click(function(){
            $('.boardopen').slideToggle();
         });
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
         $('.wbtn').click(function(){
        	location.href="<%= request.getContextPath() %>/views/commnunity/cmpostWrite.jsp"
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